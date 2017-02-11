<?php
class ModelCommonHeader extends Model {

    public function getCategories($parent_id = 0) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c 
        LEFT JOIN " . DB_PREFIX . "category_description cd 
            ON (c.category_id = cd.category_id) 
        LEFT JOIN " . DB_PREFIX . "category_to_store c2s 
            ON (c.category_id = c2s.category_id) 
        WHERE c.parent_id = '" . (int)$parent_id . "' 
            AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
            AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  
            AND c.status = '1' 
            AND c.top = '1' 
        ORDER 
            BY c.sort_order, LCASE(cd.name)");

        return $query->rows;
    }

    public function getCategoriesArchive($photodays_parent_id = 0) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_category c 
        LEFT JOIN " . DB_PREFIX . "photodays_category_description cd 
            ON (c.photodays_category_id = cd.photodays_category_id) 
        LEFT JOIN " . DB_PREFIX . "photodays_category_to_store c2s 
            ON (c.photodays_category_id = c2s.photodays_category_id) 
        WHERE c.photodays_parent_id = '" . (int)$photodays_parent_id . "' 
            AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
            AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
            AND c.status = '1' 
            AND c.top = '1' 
        ORDER 
            BY c.sort_order, LCASE(cd.name)");

        return $query->rows;
    }

    public function getInformations() {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "information i 
        LEFT JOIN " . DB_PREFIX . "information_description id 
            ON (i.information_id = id.information_id) 
        LEFT JOIN " . DB_PREFIX . "information_to_store i2s 
            ON (i.information_id = i2s.information_id) 
        WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' 
            AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
            AND i.status = '1' 
            AND i.top = '1' 
        ORDER 
            BY i.sort_order, LCASE(id.title) ASC");

        if ($query->num_rows) {
            return $query->rows;
        } else {
            return false;
        }
    }

    public function getCategoriesLeft($parent_id = 0) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c 
        LEFT JOIN " . DB_PREFIX . "category_description cd 
            ON (c.category_id = cd.category_id) 
        LEFT JOIN " . DB_PREFIX . "category_to_store c2s 
            ON (c.category_id = c2s.category_id) 
        WHERE c.parent_id = '" . (int)$parent_id . "' 
            AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
            AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  
            AND c.status = '1' 
            AND c.left = '1' 
        ORDER 
            BY c.sort_order, LCASE(cd.name)");

        return $query->rows;
    }

    public function getCategoriesArchiveLeft($photodays_parent_id = 0) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "photodays_category c 
        LEFT JOIN " . DB_PREFIX . "photodays_category_description cd 
            ON (c.photodays_category_id = cd.photodays_category_id) 
        LEFT JOIN " . DB_PREFIX . "photodays_category_to_store c2s 
            ON (c.photodays_category_id = c2s.photodays_category_id) 
        WHERE c.photodays_parent_id = '" . (int)$photodays_parent_id . "' 
            AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' 
            AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
            AND c.status = '1' 
            AND c.left = '1' 
        ORDER 
            BY c.sort_order, LCASE(cd.name)");

        return $query->rows;
    }

    public function getInformationsLeft() {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "information i 
        LEFT JOIN " . DB_PREFIX . "information_description id 
            ON (i.information_id = id.information_id) 
        LEFT JOIN " . DB_PREFIX . "information_to_store i2s 
            ON (i.information_id = i2s.information_id) 
        WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' 
            AND i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' 
            AND i.status = '1' 
            AND i.left = '1' 
        ORDER 
            BY i.sort_order, LCASE(id.title) ASC");

        if ($query->num_rows) {
            return $query->rows;
        } else {
            return false;
        }
    }

}