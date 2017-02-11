<?php
class ModelCatalogPhotodaysProduct extends Model {
	public function addProduct($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_product SET date_action = '" . $this->db->escape($data['date_action']) . "', date_available = '" . $this->db->escape($data['date_available']) . "', status = '" . (int)$data['status'] . "', date_added = NOW()");

		$photodays_product_id = $this->db->getLastId();
      
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "photodays_product SET image = '" . $this->db->escape($data['image']) . "' WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");
		}

		if (isset($data['logo'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "photodays_product SET logo = '" . $this->db->escape($data['logo']) . "' WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");
		}

		foreach ($data['product_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_product_description SET photodays_product_id = '" . (int)$photodays_product_id . "', language_id = '" . (int)$language_id . "', city = '" . $this->db->escape($value['city']) . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		if (isset($data['product_store'])) {
			foreach ($data['product_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_product_to_store SET photodays_product_id = '" . (int)$photodays_product_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['product_image'])) {
			foreach ($data['product_image'] as $product_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_product_image SET photodays_product_id = '" . (int)$photodays_product_id . "', image = '" . $this->db->escape($product_image['image']) . "', sort_order = '" . (int)$product_image['sort_order'] . "'");
			}
		}

		if (isset($data['product_photodays_category'])) {
			foreach ($data['product_photodays_category'] as $photodays_category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_product_to_photodays_category SET photodays_product_id = '" . (int)$photodays_product_id . "', photodays_category_id = '" . (int)$photodays_category_id . "'");
			}
		}

		if (isset($data['product_layout'])) {
			foreach ($data['product_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_product_to_layout SET photodays_product_id = '" . (int)$photodays_product_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'photodays_product_id=" . (int)$photodays_product_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('product');

		return $photodays_product_id;
	}

	public function editProduct($photodays_product_id, $data)
	{
		$this->db->query("UPDATE " . DB_PREFIX . "photodays_product SET date_action = '" . $this->db->escape($data['date_action']) . "', date_available = '" . $this->db->escape($data['date_available']) . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "photodays_product SET image = '" . $this->db->escape($data['image']) . "' WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");
		}

		if (isset($data['logo'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "photodays_product SET logo = '" . $this->db->escape($data['logo']) . "' WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_product_description WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");

		foreach ($data['product_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_product_description SET photodays_product_id = '" . (int)$photodays_product_id . "', language_id = '" . (int)$language_id . "', city = '" . $this->db->escape($value['city']) . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_product_to_store WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");

		if (isset($data['product_store'])) {
			foreach ($data['product_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_product_to_store SET photodays_product_id = '" . (int)$photodays_product_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_product_image WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");

		if (isset($data['product_image'])) {
			foreach ($data['product_image'] as $product_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_product_image SET photodays_product_id = '" . (int)$photodays_product_id . "', image = '" . $this->db->escape($product_image['image']) . "', sort_order = '" . (int)$product_image['sort_order'] . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_product_to_photodays_category WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");

		if (isset($data['product_photodays_category'])) {
			foreach ($data['product_photodays_category'] as $photodays_category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_product_to_photodays_category SET photodays_product_id = '" . (int)$photodays_product_id . "', photodays_category_id = '" . (int)$photodays_category_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_product_to_layout WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");

		if (isset($data['product_layout'])) {
			foreach ($data['product_layout'] as $store_id => $layout_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "photodays_product_to_layout SET photodays_product_id = '" . (int)$photodays_product_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'photodays_product_id=" . (int)$photodays_product_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'photodays_product_id=" . (int)$photodays_product_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('product');
	}

	public function deleteProduct($photodays_product_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_product WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_product_description WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_product_image WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_product_to_photodays_category WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_product_to_layout WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "photodays_product_to_store WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'photodays_product_id=" . (int)$photodays_product_id . "'");

		$this->cache->delete('product');
	}

	public function getProduct($photodays_product_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'photodays_product_id=" . (int)$photodays_product_id . "') AS keyword FROM " . DB_PREFIX . "photodays_product p LEFT JOIN " . DB_PREFIX . "photodays_product_description pd ON (p.photodays_product_id = pd.photodays_product_id) WHERE p.photodays_product_id = '" . (int)$photodays_product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getProducts($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "photodays_product p LEFT JOIN " . DB_PREFIX . "photodays_product_description pd ON (p.photodays_product_id = pd.photodays_product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_image']) && !is_null($data['filter_image'])) {
			if ($data['filter_image'] == 1) {
				$sql .= " AND (p.image IS NOT NULL AND p.image <> '' AND p.image <> 'no_image.png')";
			} else {
				$sql .= " AND (p.image IS NULL OR p.image = '' OR p.image = 'no_image.png')";
			}
		}

		$sql .= " GROUP BY p.photodays_product_id";

		$sort_data = array(
			'pd.name',
			'p.status',
			'p.date_action',
			'p.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY p.date_action";
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

	public function getProductsByCategoryId($photodays_category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_product p LEFT JOIN " . DB_PREFIX . "photodays_product_description pd ON (p.photodays_product_id = pd.photodays_product_id) LEFT JOIN " . DB_PREFIX . "photodays_product_to_photodays_category p2c ON (p.photodays_product_id = p2c.photodays_product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p2c.photodays_category_id = '" . (int)$photodays_category_id . "' ORDER BY pd.name ASC");

		return $query->rows;
	}

	public function getProductDescriptions($photodays_product_id) {
		$product_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_product_description WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");

		foreach ($query->rows as $result) {
			$product_description_data[$result['language_id']] = array(
				'city'             => $result['city'],
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword']
			);
		}

		return $product_description_data;
	}

	public function getProductCategories($photodays_product_id) {
		$product_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_product_to_photodays_category WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");

		foreach ($query->rows as $result) {
			$product_category_data[] = $result['photodays_category_id'];
		}

		return $product_category_data;
	}

	public function getProductImages($photodays_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_product_image WHERE photodays_product_id = '" . (int)$photodays_product_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	public function getProductStores($photodays_product_id) {
		$product_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_product_to_store WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");

		foreach ($query->rows as $result) {
			$product_store_data[] = $result['store_id'];
		}

		return $product_store_data;
	}

	public function getProductLayouts($photodays_product_id) {
		$product_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_product_to_layout WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");

		foreach ($query->rows as $result) {
			$product_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $product_layout_data;
	}

	public function getTotalProducts($data = array()) {
		$sql = "SELECT COUNT(DISTINCT p.photodays_product_id) AS total FROM " . DB_PREFIX . "photodays_product p LEFT JOIN " . DB_PREFIX . "photodays_product_description pd ON (p.photodays_product_id = pd.photodays_product_id)";

		$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_image']) && !is_null($data['filter_image'])) {
			if ($data['filter_image'] == 1) {
				$sql .= " AND (p.image IS NOT NULL AND p.image <> '' AND p.image <> 'no_image.png')";
			} else {
				$sql .= " AND (p.image IS NULL OR p.image = '' OR p.image = 'no_image.png')";
			}
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalProductsByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "photodays_product_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}
}
