<?php
class ModelDesignBanner extends Model {
	public function addBanner($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "banner SET name = '" . $this->db->escape($data['name']) . "', status = '" . (int)$data['status'] . "'");

		$banner_id = $this->db->getLastId();

		if (isset($data['banner_image'])) {
			foreach ($data['banner_image'] as $language_id => $value) {
				foreach ($value as $banner_image) {

					if (!empty($banner_image['field_1'])) {
						$field_1 = $banner_image['field_1'];
					} else {
						$field_1 = '';
					}

					if (!empty($banner_image['field_2'])) {
						$field_2 = $banner_image['field_2'];
					} else {
						$field_2 = '';
					}

					if (!empty($banner_image['field_3'])) {
						$field_3 = $banner_image['field_3'];
					} else {
						$field_3 = '';
					}

					if (!empty($banner_image['field_4'])) {
						$field_4 = $banner_image['field_4'];
					} else {
						$field_4 = '';
					}

					if (!empty($banner_image['field_5'])) {
						$field_5 = $banner_image['field_5'];
					} else {
						$field_5 = '';
					}

					if (!empty($banner_image['field_6'])) {
						$field_6 = $banner_image['field_6'];
					} else {
						$field_6 = '';
					}

					$this->db->query("INSERT INTO " . DB_PREFIX . "banner_image SET banner_id = '" . (int)$banner_id . "', language_id = '" . (int)$language_id . "', 
					title = '" .  $this->db->escape($banner_image['title']) . "', 
					field_1 = '" .  $this->db->escape($field_1) . "', 
					field_2 = '" .  $this->db->escape($field_2) . "', 
					field_3 = '" .  $this->db->escape($field_3) . "', 
					field_4 = '" .  $this->db->escape($field_4) . "', 
					field_5 = '" .  $this->db->escape($field_5) . "', 
					field_6 = '" .  $this->db->escape($field_6) . "', 
					link = '" .  $this->db->escape($banner_image['link']) . "', 
					image = '" .  $this->db->escape($banner_image['image']) . "', 
					sort_order = '" .  (int)$banner_image['sort_order'] . "'");
				}
			}
		}

		return $banner_id;
	}

	public function editBanner($banner_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "banner SET name = '" . $this->db->escape($data['name']) . "', status = '" . (int)$data['status'] . "' WHERE banner_id = '" . (int)$banner_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "banner_image WHERE banner_id = '" . (int)$banner_id . "'");

		if (isset($data['banner_image'])) {
			foreach ($data['banner_image'] as $language_id => $value) {
				foreach ($value as $banner_image) {

					if (!empty($banner_image['field_1'])) {
						$field_1 = $banner_image['field_1'];
					} else {
						$field_1 = '';
					}

					if (!empty($banner_image['field_2'])) {
						$field_2 = $banner_image['field_2'];
					} else {
						$field_2 = '';
					}

					if (!empty($banner_image['field_3'])) {
						$field_3 = $banner_image['field_3'];
					} else {
						$field_3 = '';
					}

					if (!empty($banner_image['field_4'])) {
						$field_4 = $banner_image['field_4'];
					} else {
						$field_4 = '';
					}

					if (!empty($banner_image['field_5'])) {
						$field_5 = $banner_image['field_5'];
					} else {
						$field_5 = '';
					}

					if (!empty($banner_image['field_6'])) {
						$field_6 = $banner_image['field_6'];
					} else {
						$field_6 = '';
					}

					$this->db->query("INSERT INTO " . DB_PREFIX . "banner_image SET banner_id = '" . (int)$banner_id . "', 
					language_id = '" . (int)$language_id . "', 
					title = '" .  $this->db->escape($banner_image['title']) . "', 
					field_1 = '" .  $this->db->escape($field_1) . "', 
					field_2 = '" .  $this->db->escape($field_2) . "', 
					field_3 = '" .  $this->db->escape($field_3) . "', 
					field_4 = '" .  $this->db->escape($field_4) . "', 
					field_5 = '" .  $this->db->escape($field_5) . "', 
					field_6 = '" .  $this->db->escape($field_6) . "', 
					link = '" .  $this->db->escape($banner_image['link']) . "', 
					image = '" .  $this->db->escape($banner_image['image']) . "', 
					sort_order = '" . (int)$banner_image['sort_order'] . "'");
				}
			}
		}
	}

	public function deleteBanner($banner_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "banner WHERE banner_id = '" . (int)$banner_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "banner_image WHERE banner_id = '" . (int)$banner_id . "'");
	}

	public function getBanner($banner_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "banner WHERE banner_id = '" . (int)$banner_id . "'");

		return $query->row;
	}

	public function getBanners($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "banner";

		$sort_data = array(
			'name',
			'status'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
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

	public function getBannerImages($banner_id) {
		$banner_image_data = array();

		$banner_image_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner_image WHERE banner_id = '" . (int)$banner_id . "' ORDER BY sort_order ASC");

		foreach ($banner_image_query->rows as $banner_image) {
			$banner_image_data[$banner_image['language_id']][] = array(
				'title'      => $banner_image['title'],
				'link'       => $banner_image['link'],
				'image'      => $banner_image['image'],
				'sort_order' => $banner_image['sort_order'],
				'field_1' => $banner_image['field_1'],
				'field_2' => $banner_image['field_2'],
				'field_3' => $banner_image['field_3'],
				'field_4' => $banner_image['field_4'],
				'field_5' => $banner_image['field_5'],
				'field_6' => $banner_image['field_6']
			);
		}

		return $banner_image_data;
	}

	public function getTotalBanners() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "banner");

		return $query->row['total'];
	}
}
