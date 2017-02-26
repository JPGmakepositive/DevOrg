public class ClosureCodeController {

// Variables to store country and state selected by user
    public String closureCode { get; set; }
    public String controllingField {get; set;}   

    // Generates country dropdown from country settings
    public List<SelectOption> getControllingField1SelectList() {
        List<SelectOption> options1 = new List<SelectOption>();
        options1.add(new SelectOption('', '-- Select One --'));        

        // Find all the countries in the custom setting
        Map<String, controlling_Field__c> crtlfield = controlling_field__c.getAll();
        
        // Sort them by name
        List<String> ctrlfieldnames = new List<String>();
        ctrlfieldnames.addAll(crtlfield.keySet());
        ctrlfieldnames.sort();
        
        // Create the Select Options.
        for (String ctrlfld : ctrlfieldnames) {
            controlling_field__c cf = crtlfield.get(ctrlfld);
            options1.add(new SelectOption(cf.point_of_origin__c, cf.Name));
        }
        return options1;
    }
    
        public List<SelectOption> getControllingField2SelectList() {
        List<SelectOption> options2 = new List<SelectOption>();
        options2.add(new SelectOption('', '-- Select One --'));        

        // Find all the countries in the custom setting
        Map<String, controlling_Field__c> crtlfield = controlling_field__c.getAll();
            
        
        // Sort them by name
        List<String> ctrlfieldnames = new List<String>();
        ctrlfieldnames.addAll(crtlfield.keySet());
        ctrlfieldnames.sort();
        
        // Create the Select Options.
        for (String ctrlfld : ctrlfieldnames) {
            controlling_field__c cf = crtlfield.get(ctrlfld);
            options2.add(new SelectOption(cf.point_of_origin__c, cf.Name));
        }
        return options2;
    }
    
    // To generate the states picklist based on the country selected by user.
    public List<SelectOption> getStatesSelectList() {
        List<SelectOption> options = new List<SelectOption>();
        // Find all the states we have in custom settings.
        Map<String, Closure_code__c> closureCodes = Closure_code__c.getAll();

        // Filter states that belong to the selected country
        Map<String, closure_code__c> codes = new Map<String, closure_code__c>();
        for(closure_code__c c : closureCodes.values()) {
            if (c.controlling_field__c == this.controllingField) {
                codes.put(c.name, c);
            }
        }
        
        // Sort the states based on their names
        List<String> closureNames = new List<String>();
        closureNames.addAll(codes.keySet());
        closureNames.sort();
        
        // Generate the Select Options based on the final sorted list
        for (String closureName : closureNames) {
            closure_code__c cc = codes.get(closureName);
            options.add(new SelectOption(cc.closure_code__c, cc.closure_code__c));
        }
        
        // If no states are found, just say not required in the dropdown.
        if (options.size() > 0) {
            options.add(0, new SelectOption('', '-- Select One --'));
        } else {
            options.add(new SelectOption('', 'Not Required'));
        }
        return options;
    }
}