<?php

class ControllerExtensionModuleRelatedOptions extends Controller
{
    private $error = array();

    public function index()
    {

        $this->load->language('module/related_options');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');
        $this->load->model('module/related_options');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            if (isset($this->request->post['variants'])) {
                $this->model_module_related_options->set_variants_options($this->request->post['variants']);
                unset($this->request->post['variants']);
            } else {
                $this->model_module_related_options->set_variants_options(array());
            }

            $this->model_setting_setting->editSetting('related_options', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/module/related_options', 'token=' . $this->session->data['token'], 'SSL'));

        }

        //$this->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'], 'SSL'));
        $data['export'] = $this->model_setting_setting->getSetting('related_options_export');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['entry_update_quantity'] = $this->language->get('entry_update_quantity');
        $data['entry_update_quantity_help'] = $this->language->get('entry_update_quantity_help');
        $data['entry_stock_control'] = $this->language->get('entry_stock_control');
        $data['entry_stock_control_help'] = $this->language->get('entry_stock_control_help');
        $data['entry_update_options'] = $this->language->get('entry_update_options');
        $data['entry_update_options_help'] = $this->language->get('entry_update_options_help');
        $data['entry_subtract_stock'] = $this->language->get('entry_subtract_stock');
        $data['entry_subtract_stock_help'] = $this->language->get('entry_subtract_stock_help');
        $data['text_subtract_stock_from_product'] = $this->language->get('text_subtract_stock_from_product');
        $data['text_subtract_stock_from_product_first_time'] = $this->language->get('text_subtract_stock_from_product_first_time');
        $data['entry_required'] = $this->language->get('entry_required');
        $data['entry_required_help'] = $this->language->get('entry_required_help');
        $data['text_required_first_time'] = $this->language->get('text_required_first_time');
        $data['entry_hide_inaccessible'] = $this->language->get('entry_hide_inaccessible');
        $data['entry_hide_inaccessible_help'] = $this->language->get('entry_hide_inaccessible_help');
        $data['entry_hide_option'] = $this->language->get('entry_hide_option');
        $data['entry_hide_option_help'] = $this->language->get('entry_hide_option_help');
        $data['entry_unavailable_not_required'] = $this->language->get('entry_unavailable_not_required');
        $data['entry_unavailable_not_required_help'] = $this->language->get('entry_unavailable_not_required_help');
        $data['entry_spec_model'] = $this->language->get('entry_spec_model');
        $data['entry_spec_model_help'] = $this->language->get('entry_spec_model_help');
        $data['entry_spec_sku'] = $this->language->get('entry_spec_sku');
        $data['entry_spec_sku_help'] = $this->language->get('entry_spec_sku_help');
        $data['entry_spec_upc'] = $this->language->get('entry_spec_upc');
        $data['entry_spec_upc_help'] = $this->language->get('entry_spec_upc_help');
        $data['entry_spec_ean'] = $this->language->get('entry_spec_ean');
        $data['entry_spec_ean_help'] = $this->language->get('entry_spec_ean_help');
        $data['entry_spec_location'] = $this->language->get('entry_spec_location');
        $data['entry_spec_location_help'] = $this->language->get('entry_spec_location_help');
        $data['entry_spec_price'] = $this->language->get('entry_spec_price');
        $data['entry_spec_price_help'] = $this->language->get('entry_spec_price_help');
        $data['entry_spec_price_prefix'] = $this->language->get('entry_spec_price_prefix');
        $data['entry_spec_price_prefix_help'] = $this->language->get('entry_spec_price_prefix_help');
        $data['entry_spec_ofs'] = $this->language->get('entry_spec_ofs');
        $data['entry_spec_ofs_help'] = $this->language->get('entry_spec_ofs_help');
        $data['entry_spec_weight'] = $this->language->get('entry_spec_weight');
        $data['entry_spec_weight_help'] = $this->language->get('entry_spec_weight_help');
        $data['entry_spec_price_discount'] = $this->language->get('entry_spec_price_discount');
        $data['entry_spec_price_discount_help'] = $this->language->get('entry_spec_price_discount_help');
        $data['entry_spec_price_special'] = $this->language->get('entry_spec_price_special');
        $data['entry_spec_price_special_help'] = $this->language->get('entry_spec_price_special_help');
        $data['entry_select_first'] = $this->language->get('entry_select_first');
        $data['entry_select_first_help'] = $this->language->get('entry_select_first_help');
        $data['option_select_first_not'] = $this->language->get('option_select_first_not');
        $data['option_select_first'] = $this->language->get('option_select_first');
        $data['option_select_first_last'] = $this->language->get('option_select_first_last');
        $data['entry_step_by_step'] = $this->language->get('entry_step_by_step');
        $data['entry_step_by_step_help'] = $this->language->get('entry_step_by_step_help');
        $data['entry_allow_zero_select'] = $this->language->get('entry_allow_zero_select');
        $data['entry_allow_zero_select_help'] = $this->language->get('entry_allow_zero_select_help');
        $data['entry_additional_fields'] = $this->language->get('entry_additional_fields');

        $data['text_update_alert'] = $this->language->get('text_update_alert');

        $data['entry_settings'] = $this->language->get('entry_settings');
        $data['entry_additional'] = $this->language->get('entry_additional');
        $data['entry_export'] = $this->language->get('entry_export');
        $data['entry_export_description'] = $this->language->get('entry_export_description');
        $data['entry_export_get_file'] = $this->language->get('entry_export_get_file');
        $data['entry_export_check_all'] = $this->language->get('entry_export_check_all');
        $data['entry_export_fields'] = $this->language->get('entry_export_fields');
        $data['entry_import'] = $this->language->get('entry_import');
        $data['entry_import_description'] = $this->language->get('entry_import_description');
        $data['entry_import_delete_before'] = $this->language->get('entry_import_delete_before');
        $data['entry_upload'] = $this->language->get('entry_upload');
        $data['button_upload'] = $this->language->get('button_upload');
        $data['button_upload_help'] = $this->language->get('button_upload_help');
        $data['entry_server_response'] = $this->language->get('entry_server_response');
        $data['entry_import_result'] = $this->language->get('entry_import_result');
        $data['entry_PHPExcel_not_found'] = $this->language->get('entry_PHPExcel_not_found');
        $data['entry_about'] = $this->language->get('entry_about');
        $data['module_description'] = $this->language->get('module_description');
        $data['text_conversation'] = $this->language->get('text_conversation');
        $data['entry_we_recommend'] = $this->language->get('entry_we_recommend');
        $data['text_we_recommend'] = $this->language->get('text_we_recommend');
        $data['module_copyright'] = $this->language->get('module_copyright');
        $data['text_extension_page'] = $this->language->get('text_extension_page');
        $data['entry_ro_version'] = $this->language->get('entry_ro_version');
        $data['text_ro_support'] = $this->language->get('text_ro_support');
        $data['entry_ro_use_variants'] = $this->language->get('entry_ro_use_variants');
        $data['entry_ro_use_variants_help'] = $this->language->get('entry_ro_use_variants_help');
        $data['entry_ro_add_variant'] = $this->language->get('entry_ro_add_variant');
        $data['entry_ro_delete_variant'] = $this->language->get('entry_ro_delete_variant');
        $data['entry_ro_add_option'] = $this->language->get('entry_ro_add_option');
        $data['entry_ro_delete_option'] = $this->language->get('entry_ro_delete_option');
        $data['text_ro_clear_options'] = $this->language->get('text_ro_clear_options');
        $data['entry_ro_variant_name'] = $this->language->get('entry_ro_variant_name');
        $data['entry_ro_options'] = $this->language->get('entry_ro_options');
        $data['entry_show_clear_options'] = $this->language->get('entry_show_clear_options');
        $data['entry_show_clear_options_help'] = $this->language->get('entry_show_clear_options_help');
        $data['option_show_clear_options_not'] = $this->language->get('option_show_clear_options_not');
        $data['option_show_clear_options_top'] = $this->language->get('option_show_clear_options_top');
        $data['option_show_clear_options_bot'] = $this->language->get('option_show_clear_options_bot');
        $data['entry_edit_columns'] = $this->language->get('entry_edit_columns');
        $data['entry_edit_columns_0'] = $this->language->get('entry_edit_columns_0');
        $data['entry_edit_columns_2'] = $this->language->get('entry_edit_columns_2');
        $data['entry_edit_columns_3'] = $this->language->get('entry_edit_columns_3');
        $data['entry_edit_columns_4'] = $this->language->get('entry_edit_columns_4');
        $data['entry_edit_columns_5'] = $this->language->get('entry_edit_columns_5');
        $data['entry_edit_columns_100'] = $this->language->get('entry_edit_columns_100');
        $data['entry_edit_columns_help'] = $this->language->get('entry_edit_columns_help');


        $PHPExcelPath = $this->PHPExcelPath();
        $data['PHPExcelPath'] = str_replace(DIR_SYSTEM, "./system", $PHPExcelPath);
        $data['PHPExcelExists'] = file_exists($PHPExcelPath);

        $data['token'] = $this->session->data['token'];

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        }

