@istest
public class OppTriggerTest 
{
    @Testsetup
    public static void testSetup1()
    {
        Account acc1 = new Account(Name = 'Test Account 1');
        Account acc2 = new Account(Name = 'Test Account 2');
        Insert new List<Account>{acc1, acc2};
            
            list<opportunity> opplist=new list<opportunity>();
        for(integer i=1 ;i<3; i++)
        {
            opportunity opp=new opportunity();
            opp.Name='opp'+ i;
            opp.AccountId=acc1.Id;
            opp.Amount=100 + i;
            opp.StageName='Proposal';
            opp.ForecastCategoryName='closed';
            opp.CloseDate=system.today();
            opplist.add(opp);
        }
        for(integer i=1; i<2; i++)
        {
            opportunity opp=new opportunity();
            opp.Name='opp'+ i;
            opp.AccountId=acc2.Id;
            opp.StageName='Proposal';
            opp.ForecastCategoryName='closed';
            opp.Amount=100 + i;
            opp.CloseDate=system.today();
            opplist.add(opp);
        }
        insert opplist;
        
    }
    @istest
    public static void oppAccountUpdateTest()
    {
        
        List<Account> AccID=[Select id,name,Description from account where name='Test Account 1'];
        Set<Id> AccountID = new set<Id>();
        for (Account acc : AccID) 
        {
            AccountID.add(acc.Id);
        }
        /* list<opportunity> opplist1=[Select id,name,amount,Account.Name from opportunity where accountid=:AccountID];
system.debug(opplist1);*/
        Test.StartTest();
        OpportunitiesHelper.OppAccountUpdate(AccountID);
        Test.stopTest();
        account accontlists=[select id,name,Description ,(SELECT Id, Name, Amount FROM Opportunities ORDER BY Amount DESC LIMIT 1)from account where id=:AccountID limit 1];
        
        System.assertEquals('opp2', accontlists.description);
        
    }
    @istest
    public static void updateaccountTest()
    {
        
        List<Account> AccID=[Select id,name,Description from account where name='Test Account 1'];
        Set<Id> AccountID = new set<Id>();
        for (Account acc : AccID) 
        {
            AccountID.add(acc.Id);
        }
        opportunity opplist1=[Select id,name,amount,Account.Name from opportunity where accountid=:AccountID And Name='Opp1' ];
        
        opplist1.amount=8963154;    //update oppp
        update opplist1;
        
        Test.startTest();
        OpportunitiesHelper.OppAccountUpdate(AccountID);
        Test.stopTest();
        account accontlists=[select id,name,Description from account where id=:AccountID limit 1];
        
        System.assertEquals('opp1', accontlists.description);
        
    }
    @istest
    public static void deleteteAccountTest()
    {
        
        List<Account> accList = [SELECT Id FROM Account];
        Set<Id> AccountID = new Set<Id>();
        for (Account acc : accList) 
        {
            AccountID.add(acc.Id);
        }
       // for delete
         list<opportunity> opplist =[select id,name from opportunity limit 1];
        delete opplist;
         Test.startTest();
        OpportunitiesHelper.OppAccountUpdate(AccountID);        
        Test.stopTest();
    }
}