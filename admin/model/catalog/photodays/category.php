<?php
class ModelCatalogPhotodaysCategory extends Model {
	public function addCategory($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_category SET photodays_parent_id = '" . (int)$data['photodays_parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `left` = '" . (isset($data['left']) ? (int)$data['left'] : 0) . "', `bottom` = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "',  `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW(), date_added = NOW()");

		$photodays_category_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "photodays_category SET image = '" . $this->db->escape($data['image']) . "' WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");
		}

		foreach ($data['category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_category_description SET photodays_category_id = '" . (int)$photodays_category_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		// MySQL Hierarchical Data Closure Table Pattern
		$level = 0;

		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "photodays_category_path` WHERE photodays_category_id = '" . (int)$data['photodays_parent_id'] . "' ORDER BY `level` ASC");

		foreach ($query->rows as $result) {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "photodays_category_path` SET `photodays_category_id` = '" . (int)$photodays_category_id . "', `photodays_path_id` = '" . (int)$result['photodays_path_id'] . "', `level` = '" . (int)$level . "'");

			$level++;
		}

		$this->db->query("INSERT INTO `" . DB_PREFIX . "photodays_category_path` SET `photodays_category_id` = '" . (int)$photodays_category_id . "', `photodays_path_id` = '" . (int)$photodays_category_id . "', `level` = '" . (int)$level . "'");


		if (isset($data['category_store'])) {
			foreach ($data['category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_category_to_store SET photodays_category_id = '" . (int)$photodays_category_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		// Set which layout to use with this category
		if (isset($data['category_layout'])) {
			foreach ($data['category_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_category_to_layout SET photodays_category_id = '" . (int)$photodays_category_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		if (isset($data['keyword'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'photodays_category_id=" . (int)$photodays_category_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('category');

		return $photodays_category_id;
	}

	public function editCategory($photodays_category_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "photodays_category SET photodays_parent_id = '" . (int)$data['photodays_parent_id'] . "', `top` = '" . (isset($data['top']) ? (int)$data['top'] : 0) . "', `left` = '" . (isset($data['left']) ? (int)$data['left'] : 0) . "', `bottom` = '" . (isset($data['bottom']) ? (int)$data['bottom'] : 0) . "',  `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "photodays_category SET image = '" . $this->db->escape($data['image']) . "' WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_category_description WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");

		foreach ($data['category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_category_description SET photodays_category_id = '" . (int)$photodays_category_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		// MySQL Hierarchical Data Closure Table Pattern
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "photodays_category_path` WHERE photodays_path_id = '" . (int)$photodays_category_id . "' ORDER BY level ASC");

		if ($query->rows) {
			foreach ($query->rows as $category_path) {
				// Delete the path below the current one
				$this->db->query("DELETE FROM `" . DB_PREFIX . "photodays_category_path` WHERE photodays_category_id = '" . (int)$category_path['photodays_category_id'] . "' AND level < '" . (int)$category_path['level'] . "'");

				$path = array();

				// Get the nodes new parents
				$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "photodays_category_path` WHERE photodays_category_id = '" . (int)$data['photodays_parent_id'] . "' ORDER BY level ASC");

				foreach ($query->rows as $result) {
					$path[] = $result['photodays_path_id'];
				}

				// Get whats left of the nodes current path
				$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "photodays_category_path` WHERE photodays_category_id = '" . (int)$category_path['photodays_category_id'] . "' ORDER BY level ASC");

				foreach ($query->rows as $result) {
					$path[] = $result['photodays_path_id'];
				}

				// Combine the paths with a new level
				$level = 0;

				foreach ($path as $photodays_path_id) {
					$this->db->query("REPLACE INTO `" . DB_PREFIX . "photodays_category_path` SET photodays_category_id = '" . (int)$category_path['photodays_category_id'] . "', `photodays_path_id` = '" . (int)$photodays_path_id . "', level = '" . (int)$level . "'");

					$level++;
				}
			}
		} else {
			// Delete the path below the current one
			$this->db->query("DELETE FROM `" . DB_PREFIX . "photodays_category_path` WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");

			// Fix for records with no paths
			$level = 0;

			$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "photodays_category_path` WHERE photodays_category_id = '" . (int)$data['photodays_parent_id'] . "' ORDER BY level ASC");

			foreach ($query->rows as $result) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "photodays_category_path` SET photodays_category_id = '" . (int)$photodays_category_id . "', `photodays_path_id` = '" . (int)$result['photodays_path_id'] . "', level = '" . (int)$level . "'");

				$level++;
			}

			$this->db->query("REPLACE INTO `" . DB_PREFIX . "photodays_category_path` SET photodays_category_id = '" . (int)$photodays_category_id . "', `photodays_path_id` = '" . (int)$photodays_category_id . "', level = '" . (int)$level . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_category_to_store WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");

		if (isset($data['category_store'])) {
			foreach ($data['category_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_category_to_store SET photodays_category_id = '" . (int)$photodays_category_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_category_to_layout WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");

		if (isset($data['category_layout'])) {
			foreach ($data['category_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_category_to_layout SET photodays_category_id = '" . (int)$photodays_category_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'photodays_category_id=" . (int)$photodays_category_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'photodays_category_id=" . (int)$photodays_category_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('category');
	}

	public function deleteCategory($photodays_category_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_category_path WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_category_path WHERE photodays_path_id = '" . (int)$photodays_category_id . "'");

		foreach ($query->rows as $result) {
			$this->deleteCategory($result['photodays_category_id']);
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_category WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_category_description WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_category_to_store WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_category_to_layout WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_photodays_category WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'photodays_category_id=" . (int)$photodays_category_id . "'");

		$this->cache->delete('category');
	}

	public function getCategory($photodays_category_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT GROUP_CONCAT(cd1.name ORDER BY level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') FROM " . DB_PREFIX . "photodays_category_path cp LEFT JOIN " . DB_PREFIX . "photodays_category_description cd1 ON (cp.photodays_path_id = cd1.photodays_category_id AND cp.photodays_category_id != cp.photodays_path_id) WHERE cp.photodays_category_id = c.photodays_category_id AND cd1.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY cp.photodays_category_id) AS path, (SELECT DISTINCT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'photodays_category_id=" . (int)$photodays_category_id . "') AS keyword FROM " . DB_PREFIX . "photodays_category c LEFT JOIN " . DB_PREFIX . "photodays_category_description cd2 ON (c.photodays_category_id = cd2.photodays_category_id) WHERE c.photodays_category_id = '" . (int)$photodays_category_id . "' AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getCategories($data = array()) {
		$sql = "SELECT cp.photodays_category_id AS photodays_category_id, GROUP_CONCAT(cd1.name ORDER BY cp.level SEPARATOR '&nbsp;&nbsp;&gt;&nbsp;&nbsp;') AS name, c1.photodays_parent_id, c1.sort_order FROM " . DB_PREFIX . "photodays_category_path cp LEFT JOIN " . DB_PREFIX . "photodays_category c1 ON (cp.photodays_category_id = c1.photodays_category_id) LEFT JOIN " . DB_PREFIX . "photodays_category c2 ON (cp.photodays_path_id = c2.photodays_category_id) LEFT JOIN " . DB_PREFIX . "photodays_category_description cd1 ON (cp.photodays_path_id = cd1.photodays_category_id) LEFT JOIN " . DB_PREFIX . "photodays_category_description cd2 ON (cp.photodays_category_id = cd2.photodays_category_id) WHERE cd1.language_id = '" . (int)$this->config->get('config_language_id') . "' AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND cd2.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sql .= " GROUP BY cp.photodays_category_id";

		$sort_data = array(
			'name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY sort_order";
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
	}

	public function getCategoryDescriptions($photodays_category_id) {
		$category_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_category_description WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");

		foreach ($query->rows as $result) {
			$category_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword'],
				'description'      => $result['description']
			);
		}

		return $category_description_data;
	}
	
	public function getCategoryPath($photodays_category_id) {
		$query = $this->db->query("SELECT photodays_category_id, photodays_path_id, level FROM " . DB_PREFIX . "photodays_category_path WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");

		return $query->rows;
	}

	public function getCategoryStores($photodays_category_id) {
		$category_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_category_to_store WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");

		foreach ($query->rows as $result) {
			$category_store_data[] = $result['store_id'];
		}

		return $category_store_data;
	}

	public function getCategoryLayouts($photodays_category_id) {
		$category_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_category_to_layout WHERE photodays_category_id = '" . (int)$photodays_category_id . "'");

		foreach ($query->rows as $result) {
			$category_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $category_layout_data;
	}

	public function getTotalCategories() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "photodays_category");

		return $query->row['total'];
	}
	
	public function getTotalCategoriesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "photodays_category_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}	
}
