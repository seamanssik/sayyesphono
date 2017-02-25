<?php

set_time_limit(0);

$languages = array('ru'); //$languages = array('ru','en');

$filename = dirname(__FILE__) . '/category.json';
$host = 'http://sayyesphoto.com/';
$track = 'catalog/onebox/';
$apiKey = '4vx37Tj7sWLbmlhmyBzLeqszRJfJIwI1RPE84FMx6SY6KPEwsIkYIoEOv5X0D9McPxjPqBeqqEepMRNQEDrlPxLC7P4OJB6epnSILKbEd033sNposd53ihY0XnNcZOUlJfghvQRuNnkMSMmjbbaVLQpRmhumDkEmLPvLzN0Jk4XKyvbsghRJijYaBVexHaT94oj5vOKBFdVbxqAUQ3eAyWgFvE6sM8YvIN4BPqn6bntkAsJmQVHLI6cBOeXCR6Au';

if (file_exists($filename)) {
    
    $log = fopen(dirname(__FILE__) . '/log.txt', 'a');
    $mytext = date(DATE_RFC2822) . ": \r\n";
    fwrite($log, $mytext);

    $curl = curl_init( $host .'index.php?route=api/login/' );
    $post = array ('key' => $apiKey);
    curl_setopt_array( $curl, array(CURLOPT_RETURNTRANSFER => TRUE, CURLOPT_POSTFIELDS => $post ) );
    $response = json_decode(curl_exec( $curl ));
    curl_close($curl);
    if (isset($response->token)) {
        $token = $response->token;
    }
  //  print_r ($response);
    fwrite($log,   $response );

//***********************************************
//    echo('UPDATE CATEGORY:');
//***********************************************
    $filename = 'category.json';
    $json_url = $track . $filename;
    $languages = json_encode($languages);
    $post = array ('json_url' => $json_url, 'languages' => $languages);
    $curl = curl_init( $host .'index.php?route=api/oneboxsync/updateCategory/&token=' . $token );
    curl_setopt_array( $curl, array(CURLOPT_RETURNTRANSFER=> TRUE, CURLOPT_POSTFIELDS => $post ) );
    $response = (curl_exec( $curl ));
    curl_close($curl);
 //   print_r ($response . "</br>");
    $filename1 = dirname(__FILE__) . '/' . $filename;
    fwrite($log,  'UPDATE CATEGORY: ' . $response . "\r\n");
    unlink($filename1);


//**********************************************
    //   echo('UPDATE PRODUCT:');
//**********************************************
    $filename = 'product.json';
    $json_url = $track . $filename;
    $languages = json_encode($languages);
    $post = array ('json_url' => $json_url, 'languages' => $languages);
    $curl = curl_init( $host .'index.php?route=api/oneboxsync/updateProduct/&token=' . $token );
    curl_setopt_array( $curl, array(CURLOPT_RETURNTRANSFER=> TRUE, CURLOPT_POSTFIELDS => $post ) );
    $response = json_decode(curl_exec( $curl ));
    curl_close($curl);
//    print_r ($response . "</br>");
    $filename1 = dirname(__FILE__) . '/' . $filename;
    fwrite($log, 'UPDATE PRODUCT: ' . $response . "\r\n");
   unlink($filename1);


    //**********************************************
    //   echo('UPDATE STATUS:');
    //***********************************************

//*********************************************************
//NOVY STATUS - ORDER!!!!
    /*
        $order_id = '1';
        $status_id = '3';

        $post = array ('order_id' => $order_id, 'status_id' => $status_id);
        $curl = curl_init( $host .'index.php?route=api/oneboxsync/updateOrder/&token=' . $token );
        curl_setopt_array( $curl, array(CURLOPT_RETURNTRANSFER=> TRUE, CURLOPT_POSTFIELDS => $post ) );
        $response = json_decode(curl_exec( $curl ));
        curl_close($curl);
        print_r ($response);
    */
//*******************************************


//*******************************************
//   echo('UPDATE FIlTRENAME:');
//********************************************
    $filename = 'filtername.json';
    $json_url = $track . $filename;
    $languages = json_encode($languages);
    $post = array ('json_url' => $json_url, 'languages' => $languages);
    $curl = curl_init( $host .'index.php?route=api/oneboxsync/updateFiltreName/&token=' . $token );
    curl_setopt_array( $curl, array(CURLOPT_RETURNTRANSFER=> TRUE, CURLOPT_POSTFIELDS => $post ) );
    $response = json_decode(curl_exec( $curl ));
    curl_close($curl);
//    print_r ($response . "</br>");
    $filename1 = dirname(__FILE__) . '/' . $filename;
    fwrite($log, 'UPDATE FIlTRENAME: ' . $response . "\r\n");
    unlink($filename1);


//*****************************************
//    echo('UPDATE ORDER VALUE:');
//*****************************************
    /*
        $filename = 'filtervalue.json';
        $json_url = $track . $filename;
        $post = array ('json_url' => $json_url);
        $curl = curl_init( $host .'index.php?route=api/oneboxsync/updateOrderValue/&token=' . $token );
        curl_setopt_array( $curl, array(CURLOPT_RETURNTRANSFER=> TRUE, CURLOPT_POSTFIELDS => $post ) );
        $response = json_decode(curl_exec( $curl ));
        curl_close($curl);
    //    print_r ($response);
        fwrite($log, 'UPDATE ORDER VALUE: ' . $response . "</br>");
        unlink($filename);

    */

//*********************************************
//    echo('UPDATE FILTRE PRODUCT VALUE:');
//***********************************************
    fwrite($log, 'UPDATE FILTRE PRODUCT VALUE: ');
    $filename = 'filtervalue.json';
    $json_url = $track . $filename;
    $post = array ('json_url' => $json_url);
    $curl = curl_init( $host .'index.php?route=api/oneboxsync/updateFiltreProductValue/&token=' . $token );
    curl_setopt_array( $curl, array(CURLOPT_RETURNTRANSFER=> TRUE, CURLOPT_POSTFIELDS => $post ) );
    $response = json_decode(curl_exec( $curl ));
    curl_close($curl);
//    print_r ($response . "</br>");

    fwrite($log, $response . "\r\n");
    $filename1 = dirname(__FILE__) . '/' . $filename;
    unlink($filename1);

    fclose($log);
/*
    echo('EXAMPLE NEW file:');
//***********************************************
    $filename = $track . 'category.json'; //�������� ���� ���������� �������� �����
    $json_url = 'http://box.larus.ua/media/export/opencart/category.json';  //������ ���� �������
    $post = array ('json_url' => $json_url, 'name' => $filename);
    $curl = curl_init( $host .'index.php?route=api/oneboxsync/addFiles/&token=' . $token );
    curl_setopt_array( $curl, array(CURLOPT_RETURNTRANSFER=> TRUE, CURLOPT_POSTFIELDS => $post ) );
    $response = json_decode(curl_exec( $curl ));
    curl_close($curl);
    print_r ($response . "</br>");*/
    include $host . 'seo.php';


}
?>