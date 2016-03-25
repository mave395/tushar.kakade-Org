public class RelatedOppAndContController{

    public Boolean opportunitiesRendered {get;set;} 
    public Boolean contactsRendered {get;set;}    
    public String accId{get;set;}
    
    public List<Contact> accRelatedContacts{get;set;}    
    public List<Opportunity> accRelatedOpportunities{get;set;}
    
    
    //Related lists hidden on PageLoad.
    public relatedOppAndContController(ApexPages.StandardSetController controller) {
        opportunitiesRendered = False;
        contactsRendered = False;
    }
    
    //Display releted lists based on Account that has been clicked.
    public void displayRelatedLists(){
        
        accRelatedContacts = [SELECT Name,Phone FROM Contact WHERE accountId = :accId];
        accRelatedOpportunities = [SELECT Name FROM Opportunity WHERE accountId = :accId];
        
        if(!accRelatedContacts.isEmpty()){
            contactsRendered = True;
        }else{contactsRendered = False;}
        
        if(!accRelatedOpportunities.isEmpty()){
            opportunitiesRendered = True;
        }else{opportunitiesRendered = False;}                 
    }
}