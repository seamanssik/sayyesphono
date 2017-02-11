<?php
class ModelFidoFaqTestimonial extends Model {

	public function addTopic($data = array()) {

		$this->db->query("INSERT INTO ". DB_PREFIX . "faq_testimonial_topic SET status = '1', sort_order = '" . (int)$data['sort_order'] . "'");

		$topic_id = $this->db->getLastId();

		foreach ($data['topic'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "faq_testimonial_topic_description SET topic_id = '" . (int)$topic_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}

	}

	public function editTopic($topic_id, $data = array()) {

		$this->db->query("UPDATE " . DB_PREFIX . "faq_testimonial_topic SET sort_order = '" . (int)$data['sort_order'] . "' WHERE topic_id = '" . (int)$topic_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "faq_testimonial_topic_description WHERE topic_id = '" . (int)$topic_id . "'");

		foreach ($data['topic'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "faq_testimonial_topic_description SET topic_id = '" . (int)$topic_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "'");
		}

	}

	public function deleteTopic($topic_id) {
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "faq_testimonial_topic WHERE topic_id = '" . (int)$topic_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "faq_testimonial_topic_description WHERE topic_id = '" . (int)$topic_id . "'");

		// Revert testimonial
		$this->db->query("UPDATE " . DB_PREFIX . "faq_testimonial SET topic_id = '1' WHERE topic_id = '" . (int)$topic_id . "'");
		
	}

	public function getTopicList() {

		$faq_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_testimonial_topic ft
										LEFT JOIN " . DB_PREFIX . "faq_testimonial_topic_description fdt ON (ft.topic_id = fdt.topic_id)
										WHERE fdt.language_id = '" . (int)$this->config->get('config_language_id') . "'
										ORDER BY ft.sort_order, fdt.name ASC");
		foreach ($query->rows as $result) {
			$faq_data[] = array(
				'topic_id' 		=> $result['topic_id'],
				'name'    		=> $result['name'],
				'status'     	=> $result['status'],
				'sort_order' 	=> $result['sort_order']
			);
		}
		return $faq_data;
	}

	public function getTopicById($topic_id) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_testimonial_topic ft
										LEFT JOIN " . DB_PREFIX . "faq_testimonial_topic_description fdt ON (ft.topic_id = fdt.topic_id)
										WHERE fdt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND ft.topic_id = '" . $topic_id . "'
										ORDER BY ft.sort_order, fdt.name ASC");

