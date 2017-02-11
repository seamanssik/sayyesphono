<?php
class ModelCatalogInformation extends Model {
	public function getInformation($information_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "information i LEFT JOIN " . DB_PREFIX . "information_description id ON (i.information_id = id.information_id) LEFT JOIN " . DB_PREFIX . "information_to_store i2s ON (i.information_id = i2s.information_id) WHERE i.information_id = '" . (int)$information_id . "' AND id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1'");

		return $query->row;
	}

	public function getInformations() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "information i LEFT JOIN " . DB_PREFIX . "information_description id ON (i.information_id = id.information_id) LEFT JOIN " . DB_PREFIX . "information_to_store i2s ON (i.information_id = i2s.information_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1' ORDER BY i.sort_order, LCASE(id.title) ASC");

		if ($query->num_rows) {
			return $query->rows;
		} else {
			return false;
		}
	}

	public function getLegendImages($legend_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "legend_image WHERE legend_id = '" . (int)$legend_id . "' ORDER BY sort_order ASC");

		if ($query->num_rows) {
			return $query->rows;
		} else {
			return false;
		}
	}

	public function getLegends() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "legend i LEFT JOIN " . DB_PREFIX . "legend_description id ON (i.legend_id = id.legend_id) LEFT JOIN " . DB_PREFIX . "legend_to_store i2s ON (i.legend_id = i2s.legend_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1' ORDER BY LCASE(id.title) ASC");

		if ($query->num_rows) {
			return $query->rows;
		} else {
			return false;
		}
	}

	public function getInformationLayoutId($information_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "information_to_layout WHERE information_id = '" . (int)$information_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return 0;
		}
	}
}