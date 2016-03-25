@isTest
public class TestInvoiceController{
    
    public static testMethod void validateInvoiceController(){
        Invoice_Statement__c invStmt = new Invoice_Statement__c (City__c='Pune',Company_Name__c='Eternus',Email__c='test@gmail.com',
        Name__c='Tommy',Phone__c='7877878787',State__c='Maharashtra',Street__c='NSG Street',ZIP__c=123456);
        insert invStmt;
        
        Line_Item__c lineOne = new Line_Item__c(Amount__c=10000,Description__c='Samsung TV',Invoice_Statement__c=invStmt.id);
        System.debug('lineOne ==>'+lineOne );
        Line_Item__c lineTwo = new Line_Item__c(Amount__c=20000,Description__c='Sony TV',Invoice_Statement__c=invStmt.id);
        Line_Item__c lineThree = new Line_Item__c(Amount__c=30000,Description__c='Micromax TV',Invoice_Statement__c=invStmt.id);
        
        List<Line_Item__c> lstLineItems = new List<Line_Item__c>();
            lstLineItems.add(lineOne );
            lstLineItems.add(lineTwo );
            lstLineItems.add(lineThree );
        insert lstLineItems;
        
        InvoiceController invCtrl = new InvoiceController();
        
        Test.startTest();
        invCtrl.invoiceId = invStmt.Id;
        invCtrl.allInvoicesDisplay();
        invCtrl.getInvoiceStatement();
                
        PageReference pageRef = new PageReference('/apex/Receipt_Details_Pdf?invID='+invStmt.id);
        System.Test.setCurrentPage(pageRef);
        
        invCtrl.display();
        Test.stopTest();
        
    }
    
}