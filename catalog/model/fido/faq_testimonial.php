<?php
class ModelFidoFaqTestimonial extends Model {

	// Get topic #START
	// ================
	public function getTopicList() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_testimonial_topic ft
			LEFT JOIN " . DB_PREFIX . "faq_testimonial_topic_description fdt ON (ft.topic_id = fdt.topic_id)
			WHERE
				fdt.language_id = '" . (int)$this->config->get('config_language_id') . "' AND
				ft.status = '1'
					ORDER BY ft.sort_order");
		return $query->rows;
	}
	// ==============
	// Get topic #END

	public function addFaq($data){
		$this->db->query("INSERT INTO ". DB_PREFIX . "faq_testimonial SET
			topic_id = '0',
			status = '0',
			sort_order = '0'");
		$faq_id = $this->db->getLastId();

		$this->db->query("INSERT INTO " . DB_PREFIX . "faq_testimonial_description SET
				faq_id = '" . (int)$faq_id . "',
				language_id = '" . (int)$this->config->get('config_language_id') . "',
				title = '" . $this->db->escape($data['title']) . "',
				author_name = '" . $this->db->escape($data['author_name']) . "'");

		$this->db->query("INSERT INTO " . DB_PREFIX . "faq_testimonial_to_store SET
			faq_id = '" . (int)$faq_id . "'");
		$this->cache->delete('faq_testimonial');
	}

	public function getTopic($faq_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "faq_testimonial f
			LEFT JOIN " . DB_PREFIX . "faq_testimonial_description fd ON (f.faq_id = fd.faq_id)
			LEFT JOIN " . DB_PREFIX . "faq_testimonial_to_store f2s ON (f.faq_id = f2s.faq_id)
			WHERE
				f.faq_id = '" . (int)$faq_id . "' AND
				fd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND
				f.status = '1'");
		return $query->row;
		// f2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND
	}

	public function getTopics($topic_id = 0) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "faq_testimonial f
			LEFT JOIN " . DB_PREFIX . "faq_testimonial_description fd ON (f.faq_id = fd.faq_id)
			LEFT JOIN " . DB_PREFIX . "faq_testimonial_to_store f2s ON (f.faq_id = f2s.faq_id)
			WHERE
				f.topic_id = '" . (int)$topic_id . "'AND
				fd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND
				f.status = '1'
					ORDER BY f.sort_order");
		return $query->rows;
		// f2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND
	}

	public function getTotalFaqsByTopicId($topic_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "faq_testimonial f
			LEFT JOIN " . DB_PREFIX . "faq_testimonial_to_store f2s ON (f.faq_id = f2s.faq_id)
			WHERE
				f.topic_id = '" . (int)$topic_id . "' AND
				f.status = '1'");
		return $query->row['total'];
		// f2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND
	}
}