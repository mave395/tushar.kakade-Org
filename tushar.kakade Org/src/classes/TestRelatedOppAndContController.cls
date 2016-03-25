@isTest
public class TestRelatedOppAndContController
{
    public static testMethod void validateRelatedOppAndContControllerPositive(){
        System.Test.setCurrentPage(new PageReference('/apex/AllAccounts'));
        ApexPages.StandardSetController controller;
        RelatedOppAndContController testROACC = new RelatedOppAndContController(controller);
        
        Account testDataAccount = new Account( Name='Gmail');                                                          
        insert testDataAccount ;                                                      
        
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User testUser = new User(Alias = 'standt', Email='standarduser@testorg.com',
              EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
              LocaleSidKey='en_US', ProfileId = p.Id,
              TimeZoneSidKey='America/Los_Angeles', UserName='standarduser395@testorg.com');
            
        insert testUser; 
        
        List<Contact> lstDummyContacts = new List<Contact>{  
                                new Contact(lastname='Alia',Email='alia@gmail.com',AccountId = testDataAccount.id),
                                new Contact(lastname='Deepika',Email='deepika@gmail.com'),
                                new Contact(lastname='Kangana',Email='kangana@gmail.com'),
                                new Contact(lastname='Karishma',Email='karishma@gmail.com'),
                                new Contact(lastname='Pooja',Email='pooja@gmail.com')};
                                
        insert lstDummyContacts;
                                
        Opportunity newOpp = new Opportunity(
                                    AccountId = testDataAccount.id,
                                    Name = 'Opp 1',
                                    CloseDate = System.today() + 90,
                                    OwnerId = testUser.Id,
                                    StageName = 'Closed Won');
        insert newOpp;  
        
        testROACC.accId = testDataAccount.id;
        testROACC.displayRelatedLists();
    }  
    
    public static testMethod void validateRelatedOppAndContControllerNegative(){
        System.Test.setCurrentPage(new PageReference('/apex/AllAccounts'));
        ApexPages.StandardSetController controller;
        RelatedOppAndContController testROACC = new RelatedOppAndContController(controller);
        
        Account testDataAccount = new Account( Name='Gmail');                                                          
        insert testDataAccount ;                                                      
        
        
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User testUser = new User(Alias = 'standt', Email='standarduser@testorg.com',
              EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
              LocaleSidKey='en_US', ProfileId = p.Id,
              TimeZoneSidKey='America/Los_Angeles', UserName='standarduser395@testorg.com');
            
        insert testUser; 
        
        testROACC.accId = testDataAccount.id;
        testROACC.displayRelatedLists();
    }                    
}