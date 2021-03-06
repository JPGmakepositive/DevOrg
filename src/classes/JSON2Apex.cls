//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//
// The supplied json has fields with names that are reserved words in apex
// and so can only be parsed with explicitly generated code, this option
// was auto selected for you.
@RestResource(urlMapping='/stripe2/*')

Global class JSON2Apex {
    @HttpPost
   global static String doPost()
   {
       	
        RestRequest req = RestContext.request;
        Blob body = req.requestBody;
       	String bodyString = body.toString();
       
       return bodystring;
   }
	public static void consumeObject(JSONParser parser) {
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

	public Data data {get;set;} 

	public JSON2Apex(JSONParser parser) {
		while (parser.nextToken() != JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != JSONToken.VALUE_NULL) {
					if (text == 'data') {
						data = new Data(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'Root consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Object_Z {
		public String id {get;set;} 
		public Integer amount {get;set;} 
		public String customer {get;set;} 
		public String description {get;set;} 
		public Boolean paid {get;set;} 
		public String receipt_email {get;set;} 

		public Object_Z(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'id') {
							id = parser.getText();
						} else if (text == 'amount') {
							amount = parser.getIntegerValue();
						} else if (text == 'customer') {
							customer = parser.getText();
						} else if (text == 'description') {
							description = parser.getText();
						} else if (text == 'paid') {
							paid = parser.getBooleanValue();
						} else if (text == 'receipt_email') {
							receipt_email = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Object_Z consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Data {
		public Object_Z object_Z {get;set;} // in json: object

		public Data(JSONParser parser) {
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
	
	
	public static JSON2Apex parse(String json) {
		return new JSON2Apex(System.JSON.createParser(json));
	}
}