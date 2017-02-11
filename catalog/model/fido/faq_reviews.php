<?php
class ModelFidoFaqReviews extends Model {

	// Get topic #START
	// ================
	public function getTopicList() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_reviews_topic ft
			LEFT JOIN " . DB_PREFIX . "faq_reviews_topic_description fdt ON (ft.topic_id = fdt.topic_id)
			WHERE
				fdt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND
				ft.status = '1'
					ORDER BY ft.sort_order");
		return $query->rows;
	}
	// ==============
	// Get topic #END

	public function addFaq($data){
		$this->db->query("INSERT INTO ". DB_PREFIX . "faq_reviews SET
			topic_id = '0',
			status = '0',
			sort_order = '0'");
		$faq_id = $this->db->getLastId();

		$this->db->query("INSERT INTO " . DB_PREFIX . "faq_reviews_description SET
				faq_id = '" . (int)$faq_id . "',
				language_id = '" . (int)$this->config->get('config_language_id') . "',
				description = '" . $this->db->escape($data['author_review']) . "',
				author_name = '" . $this->db->escape($data['author_name']) . "'");

		$this->db->query("INSERT INTO " . DB_PREFIX . "faq_reviews_to_store SET
			faq_id = '" . (int)$faq_id . "'");
		$this->cache->delete('faq_reviews');
		// , store_id = '0'
	}

	public function getTopic($faq_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "faq_reviews f
			LEFT JOIN " . DB_PREFIX . "faq_reviews_description fd ON (f.faq_id = fd.faq_id)
			LEFT JOIN " . DB_PREFIX . "faq_reviews_to_store f2s ON (f.faq_id = f2s.faq_id)
			WHERE
				f.faq_id = '" . (int)$faq_id . "' AND
				fd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND
				f.status = '1'");
		return $query->row;
		// f2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND
	}

	public function getTotalTopics($data = array()) {
		$query = $this->db->query("SELECT COUNT(DISTINCT f.faq_id) AS total FROM " . DB_PREFIX . "faq_reviews f
			LEFT JOIN " . DB_PREFIX . "faq_reviews_description fd ON (f.faq_id = fd.faq_id)
			LEFT JOIN " . DB_PREFIX . "faq_reviews_to_store f2s ON (f.faq_id = f2s.faq_id)
			WHERE
				f.topic_id = '" . (int)$data['topic_id'] . "' AND
				fd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND
				f.status = '1'
					ORDER BY f.sort_order");

		return $query->row['total'];

		// f2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND
	}

	public function getTopics($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "faq_reviews f
			LEFT JOIN " . DB_PREFIX . "faq_reviews_description fd ON (f.faq_id = fd.faq_id)
			LEFT JOIN " . DB_PREFIX . "faq_reviews_to_store f2s ON (f.faq_id = f2s.faq_id)
			WHERE
				f.topic_id = '" . (int)$data['topic_id'] . "' AND
				fd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND
				f.status = '1'";

		$sql .= " GROUP BY f.faq_id";
		$sql .= " ORDER BY f.sort_order";

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;

		// f2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND
	}

	public function getTotalFaqsByTopicId($topic_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "faq_reviews f
			LEFT JOIN " . DB_PREFIX . "faq_reviews_to_store f2s ON (f.faq_id = f2s.faq_id)
			WHERE
				f.topic_id = '" . (int)$topic_id . "' AND
				f.status = '1'");
		return $query->row['total'];
		
		// f2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND
	}
}