<?php
class ModelModuleOutletAddresses extends Model {
	
	public function getOutletAddress($id) {
		$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "outlet_addresses` WHERE id = '" . (int)$id . "'");
		
		if ($order_query->num_rows) {
			return $order_query->rows;
		} else {
			return false;
		}
	}
	
	public function getOutletAddresses() {
		$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "outlet_addresses`");
		
		if ($order_query->num_rows) {
			return $order_query->rows;
		} else {
			return false;
		}
	}
}