@isTest
private class LeadAssignmentTesting{

	static testMethod void TestLeadAssignmentTest(){
    //Create a New test Lead 
	lead l = new lead();
    l.LastName = 'test';
    l.Company = 'testComp';
    l.Status = 'New';
    l.Country = 'USA';
        
    insert l;
        
	system.debug('owner'+l.OwnerId);    
    
    //Query the lead we just added so we can assert that it was assigned to the correct queue
    list<lead> leadOwner = new list<lead>();
    leadOwner = [SELECT id,OwnerId from Lead WHERE id = :l.Id LIMIT 1];
    string Idowner = leadOwner[0].ownerid; 
    //Assert queue using 18-digit Id
    system.assertEquals('00G24000001MeQwEAK',idowner);  
    } 
}