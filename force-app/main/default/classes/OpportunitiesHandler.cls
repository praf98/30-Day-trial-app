public class OpportunitiesHandler 
{    //for insert changes are made from git hub
    public static void oppHandlerMethodInsert(list<Opportunity>opplist)
    {   
        set<id>accId=new set<id>();
        for(Opportunity opp: opplist)
        {
            accId.add(opp.AccountId);
        }
         OpportunitiesHelper.OppAccountUpdate(accId);
    }
  public static void oppHandlerMethodUpdate(list<Opportunity>opplist,map<id,Opportunity>oldMap)
    {   
         set<id>accId=new set<id>();
        for(Opportunity opp: opplist)
        {
            if(opp.Amount!=null && opp.Amount !=Oldmap.get(opp.id).Amount)
            { 
                accId.add(opp.AccountId);
               // System.debug('Trigger Somthing');
            }
        }
         OpportunitiesHelper.OppAccountUpdate(accId);
    }
    public static void oppHandlerMethodDelete(list<Opportunity>opplist2)
    {   
        set<id>accId=new set<id>();
       // system.debug('delet opp');
        for(Opportunity opp: opplist2)
        {
            
                accId.add(opp.AccountId);
            
        }
        OpportunitiesHelper.OppAccountUpdate(accId);
    }
   /* public static void OppHandlerMethodUndelete(list<Opportunity>opplist)
    {   
        set<id>accId=new set<id>();
        for(Opportunity opp: opplist)
        {
            accId.add(opp.AccountId);
        }
    }*/
}