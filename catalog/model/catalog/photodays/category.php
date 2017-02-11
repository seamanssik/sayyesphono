<?php
class ModelCatalogPhotodaysCategory extends Model {
	public function getCategory($photodays_category_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "photodays_category c LEFT JOIN " . DB_PREFIX . "photodays_category_description cd ON (c.photodays_category_id = cd.photodays_category_id) LEFT JOIN " . DB_PREFIX . "photodays_category_to_store c2s ON (c.photodays_category_id = c2s.photodays_category_id) WHERE c.photodays_category_id = '" . (int)$photodays_category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row;
	}

	public function getCategories($photodays_parent_id = 0) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_category c LEFT JOIN " . DB_PREFIX . "photodays_category_description cd ON (c.photodays_category_id = cd.photodays_category_id) LEFT JOIN " . DB_PREFIX . "photodays_category_to_store c2s ON (c.photodays_category_id = c2s.photodays_category_id) WHERE c.photodays_parent_id = '" . (int)$photodays_parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");

		return $query->rows;
	}

	public function getCategoryLayoutId($photodays_category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_category_to_layout WHERE photodays_category_id = '" . (int)$photodays_category_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return 0;
		}
	}

	public function getTotalCategoriesByCategoryId($photodays_parent_id = 0) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "photodays_category c LEFT JOIN " . DB_PREFIX . "photodays_category_to_store c2s ON (c.photodays_category_id = c2s.photodays_category_id) WHERE c.photodays_parent_id = '" . (int)$photodays_parent_id . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row['total'];
	}
}