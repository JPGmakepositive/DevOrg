Global class StripeJson {
	Global static void consumeObject(JSONParser parser) {
		Integer depth = 0;
		do {
			JSONToken curr = parser.getCurrentToken();
			if (curr == JSONToken.START_OBJECT || 
				curr == JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == JSONToken.END_OBJECT ||
				curr == JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
    Global Integer created {get;set;} 
	Global Boolean livemode {get;set;} 
	Global String id {get;set;} 
	Global String type_Z {get;set;} // in json: type
	Global String object_Z {get;set;} // in json: object
	Global Object request {get;set;} 
	Global Integer pending_webhooks {get;set;} 
	Global String api_version {get;set;} 
	Global Data data {get;set;} 
    
	Global StripeJson(JSONParser parser) {
		while (parser.nextToken() != JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != JSONToken.VALUE_NULL) {
					if (text == 'created') {
						created = parser.getIntegerValue();
					} else if (text == 'livemode') {
						livemode = parser.getBooleanValue();
					} else if (text == 'id') {
						id = parser.getText();
					} else if (text == 'type') {
						type_Z = parser.getText();
					} else if (text == 'object') {
						object_Z = parser.getText();
					//} else if (text == 'request') {
						//request = new Object(parser);
					} else if (text == 'pending_webhooks') {
						pending_webhooks = parser.getIntegerValue();
					} else if (text == 'api_version') {
						api_version = parser.getText();
					} else if (text == 'data') {
						data = new Data(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'Root consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
    
    Global class Object_Z {
		Global String id {get;set;} 
		Global String object_Z {get;set;} // in json: object
		Global Integer amount {get;set;} 
		Global Integer amount_refunded {get;set;} 
		Global Object application_fee {get;set;} 
		Global String balance_transaction {get;set;} 
		Global Boolean captured {get;set;} 
		Global Integer created {get;set;} 
		//Global String currency {get;set;} 
		Global Object customer {get;set;} 
		Global String description {get;set;} 
		Global Object destination {get;set;} 
		Global Object dispute {get;set;} 
		Global Object failure_code {get;set;} 
		Global Object failure_message {get;set;} 
		//Global Fraud_details fraud_details {get;set;} 
		Global Object invoice {get;set;} 
		Global Boolean livemode {get;set;} 
		//Global Fraud_details metadata {get;set;} 
		Global Object order {get;set;} 
		Global Boolean paid {get;set;} 
		Global string receipt_email {get;set;} 
		Global integer receipt_number {get;set;} 
		Global Boolean refunded {get;set;} 
		//Global Refunds refunds {get;set;} 
		Global Object shipping {get;set;} 
		//Global Source source {get;set;} 
		Global Object source_transfer {get;set;} 
		Global Object statement_descriptor {get;set;} 
		Global String status {get;set;} 

		Global Object_Z(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'id') {
							id = parser.getText();
						} else if (text == 'object') {
							object_Z = parser.getText();
						} else if (text == 'amount') {
							amount = parser.getIntegerValue();
						} else if (text == 'amount_refunded') {
							amount_refunded = parser.getIntegerValue();
						//} else if (text == 'application_fee') {
							//application_fee = new Object(parser);
						} else if (text == 'balance_transaction') {
							balance_transaction = parser.getText();
						} else if (text == 'captured') {
							captured = parser.getBooleanValue();
						} else if (text == 'created') {
							created = parser.getIntegerValue();
						//} else if (text == 'currency') {
						//	currency = parser.getText();
						//} else if (text == 'customer') {
							//customer = new Object(parser);
						} else if (text == 'description') {
							description = parser.getText();
						//} else if (text == 'destination') {
							//destination = new Object(parser);
						//} else if (text == 'dispute') {
							//dispute = new Object(parser);
						//} else if (text == 'failure_code') {
						//	failure_code = new Object(parser);
						//}else if (text == 'failure_message') {
							//failure_message = new Object(parser);
						//} else if (text == 'fraud_details') {
							//fraud_details = new Fraud_details(parser);
						//} else if (text == 'invoice') {
						//	invoice = new Object(parser);
						} else if (text == 'livemode') {
							livemode = parser.getBooleanValue();
						//} else if (text == 'metadata') {
						//	metadata = new Fraud_details(parser);
						//} else if (text == 'order') {
						//	order = new Object(parser);
						} else if (text == 'paid') {
							paid = parser.getBooleanValue();
						} else if (text == 'receipt_email') {
							receipt_email = parser.getText();
						} else if (text == 'receipt_number') {
							receipt_number = parser.getIntegerValue();
						} else if (text == 'refunded') {
							refunded = parser.getBooleanValue();
						//} else if (text == 'refunds') {
						//	refunds = new Refunds(parser);
						//} else if (text == 'shipping') {
						//	shipping = new Object(parser);
						//} else if (text == 'source') {
						//	source = new Source(parser);
						//} else if (text == 'source_transfer') {
						//	source_transfer = new Object(parser);
						//} else if (text == 'statement_descriptor') {
						//	statement_descriptor = new Object(parser);
						} else if (text == 'status') {
							status = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Object_Z consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
    
    	Global class Data {
		Global Object_Z object_Z {get;set;} // in json: object
        
		Global Data(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'object') {
							object_Z = new Object_Z(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Data consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
    Global static StripeJson parse(String json) {
		return new StripeJson(System.JSON.createParser(json));
	}
 }