<?php
class ModelCatalogPhotodaysProduct extends Model {
	public function updateViewed($photodays_product_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "photodays_product SET viewed = (viewed + 1) WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");
	}

	public function getProduct($photodays_product_id) {

		$product_data = $this->cache->get('product.get_photodays_product.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$photodays_product_id);

		if (!$product_data) {

			$query = $this->db->query("SELECT DISTINCT *, pd.name AS name, p.image, p.sort_order FROM " . DB_PREFIX . "photodays_product p LEFT JOIN " . DB_PREFIX . "photodays_product_description pd ON (p.photodays_product_id = pd.photodays_product_id) LEFT JOIN " . DB_PREFIX . "photodays_product_to_store p2s ON (p.photodays_product_id = p2s.photodays_product_id) WHERE p.photodays_product_id = '" . (int)$photodays_product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

			if ($query->num_rows) {
				$product_data = array(
					'photodays_product_id'       => $query->row['photodays_product_id'],
					'city'             => $query->row['city'],
					'name'             => $query->row['name'],
					'logo'             => $query->row['logo'],
					'description'      => $query->row['description'],
					'meta_title'       => $query->row['meta_title'],
					'meta_description' => $query->row['meta_description'],
					'meta_keyword'     => $query->row['meta_keyword'],
					'image'            => $query->row['image'],
					'date_action'      => $query->row['date_action'],
					'date_available'   => $query->row['date_available'],
					'sort_order'       => $query->row['sort_order'],
					'status'           => $query->row['status'],
					'date_added'       => $query->row['date_added'],
					'date_modified'    => $query->row['date_modified'],
					'viewed'           => $query->row['viewed']
				);
			}

			$this->cache->set('product.get_photodays_product.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int)$photodays_product_id, $product_data);
		}

		return $product_data;
	}

	public function getProducts($data = array()) {
		$sql = "SELECT p.photodays_product_id ";

		if (!empty($data['filter_photodays_category_id'])) {
			$sql .= " FROM " . DB_PREFIX . "photodays_category_path cp LEFT JOIN " . DB_PREFIX . "photodays_product_to_photodays_category p2c ON (cp.photodays_category_id = p2c.photodays_category_id)";

			$sql .= " LEFT JOIN " . DB_PREFIX . "photodays_product p ON (p2c.photodays_product_id = p.photodays_product_id)";
		} else {
			$sql .= " FROM " . DB_PREFIX . "photodays_product p";
		}

		$sql .= " LEFT JOIN " . DB_PREFIX . "photodays_product_description pd ON (p.photodays_product_id = pd.photodays_product_id) LEFT JOIN " . DB_PREFIX . "photodays_product_to_store p2s ON (p.photodays_product_id = p2s.photodays_product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

		if (!empty($data['filter_photodays_category_id'])) {
			$sql .= " AND p2c.photodays_category_id = '" . (int)$data['filter_photodays_category_id'] . "'";
		}

		$sql .= " GROUP BY p.photodays_product_id";

		$sql .= " ORDER BY p.date_action";

		$sql .= " DESC, LCASE(pd.name) ASC";

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$product_data = array();

		$query = $this->db->query($sql);

		foreach ($query->rows as $result) {
			$product_data[$result['photodays_product_id']] = $this->getProduct($result['photodays_product_id']);
		}

		return $product_data;
	}

	public function getProductImages($photodays_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_product_image WHERE photodays_product_id = '" . (int)$photodays_product_id . "' ORDER BY sort_order ASC");

		return $query->rows;
	}

	public function getProductLayoutId($photodays_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_product_to_layout WHERE photodays_product_id = '" . (int)$photodays_product_id . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "'");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return 0;
		}
	}

	public function getCategories($photodays_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_product_to_photodays_category WHERE photodays_product_id = '" . (int)$photodays_product_id . "'");

		return $query->rows;
	}

	public function getCategory($photodays_category_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "photodays_category c LEFT JOIN " . DB_PREFIX . "photodays_category_description cd ON (c.photodays_category_id = cd.photodays_category_id) LEFT JOIN " . DB_PREFIX . "photodays_category_to_store c2s ON (c.photodays_category_id = c2s.photodays_category_id) WHERE c.photodays_category_id = '" . (int)$photodays_category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1'");

		return $query->row;
	}

	public function getCategoriesByProductId($photodays_product_id) {
		$query = $this->db->query("SELECT pc.*, (!ISNULL(t1.photodays_parent_id) + !ISNULL(t2.photodays_parent_id) + !ISNULL(t3.photodays_parent_id) + !ISNULL(t4.photodays_parent_id) + !ISNULL(t5.photodays_parent_id))*1000 + IF(t1.sort_order>0,(1000-t1.sort_order),0) + IF(t2.sort_order>0,(1000-t2.sort_order),0) + IF(t3.sort_order>0,(1000-t3.sort_order),0) + IF(t4.sort_order>0,(1000-t4.sort_order),0) + IF(t5.sort_order>0,(1000-t5.sort_order),0) AS d FROM " . DB_PREFIX . "photodays_product_to_photodays_category pc LEFT JOIN " . DB_PREFIX . "photodays_category t1 ON t1.photodays_category_id = pc.photodays_category_id LEFT JOIN " . DB_PREFIX . "photodays_category t2 ON t1.photodays_parent_id = t2.photodays_category_id LEFT JOIN " . DB_PREFIX . "photodays_category t3 ON t2.photodays_parent_id = t3.photodays_category_id LEFT JOIN " . DB_PREFIX . "photodays_category t4 ON t3.photodays_parent_id = t4.photodays_category_id LEFT JOIN " . DB_PREFIX . "photodays_category t5 ON t4.photodays_parent_id = t5.photodays_category_id WHERE photodays_product_id = '" . (int)$photodays_product_id . "' ORDER BY d DESC");

		return $query->rows;
	}

	public function getTotalProducts($data = array()) {
		$sql = "SELECT COUNT(DISTINCT p.photodays_product_id) AS total";

		if (!empty($data['filter_photodays_category_id'])) {
			$sql .= " FROM " . DB_PREFIX . "photodays_product_to_photodays_category p2c";

			$sql .= " LEFT JOIN " . DB_PREFIX . "photodays_product p ON (p2c.photodays_product_id = p.photodays_product_id)";
		} else {
			$sql .= " FROM " . DB_PREFIX . "photodays_product p";
		}

		$sql .= " LEFT JOIN " . DB_PREFIX . "photodays_product_description pd ON (p.photodays_product_id = pd.photodays_product_id) LEFT JOIN " . DB_PREFIX . "photodays_product_to_store p2s ON (p.photodays_product_id = p2s.photodays_product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

		if (!empty($data['filter_photodays_category_id'])) {
			$sql .= " AND p2c.photodays_category_id = '" . (int)$data['filter_photodays_category_id'] . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getProductPagination($data = array()) {
		$sql_get_category = "SELECT p2c.photodays_category_id FROM " . DB_PREFIX . "photodays_product_to_photodays_category p2c";

		$sql_get_category .= " LEFT JOIN " . DB_PREFIX . "photodays_product p ON (p.photodays_product_id = p2c.photodays_product_id)";

		$sql_get_category .= " WHERE p2c.photodays_product_id = '" . $data['photodays_product_id'] . "'";

		if (!empty($data['photodays_path'])) {
			$sql_get_category .= " AND p2c.photodays_category_id = '" . $data['photodays_path'] . "'";
		}

		$sql_get_category .= " AND p.status = '1'";

		$query_get_category = $this->db->query($sql_get_category);

		if ($query_get_category) {
			$ncategory_id = $query_get_category->row['photodays_category_id'];

			$sql_get_news = "SELECT p2c.photodays_product_id AS photodays_product_id FROM " . DB_PREFIX . "photodays_product_to_photodays_category p2c";

			$sql_get_news .= " LEFT JOIN " . DB_PREFIX . "photodays_product p ON (p.photodays_product_id = p2c.photodays_product_id)";

			$sql_get_news .= " WHERE p2c.photodays_category_id = '" . $ncategory_id . "'";

			$sql_get_news .= " AND p.status = '1'";

			$query_get_news = $this->db->query($sql_get_news);

			if ($query_get_news) {
				return $query_get_news->rows;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
}
