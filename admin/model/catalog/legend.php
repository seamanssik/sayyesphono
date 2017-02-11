<?php
class ModelCatalogLegend extends Model {
	public function addLegend($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "legend SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "'");

		$legend_id = $this->db->getLastId();

		foreach ($data['legend_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "legend_description SET legend_id = '" . (int)$legend_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		if (isset($data['legend_store'])) {
			foreach ($data['legend_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "legend_to_store SET legend_id = '" . (int)$legend_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['legend_image'])) {
			foreach ($data['legend_image'] as $legend_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "legend_image SET legend_id = '" . (int)$legend_id . "', image = '" . $this->db->escape($legend_image['image']) . "', sort_order = '" . (int)$legend_image['sort_order'] . "'");
			}
		}

		$this->cache->delete('legend');

		return $legend_id;
	}

	public function editLegend($legend_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "legend SET sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "' WHERE legend_id = '" . (int)$legend_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "legend_description WHERE legend_id = '" . (int)$legend_id . "'");

		foreach ($data['legend_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "legend_description SET legend_id = '" . (int)$legend_id . "', language_id = '" . (int)$language_id . "', title = '" . $this->db->escape($value['title']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "legend_to_store WHERE legend_id = '" . (int)$legend_id . "'");

		if (isset($data['legend_store'])) {
			foreach ($data['legend_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "legend_to_store SET legend_id = '" . (int)$legend_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "legend_image WHERE legend_id = '" . (int)$legend_id . "'");

		if (isset($data['legend_image'])) {
			foreach ($data['legend_image'] as $legend_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "legend_image SET legend_id = '" . (int)$legend_id . "', image = '" . $this->db->escape($legend_image['image']) . "', sort_order = '" . (int)$legend_image['sort_order'] . "'");
			}
		}

		$this->cache->delete('legend');
	}

	public function deleteLegend($legend_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "legend WHERE legend_id = '" . (int)$legend_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "legend_description WHERE legend_id = '" . (int)$legend_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "legend_image WHERE legend_id = '" . (int)$legend_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "legend_to_store WHERE legend_id = '" . (int)$legend_id . "'");

		$this->cache->delete('legend');
	}

	public function getLegend($legend_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'legend_id=" . (int)$legend_id . "') AS keyword FROM " . DB_PREFIX . "legend WHERE legend_id = '" . (int)$legend_id . "'");

		return $query->row;
	}

	public function getLegends($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "legend i LEFT JOIN " . DB_PREFIX . "legend_description id ON (i.legend_id = id.legend_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "'";

			$sort_data = array(
				'id.title',
				'i.sort_order'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];
			} else {
				$sql .= " ORDER BY id.title";
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

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
		} else {
			$legend_data = $this->cache->get('legend.' . (int)$this->config->get('config_language_id'));

			if (!$legend_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "legend i LEFT JOIN " . DB_PREFIX . "legend_description id ON (i.legend_id = id.legend_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY id.title");

				$legend_data = $query->rows;

				$this->cache->set('legend.' . (int)$this->config->get('config_language_id'), $legend_data);
			}

			return $legend_data;
		}
	}

	public function getLegendDescriptions($legend_id) {
		$legend_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "legend_description WHERE legend_id = '" . (int)$legend_id . "'");

		foreach ($query->rows as $result) {
			$legend_description_data[$result['language_id']] = array(
				'title'            => $result['title'],
				'description'      => $result['description']
			);
		}

		return $legend_description_data;
	}

	public function getLegendImages($legend_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "legend_image WHERE legend_id = '" . (int)$legend_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	public function getLegendStores($legend_id) {
		$legend_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "legend_to_store WHERE legend_id = '" . (int)$legend_id . "'");

		foreach ($query->rows as $result) {
			$legend_store_data[] = $result['store_id'];
		}

		return $legend_store_data;
	}

	public function getLegendLayouts($legend_id) {
		$legend_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "legend_to_layout WHERE legend_id = '" . (int)$legend_id . "'");

		foreach ($query->rows as $result) {
			$legend_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $legend_layout_data;
	}

	public function getTotalLegends() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "legend");

		return $query->row['total'];
	}

	public function getTotalLegendsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "legend_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}
}