public with sharing class ReactDemoController {
  public String sfInstanceUrl {get; set;}

  public ReactDemoController() {
    sfInstanceUrl = URL.getSalesforceBaseUrl().toExternalForm() + '/';
  }

  @RemoteAction
  public static List<Account> loadAccounts() {
    return [select Id, Name, ShippingCountry, AnnualRevenue
            from Account
            where AnnualRevenue > 1000
            order by Name
            limit 10000];
  }

  @RemoteAction
  public static List<Opportunity> loadOpportunities(String accountId) {
    return [select Id, Name, AccountId, StageName, Amount, CloseDate, NextStep, 
                   Probability, Description
            from Opportunity
            where AccountId = :accountId];
  }
}