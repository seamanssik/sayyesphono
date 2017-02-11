<?php
function token($length = 32) {
	// Create random token
	$string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
	
	$max = strlen($string) - 1;
	
	$token = '';
	
	for ($i = 0; $i < $length; $i++) {
		$token .= $string[mt_rand(0, $max)];
	}	
	
	return $token;
}

/**
 * Backwards support for timing safe hash string comparisons
 * 
 * http://php.net/manual/en/function.hash-equals.php
 */

if(!function_exists('hash_equals')) {
	function hash_equals($known_string, $user_string) {
		$known_string = (string)$known_string;
		$user_string = (string)$user_string;

		if(strlen($known_string) != strlen($user_string)) {
			return false;
		} else {
			$res = $known_string ^ $user_string;
			$ret = 0;

			for($i = strlen($res) - 1; $i >= 0; $i--) $ret |= ord($res[$i]);

			return !$ret;
		}
	}
}

if(!function_exists('rus_months')) {
	function rus_months($code = 'ru-ru', $month) {
		$code = 'ru-ru';

		$months['ru-ru'] = array(
			'01' => 'Января',
			'02' => 'Февраля',
			'03' => 'Марта',
			'04' => 'Апреля',
			'05' => 'Мая',
			'06' => 'Июня',
			'07' => 'Июля',
			'08' => 'Августа',
			'09' => 'Сентября',
			'10' => 'Октября',
			'11' => 'Ноября',
			'12' => 'Декабря'
		);

		return $months[$code][$month];
	}
}
