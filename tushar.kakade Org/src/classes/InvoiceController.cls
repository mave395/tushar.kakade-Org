public class InvoiceController{

    public List<Invoice_Statement__c>allInvoices {get;set;}    
    public String invoiceId{get;set;}    
    public List<Line_Item__c> lstLineItems{get;set;}    
    public List<Invoice_Statement__c> invoiceRecord{get;set;}
    
    //called on action of Invoice_Receipts VF Page
    public void allInvoicesDisplay() {
         
        allInvoices =[SELECT City__c,Company_Name__c,Email__c,Id,Invoice_Date__c,
                              Name,Name__c,Phone__c,State__c,Street__c,ZIP__c 
                              FROM Invoice_Statement__c];                   
    }
 
    //called on selection of particular invoice on Invoice_Receipts VF Page
    public PageReference getInvoiceStatement(){
    
        PageReference recptDetls = new PageReference('/apex/Receipt_Details_Pdf?invID='+invoiceId);                
        recptDetls.setRedirect(true);
        return recptDetls;
    }

    
    //called on action of Receipt_Details_Pdf VF Page
    public void display(){
        invoiceId = ApexPages.currentPage().getParameters().get('invId');
        lstLineItems = [SELECT Id,name,description__c,amount__c,Tax__c,Total__c FROM Line_Item__c WHERE Invoice_Statement__c = :invoiceId];
        invoiceRecord =[SELECT  City__c,Company_Name__c,Invoice_Date__c,
                                Email__c,Id,Name,Name__c,
                                Phone__c,State__c,Street__c,ZIP__c,Total_Bill__c 
                                FROM Invoice_Statement__c WHERE Id = :invoiceId];
    }
}