		return $query->row;
	}

	public function getTopicDescriptionById($topic_id) {

		$category_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_testimonial_topic_description WHERE topic_id = '" . (int)$topic_id . "'");

		foreach ($query->rows as $result) {
			$category_description_data[$result['language_id']] = array(
				'name'	=> $result['name']
			);
		}

		return $category_description_data;

	}

	public function addFaq($data) {
		$this->db->query("INSERT INTO ". DB_PREFIX . "faq_testimonial SET topic_id = '" . (int)$data['topic_id'] . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "'");

		$faq_id = $this->db->getLastId();

		foreach ($data['faq_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "faq_testimonial_description SET
				faq_id = '" . (int)$faq_id . "',
				language_id = '" . (int)$language_id . "',
				title = '" . $this->db->escape($value['title']) . "',
				meta_description = '" . $this->db->escape($value['meta_description']) . "',
				author_name = '" . $this->db->escape($value['author_name']) . "',
				moderator_name = '" . $this->user->getUsername() . "',
				description = '" . $this->db->escape($value['description']) . "'");
		}
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET
				query = 'faq_id=" . (int)$faq_id . "',
				keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->db->query("INSERT INTO " . DB_PREFIX . "faq_testimonial_to_store SET faq_id = '" . (int)$faq_id . "', store_id = '0'");

		$this->cache->delete('faq');
	}

	public function editFaq($faq_id, $data) {

		$this->db->query("UPDATE " . DB_PREFIX . "faq_testimonial SET topic_id = '" . (int)$data['topic_id'] . "', status = '" . (int)$data['status'] . "', sort_order = '" . (int)$data['sort_order'] . "' WHERE faq_id = '" . (int)$faq_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "faq_testimonial_description WHERE faq_id = '" . (int)$faq_id . "'");

		foreach ($data['faq_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "faq_testimonial_description SET
				faq_id = '" . (int)$faq_id . "',
				language_id = '" . (int)$language_id . "',
				title = '" . $this->db->escape($value['title']) . "',
				meta_description = '" . $this->db->escape($value['meta_description']) . "',
				author_name = '" . $this->db->escape($value['author_name']) . "',
				moderator_name = '" . $this->user->getUsername() . "',
				description = '" . $this->db->escape($value['description']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'faq_testimonial_id=" . (int)$faq_id. "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET
				query = 'faq_testimonial_id=" . (int)$faq_id . "',
				keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('faq');
	}

	public function deleteFaq($faq_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "faq_testimonial WHERE faq_id = '" . (int)$faq_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "faq_testimonial_description WHERE faq_id = '" . (int)$faq_id . "'");
		$query = $this->db->query("SELECT faq_id FROM " . DB_PREFIX . "faq_testimonial WHERE topic_id = '" . (int)$faq_id . "'");
		foreach ($query->rows as $result) {
			$this->deleteFaq($result['faq_id']);
		}
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'faq_testimonial_id=" . (int)$faq_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "faq_testimonial_to_store WHERE faq_id = '" . (int)$faq_id . "'");
		$this->cache->delete('faq');
	}

	public function getFaq($faq_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'faq_testimonial_id=" . (int)$faq_id . "') AS keyword FROM " . DB_PREFIX . "faq_testimonial WHERE faq_id = '" . (int)$faq_id . "'");
		return $query->row;
	} 

	public function getFaqs() {
		$faq_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_testimonial f
										LEFT JOIN " . DB_PREFIX . "faq_testimonial_description fd ON (f.faq_id = fd.faq_id)
											WHERE fd.language_id = '" . (int)$this->config->get('config_language_id') . "'
												ORDER BY f.sort_order, fd.title ASC");

		foreach ($query->rows as $result) {
			$faq_data[] = array(
				'faq_id'     => $result['faq_id'],
				'title'      => $result['title'],
				'status'     => $result['status'],
				'sort_order' => $result['sort_order']
			);

		}

		return $faq_data;
	}

	public function getTopic($faq_id) {
		$query = $this->db->query("SELECT title, topic_id FROM " . DB_PREFIX . "faq_testimonial f
									LEFT JOIN " . DB_PREFIX . "faq_testimonial_description fd ON (f.faq_id = fd.faq_id)
									WHERE
										f.faq_id = '" . (int)$faq_id . "' AND
										fd.language_id = '" . (int)$this->config->get('config_language_id') . "'
											ORDER BY f.sort_order, fd.title ASC");
		$faq_info = $query->row;
		if ($faq_info['topic_id']) {
			return $this->getTopic($faq_info['topic_id'], $this->config->get('config_language_id')) . $this->language->get('text_separator') . $faq_info['title'];
		} else {
			return $faq_info['title'];
		}
	}

	public function getFaqDescriptions($faq_id) {
		$faq_description_data = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_testimonial_description WHERE faq_id = '" . (int)$faq_id . "'");
		foreach ($query->rows as $result) {
			$faq_description_data[$result['language_id']] = array(
				'title'            => $result['title'],
				'meta_description' => $result['meta_description'],
				'description'      => $result['description'],
				'author_name'		=> $result['author_name'],
				'moderator_name'		=> $result['moderator_name']
			);
		}
		return $faq_description_data;
	}

	public function getFaqStores($faq_id) {
		$faq_store_data = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_testimonial_to_store WHERE faq_id = '" . (int)$faq_id . "'");
		foreach ($query->rows as $result) {
			$faq_store_data[] = $result['store_id'];
		}
		return $faq_store_data;
	}

	public function getTotalFaqs() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "faq_testimonial");
		return $query->row['total'];
	}

	public function checkFaqs() {
		$create_faq = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "faq_testimonial` (`faq_id` int(11) NOT NULL auto_increment, `topic_id` int(11) NOT NULL default '0', `status` int(1) NOT NULL default '0', `sort_order` int(3) NOT NULL default '0', PRIMARY KEY  (`faq_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
		$this->db->query($create_faq);
		$create_faq_descriptions = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "faq_testimonial_description` (`faq_id` int(11) NOT NULL default '0', `language_id` int(11) NOT NULL default '0', `title` varchar(64) collate utf8_bin NOT NULL default '', `meta_description` varchar(255) collate utf8_bin, `description` text collate utf8_bin NOT NULL, PRIMARY KEY  (`faq_id`,`language_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
		$this->db->query($create_faq_descriptions);
		$create_faq_to_store = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "faq_testimonial_to_store` (`faq_id` int(11) NOT NULL, `store_id` int(11) NOT NULL, PRIMARY KEY  (`faq_id`, `store_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
		$this->db->query($create_faq_to_store);
	}
}
?>