        if (isset($this->error['image'])) {
            $data['error_image'] = $this->error['image'];
        } else {
            $data['error_image'] = array();
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/module/related_options', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['action'] = $this->url->link('extension/module/related_options', 'token=' . $this->session->data['token'], 'SSL');
        $data['action_export'] = $this->url->link('extension/module/related_options/export', '&token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');


        $data['modules'] = array();
        if (isset($this->request->post['related_options'])) {
            $data['modules'] = $this->request->post['related_options'];
        } elseif ($this->config->get('related_options')) {
            $data['modules'] = $this->config->get('related_options');
        }

        $current_version = $this->model_module_related_options->current_version();
        if (!isset($data['modules']['related_options_version']) || $data['modules']['related_options_version'] < $current_version
            || "" . $data['modules']['related_options_version'] == ("" . $current_version . "b")
        ) {
            $this->model_module_related_options->install_additional_tables();
            //$data['modules']['related_options_version'] = $current_version;
            $data['modules']['related_options_version'] = $current_version;
            $this->model_setting_setting->editSetting('related_options', array('related_options' => $data['modules']));
            $data['updated'] = $this->language->get('text_ro_updated_to') . " " . ($current_version);
        }
        //$data['modules']['related_options_version'] = $current_version;
        $data['config_admin_language'] = $this->config->get('config_admin_language');

        $data['heading_title'] = $this->language->get('heading_title');
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');


        $data['options'] = $this->model_module_related_options->get_compatible_options();
        $data['variants_options'] = $this->model_module_related_options->get_variants_options();


        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/related_options.tpl', $data));

    }

