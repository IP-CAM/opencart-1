<?php
class ModelModuleDescriptions extends Model {
	
	public function getDescriptionByKey($key) {
		$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "descriptions` WHERE `key` = '" . (string)$key . "'");
		
		if ($order_query->num_rows && $order_query->num_rows == 1) {
			return $order_query->rows[0]['value'];
		} else {
			return false;
		}
	}
}