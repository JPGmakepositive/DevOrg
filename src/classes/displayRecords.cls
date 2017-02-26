public class displayRecords {
/*custom controller for the runpaymentschedule visualforce page. This will query the opportunities that meet
 * the criteria and when the run button is clicked it will create child records*/
public List <opportunity> allOpps {get;set;}
    
public list<opportunity> oppsToShow = new list<opportunity>();    
    
     //Navigation variables
    Integer counter = 0;//TO track the number of records parsed
    Integer limitSize = 10;//Number of records to be displayed
    Integer totalSize =0; //To Store the total number of records available
    
    
List <Payment_schedule__c> psList = new list <payment_schedule__c>();  

    public displayRecords(){
        allopps= [SELECT id, closeDate, amount,name FROM opportunity WHERE isPrivate =TRUE];
        totalSize=allopps.size();
        
        //Intial adding of contacts to ContactsToShow
        //check the total records are more than limitSize and assign the records
        if((counter+limitSize) <= totalSize){
            for(Integer i=0;i<limitSize;i++){
                oppsToShow.add(Allopps.get(i));
            }
        	}else{
            	for(Integer i=0;i<totalSize;i++){
                oppsToShow.add(Allopps.get(i));
            	}
        	}
        
    }
   
     //Navigation methods
    
    
	public void beginning(){
   
        oppsToShow.clear();
        counter=0;
        if((counter + limitSize) <= totalSize){
       
            for(Integer i=0;i<limitSize;i++){
                oppsToShow.add(Allopps.get(i));
            }   
           
        } else{
       
            for(Integer i=0;i<totalSize;i++){
                oppsToShow.add(Allopps.get(i));
            }       
           
        }
       
    }
    
    public void next(){
   
        oppsToShow.clear();
        counter=counter+limitSize;
       
        if((counter+limitSize) <= totalSize){
            for(Integer i=counter-1;i<(counter+limitSize);i++){
                oppsToShow.add(Allopps.get(i));
            }
        } else{
            for(Integer i=counter;i<totalSize;i++){
                oppsToShow.add(Allopps.get(i));
            }
        }
    }
    
     public void previous(){
   
        oppsToShow.clear();

        counter=counter-limitSize;       
       
        for(Integer i=counter;i<(counter+limitSize); i++){
            oppsToShow.add(Allopps.get(i));
        }
    }

    public void last (){
   
        oppsToShow.clear();
       
        if(math.mod(totalSize , limitSize) == 0){
            counter = limitSize * ((totalSize/limitSize)-1);
        } else if (math.mod(totalSize , limitSize) != 0){
            counter = limitSize * ((totalSize/limitSize));
        }
       
        for(Integer i=counter-1;i<totalSize-1;i++){
                oppsToShow.add(Allopps.get(i));
        }
       
    }
    
    public Boolean getDisableNext(){
   
        if((counter + limitSize) >= totalSize )
            return true ;
        else
            return false ;
    }
   
    public Boolean getDisablePrevious(){
   
        if(counter == 0)
            return true ;
        else
            return false ;
    } 

	public pageReference CreateChildRecords(){
      //date format used for the naming convention 
        date dt = system.today();
		string st=dt.format();
     //loop through the opportunities that where queried and create a payment schedule child record for each of them   
        for (opportunity o:allopps){
            Payment_schedule__c ps = new Payment_schedule__c();
            ps.Date__c = o.closedate;
            ps.amount__c = o.Amount;
            ps.Opportunity__c = o.Id;
            ps.Name = 'Payment - '+ st + ' - ' +'£'+ o.amount;
            
            psList.add(ps);
            system.debug(pslist.size());
            
        }//loop end
        try {    	    		
            insert psList;
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Payment Schedules Added Succesfully'));
       		
         //clear the list after insert to avoid errors if the "run" button is pressed more than once
            psList.clear();
        	}catch (system.DmlException e){
             
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'There was an error while inserting the records: '+ e));
            	system.debug(e);
        	}
        
   return null;
    }//recordcreate end
    
}