    private function PHPExcelPath()
    {
        return DIR_SYSTEM . '/PHPExcel/Classes/PHPExcel.php';
    }

    public function export()
    {

        //ini_set('display_errors', 1);
        //error_reporting(E_ERROR|E_PARSE);

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && isset($this->request->post['export']) && is_array($this->request->post['export']) && count($this->request->post['export']) > 0) {

            $this->load->model('setting/setting');
            $this->model_setting_setting->editSetting('related_options_export', $this->request->post['export']);
            $export_settings = $this->request->post['export'];


            $this->load->model('module/related_options');
            $data = $this->model_module_related_options->getExportData();


            require_once $this->PHPExcelPath();

            /*
PHPExcel_CachedObjectStorageFactory::cache_in_memory;
PHPExcel_CachedObjectStorageFactory::cache_in_memory_serialized;
PHPExcel_CachedObjectStorageFactory::cache_in_memory_gzip;
PHPExcel_CachedObjectStorageFactory::cache_to_discISAM;
PHPExcel_CachedObjectStorageFactory::cache_to_phpTemp;
PHPExcel_CachedObjectStorageFactory::cache_to_apc;
PHPExcel_CachedObjectStorageFactory::cache_to_memcache
PHPExcel_CachedObjectStorageFactory::cache_to_wincache;
PHPExcel_CachedObjectStorageFactory::cache_to_sqlite;
PHPExcel_CachedObjectStorageFactory::cache_to_sqlite3;

            */

            PHPExcel_Shared_File::setUseUploadTempDirectory(true);

            $cacheMethod = PHPExcel_CachedObjectStorageFactory:: cache_to_discISAM; //PHPExcel_CachedObjectStorageFactory::cache_to_discISAM ; //
            $cacheSettings = array('memoryCacheSize' => '32MB');
            if (!PHPExcel_Settings::setCacheStorageMethod($cacheMethod, $cacheSettings)) {
                $this->log->write("Related options, PHPExcel cache error");
            }

            $objPHPExcel = new PHPExcel();
            $objPHPExcel->setActiveSheetIndex(0);

            $show_settings = array();
            foreach ($data as $data_str) {

                foreach ($data_str as $data_key => $data_value) {
                    foreach ($export_settings as $setting => $setting_on) {
                        if ($setting_on) {
                            if (($data_key == $setting) || (substr($data_key, 0, strlen($setting)) == $setting)) {
                                if (!in_array($data_key, $show_settings)) {
                                    $show_settings[] = $data_key;
                                }
                            }
                        }
                    }
                }
            }


            $column = 0;
            foreach ($show_settings as $setting) {
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($column, 1, $setting);
                $column++;
            }

            $current_data = array();
            $line_cnt = 2;
            $loop_cnt = 0;
            foreach ($data as &$data_str) {
                $loop_cnt++;

                $current_str = array();
                foreach ($show_settings as $setting) {
                    $current_str[$setting] = isset($data_str[$setting]) ? $data_str[$setting] : null;
                }
                $current_data[] = $current_str;
                $data_str = ""; // memory opt

                if ($loop_cnt % 1000 == 0) {
                    $objPHPExcel->getActiveSheet()->fromArray($current_data, null, 'A' . $line_cnt);
                    $line_cnt = 2 + $loop_cnt;
                    $current_data = array();
                    //sleep(1);
                }

            }
            unset($data);

            if (count($current_data) > 0) {
                $objPHPExcel->getActiveSheet()->fromArray($current_data, null, 'A' . $line_cnt);
            }

            //$objPHPExcel->getActiveSheet()->fromArray($current_data, null, 'A2');
            //$objPHPExcel->getActiveSheet()->fromArray($data,null,'A2');


            $objWriter = new PHPExcel_Writer_Excel5($objPHPExcel);


            $file = DIR_CACHE . "/roexport.xls";

            $objWriter->save($file);

            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename=' . basename($file));
            header('Content-Transfer-Encoding: binary');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($file));
            // читаем файл и отправляем его пользователю
            readfile($file);
            exit;

        }
    }

    public function import()
    {

        $this->load->language('module/related_options');

        $json = array();

        if (!empty($this->request->files['file']['name']) && $this->request->files['file']['tmp_name']) {

            //ini_set('display_errors', 1);
            //error_reporting(E_ERROR|E_PARSE);

            require_once $this->PHPExcelPath();

            $cacheMethod = PHPExcel_CachedObjectStorageFactory:: cache_to_phpTemp; //PHPExcel_CachedObjectStorageFactory::cache_to_discISAM ; //
            $cacheSettings = array('memoryCacheSize' => '32MB');
            PHPExcel_Settings::setCacheStorageMethod($cacheMethod, $cacheSettings);

            $excel = PHPExcel_IOFactory::load($this->request->files['file']['tmp_name']); // PHPExcel
            $sheet = $excel->getSheet(0);

            $data = $sheet->toArray();


            if (count($data) > 1) {

                $head = array_flip($data[0]);

                if (!isset($head['product_id'])) {
                    $json['error'] = "product_id not found";
                }

                if (!isset($head['quantity'])) {
                    $json['error'] = "quantity not found";
                }

                if (!isset($head['option_id1'])) {
                    $json['error'] = "option_id1 not found";
                }

                if (!isset($head['option_value_id1'])) {
                    $json['error'] = "option_value_id1 not found";
                }

                if (!isset($json['error'])) {

                    $f_options = array();
                    for ($i = 1; $i <= 100; $i++) {
                        if (isset($head['option_id' . $i]) && isset($head['option_value_id' . $i])) {
                            $f_options[] = $i;
                        }
                    }


                    $products = array();

                    for ($i = 1; $i < count($data); $i++) {

                        $row = $data[$i];

                        $product_id = (int)$row[$head['product_id']];
                        if (!isset($products[$product_id])) {
                            $products[$product_id] = array('relatedoptions' => array(), 'related_options_use' => true, 'related_options_variant_search' => true);
                        }

                        $options = array();
                        foreach ($f_options as $opt_num) {
                            if ((int)$row[$head['option_id' . $opt_num]] != 0) {
                                $options[(int)$row[$head['option_id' . $opt_num]]] = (int)$row[$head['option_value_id' . $opt_num]];
                            }
                        }

                        $products[$product_id]['relatedoptions'][] = array('options' => $options
                        , 'quantity' => $row[(int)$head['quantity']]
                        , 'price' => isset($head['price']) ? (float)$row[(int)$head['price']] : 0
                        , 'model' => isset($head['relatedoptions_model']) ? $row[(int)$head['relatedoptions_model']] : ''
                        , 'sku' => isset($head['relatedoptions_sku']) ? $row[(int)$head['relatedoptions_sku']] : ''
                        , 'upc' => isset($head['relatedoptions_upc']) ? $row[(int)$head['relatedoptions_upc']] : ''
                        , 'ean' => isset($head['relatedoptions_ean']) ? $row[(int)$head['relatedoptions_ean']] : ''
                        , 'stock_status_id' => isset($head['stock_status_id']) ? $row[(int)$head['stock_status_id']] : ''
                        , 'weight_prefix' => isset($head['weight_prefix']) ? $row[(int)$head['weight_prefix']] : ''
                        , 'weight' => isset($head['weight']) ? $row[(int)$head['weight']] : ''
                        );


                    }

                    //$this->log->write( print_r($products,true) );

                    $this->load->model('module/related_options');

                    if (isset($_POST['import_delete_before']) && $_POST['import_delete_before']) {
                        $this->model_module_related_options->delete_all_related_options();
                    }

                    $related_options_settings = $this->config->get('related_options');


                    $ro_cnt = 0;
                    foreach ($products as $product_id => $product) {
                        $ro_cnt += count($product['relatedoptions']);

                        if (isset($related_options_settings['spec_price']) && $related_options_settings['spec_price'] && isset($related_options_settings['spec_price_discount']) && $related_options_settings['spec_price_discount']) {
                            $product['related_options_discount'] = 1;
                        }

                        if (!(isset($_POST['import_delete_before']) && $_POST['import_delete_before'])) {
                            $product_ro = $this->model_module_related_options->get_related_options($product_id);
                            $added_ids = array();
                            foreach ($product_ro as $old_ro) {
                                foreach ($product['relatedoptions'] as &$new_ro) {
                                    //if ( !array_diff_assoc($ro['options'], ) ) {
                                    if ($old_ro['options'] == $new_ro['options']) {
                                        $new_ro['relatedoptions_id'] = $old_ro['relatedoptions_id'];
                                        $added_ids[] = $old_ro['relatedoptions_id'];
                                        break;
                                    }
                                }
                                unset($new_ro);
                            }

                            foreach ($product_ro as $old_ro) {
                                if (!in_array($old_ro['relatedoptions_id'], $added_ids)) {
                                    $product['relatedoptions'][] = $old_ro;
                                }
                            }

                        }
                        $this->model_module_related_options->editRelatedOptions($product_id, $product);

                    }
                    $json['products'] = count($products);
                    $json['relatedoptions'] = $ro_cnt;

                    $json['success'] = $this->language->get('entry_import_ok');

                }

            } else {
                $json['error'] = "empty table";
            }

        } else {
            $json['error'] = "file not uploaded";
        }

        $this->response->setOutput(json_encode($json));
    }

    public function install()
    {
        $this->load->model('module/related_options');
        $this->model_module_related_options->install();

        $this->load->model('setting/setting');
        $msettings = array('related_options' => array('update_quantity' => 1, 'update_options' => 1, 'related_options_version' => $this->model_module_related_options->current_version()));
        $this->model_setting_setting->editSetting('related_options', $msettings);
    }

    public function uninstall()
    {
        $this->load->model('module/related_options');
        $this->model_module_related_options->uninstall();
    }

    private function validate()
    {
        if (!$this->user->hasPermission('modify', 'extension/module/related_options')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

}