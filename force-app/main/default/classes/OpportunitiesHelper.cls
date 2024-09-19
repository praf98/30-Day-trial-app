public class OpportunitiesHelper 
{
  public Static void oppAccountUpdate(Set<id>acountiD)
  {
      list<account>acoIDlist=new list<account>();
      list <account> accountList= [select id,name,Description ,(SELECT Id, Name, Amount FROM Opportunities ORDER BY Amount DESC LIMIT 1)from account where id=:acountiD];
     
      for(Account acon:accountList)
      {
          acon.Description=acon.Opportunities[0].name;
          //system.debug(acon.Opportunities[0].name);
          acoIDlist.add(acon);
      }
     // system.debug(acoIDlist);
      try
      {
          if(acoIDlist.size()>0)
          {
              update acoIDlist;
          }
      }
      catch(exception e)
      {
          system.debug('DML Exception'+ e.getmessage());
      }
  
  }
}