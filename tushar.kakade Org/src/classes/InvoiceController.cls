public class InvoiceController{

    public List<Invoice_Statement__c>allInvoices {get;set;}
    
    public String invoiceId{get;set;}
    
    public List<Line_Item__c> lstLineItems{get;set;}
    
    public List<Invoice_Statement__c> invoiceRecord{get;set;}
    
    public InvoiceController() {
         invoiceId = ApexPages.currentPage().getParameters().get('invId');
         allInvoices =[SELECT City__c,Company_Name__c,Email__c,Id,Invoice_Date__c,
                              Name,Name__c,Phone__c,State__c,Street__c,ZIP__c 
                              FROM Invoice_Statement__c];
         lstLineItems = [SELECT Id,name,description__c,amount__c FROM Line_Item__c WHERE Invoice_Statement__c = :invoiceId];
         invoiceRecord =[SELECT City__c,Company_Name__c,Email__c,Id,Invoice_Date__c,
                               Name,Name__c,Phone__c,State__c,Street__c,ZIP__c 
                               FROM Invoice_Statement__c WHERE Id = :invoiceId];                     
                              
    }
 
    
    public PageReference getInvoiceStatement(){
         System.debug('invoiceId-->'+invoiceId); 
        lstLineItems = [SELECT Id,name,description__c,amount__c FROM Line_Item__c WHERE Invoice_Statement__c = :invoiceId];
        invoiceRecord =[SELECT Invoice_Date__c,City__c,Company_Name__c,Email__c,Id,
                               Name,Name__c,Phone__c,State__c,Street__c,ZIP__c 
                               FROM Invoice_Statement__c WHERE Id = :invoiceId];
        System.debug('lstLineItems--> '+lstLineItems );
        System.debug('invoiceRecord--> '+invoiceRecord );
        PageReference recptDetls = new PageReference('/apex/Receipt_Details_Pdf?invID='+invoiceId);
        System.debug(invoiceId);        
        recptDetls.setRedirect(true);
        System.debug('lstLineItems2--> '+lstLineItems );
        System.debug('invoiceRecord2--> '+invoiceRecord );
        return recptDetls;
    }

    

    public void display(){
        lstLineItems = [SELECT Id,name,description__c,amount__c FROM Line_Item__c WHERE Invoice_Statement__c = :invoiceId];
        invoiceRecord =[SELECT  City__c,Company_Name__c,Invoice_Date__c,
                                Email__c,Id,Name,Name__c,
                                Phone__c,State__c,Street__c,ZIP__c 
                                FROM Invoice_Statement__c WHERE Id = :invoiceId];
    }
}
//SELECT Id,name,description__c,amount__c FROM Line_Item__c WHERE Invoice_Statement__c = 'a012800000KEMYJAA5'
//SELECT City__c,Company_Name__c,Email__c,Id,Name,Name__c,Phone__c,State__c,Street__c,ZIP__c FROM Invoice_Statement__c WHERE Id = :invoiceId