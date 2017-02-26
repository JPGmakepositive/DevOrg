Global class CustomersResponse {

	Global Integer created;	//1326853478
	Global boolean livemode;
	Global String id;	//evt_00000000000000
	Global String type;	//charge.succeeded
	//Global String object;	//event
	Global cls_request request;
	Global Integer pending_webhooks;	//1
	Global String api_version;	//2016-03-07
	Global cls_data data;
	class cls_request {
	}
	Global class cls_data {
	}
	Global class cls_object {
		Global String id;	//ch_00000000000000
		//Global String object;	//charge
		Global Integer amount;	//100
		Global Integer amount_refunded;	//0
		Global cls_application_fee application_fee;
		Global String balance_transaction;	//txn_00000000000000
		Global boolean captured;
		Global Integer created;	//1464626238
		//Global String currency;	//gbp
		Global cls_customer customer;
		Global String description;	//My First Test Charge (created for API docs)
		Global cls_destination destination;
		Global cls_dispute dispute;
		Global cls_failure_code failure_code;
		Global cls_failure_message failure_message;
		Global cls_fraud_details fraud_details;
		Global cls_invoice invoice;
		Global boolean livemode;
		Global cls_metadata metadata;
		Global cls_order order;
		Global boolean paid;
		Global cls_receipt_email receipt_email;
		Global cls_receipt_number receipt_number;
		Global boolean refunded;
		Global cls_refunds refunds;
		Global cls_shipping shipping;
		Global cls_source source;
		Global cls_source_transfer source_transfer;
		Global cls_statement_descriptor statement_descriptor;
		Global String status;	//succeeded
	}
	class cls_application_fee {
	}
	class cls_customer {
	}
	class cls_destination {
	}
	class cls_dispute {
	}
	class cls_failure_code {
	}
	class cls_failure_message {
	}
	class cls_fraud_details {
	}
	class cls_invoice {
	}
	class cls_metadata {
	}
	class cls_order {
	}
	class cls_receipt_email {
	}
	class cls_receipt_number {
	}
	Global class cls_refunds {
		//Global String object;	//list
		Global cls_data[] data;
		Global boolean has_more;
		Global Integer total_count;	//0
		Global String url;	///v1/charges/ch_18GtOEHkFaIkqVR9bxmTPX9z/refunds
	}
	class cls_shipping {
	}
	Global class cls_source {
		Global String id;	//card_00000000000000
		//Global String object;	//card
		Global cls_address_city address_city;
		Global cls_address_country address_country;
		Global cls_address_line1 address_line1;
		Global cls_address_line1_check address_line1_check;
		Global cls_address_line2 address_line2;
		Global cls_address_state address_state;
		Global cls_address_zip address_zip;
		Global cls_address_zip_check address_zip_check;
		Global String brand;	//Visa
		Global String country;	//US
		Global cls_customer customer;
		Global String cvc_check;	//unchecked
		Global cls_dynamic_last4 dynamic_last4;
		Global Integer exp_month;	//12
		Global Integer exp_year;	//2017
		Global String funding;	//credit
		Global String last4;	//4242
		Global cls_metadata metadata;
		Global cls_name name;
		Global cls_tokenization_method tokenization_method;
	}
	class cls_address_city {
	}
	class cls_address_country {
	}
	class cls_address_line1 {
	}
	class cls_address_line1_check {
	}
	class cls_address_line2 {
	}
	class cls_address_state {
	}
	class cls_address_zip {
	}
	class cls_address_zip_check {
	}
	class cls_dynamic_last4 {
	}
	class cls_name {
	}
	class cls_tokenization_method {
	}
	class cls_source_transfer {
	}
	class cls_statement_descriptor {
	}
	Global static customersResponse parse(String json){
		return (CustomersResponse) System.JSON.deserialize(json, customersResponse.class);
	}
		String json=		'{'+
		'  "created": 1326853478,'+
		'  "livemode": false,'+
		'  "id": "evt_00000000000000",'+
		'  "type": "charge.succeeded",'+
		'  "object": "event",'+
		'  "request": null,'+
		'  "pending_webhooks": 1,'+
		'  "api_version": "2016-03-07",'+
		'  "data": {'+
		'    "object": {'+
		'      "id": "ch_00000000000000",'+
		'      "object": "charge",'+
		'      "amount": 100,'+
		'      "amount_refunded": 0,'+
		'      "application_fee": null,'+
		'      "balance_transaction": "txn_00000000000000",'+
		'      "captured": true,'+
		'      "created": 1464626238,'+
		'      "currency": "gbp",'+
		'      "customer": null,'+
		'      "description": "My First Test Charge (created for API docs)",'+
		'      "destination": null,'+
		'      "dispute": null,'+
		'      "failure_code": null,'+
		'      "failure_message": null,'+
		'      "fraud_details": {},'+
		'      "invoice": null,'+
		'      "livemode": false,'+
		'      "metadata": {},'+
		'      "order": null,'+
		'      "paid": true,'+
		'      "receipt_email": null,'+
		'      "receipt_number": null,'+
		'      "refunded": false,'+
		'      "refunds": {'+
		'        "object": "list",'+
		'        "data": [],'+
		'        "has_more": false,'+
		'        "total_count": 0,'+
		'        "url": "/v1/charges/ch_18GtOEHkFaIkqVR9bxmTPX9z/refunds"'+
		'      },'+
		'      "shipping": null,'+
		'      "source": {'+
		'        "id": "card_00000000000000",'+
		'        "object": "card",'+
		'        "address_city": null,'+
		'        "address_country": null,'+
		'        "address_line1": null,'+
		'        "address_line1_check": null,'+
		'        "address_line2": null,'+
		'        "address_state": null,'+
		'        "address_zip": null,'+
		'        "address_zip_check": null,'+
		'        "brand": "Visa",'+
		'        "country": "US",'+
		'        "customer": null,'+
		'        "cvc_check": "unchecked",'+
		'        "dynamic_last4": null,'+
		'        "exp_month": 12,'+
		'        "exp_year": 2017,'+
		'        "funding": "credit",'+
		'        "last4": "4242",'+
		'        "metadata": {},'+
		'        "name": null,'+
		'        "tokenization_method": null'+
		'      },'+
		'      "source_transfer": null,'+
		'      "statement_descriptor": null,'+
		'      "status": "succeeded"'+
		'    }'+
		'  }'+
		'}';
}