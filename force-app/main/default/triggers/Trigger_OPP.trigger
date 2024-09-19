trigger Trigger_OPP on Opportunity (After insert,after update,after undelete,after delete) 
{
  if(trigger.isafter)
  {
      if(trigger.isinsert)
      {
          OpportunitiesHandler.OppHandlerMethodInsert(trigger.new);
      }
      if(trigger.isupdate)
      {
          OpportunitiesHandler.OppHandlerMethodUpdate(trigger.new,trigger.oldmap);
      }
    if(trigger.isdelete)
      {
          OpportunitiesHandler.OppHandlerMethodDelete(trigger.old);
      }
     /* if(trigger.isundelete)
      {
          OpportunitiesHandler.OppHandlerMethodUndelete(trigger.new);
      }*/
  }
}