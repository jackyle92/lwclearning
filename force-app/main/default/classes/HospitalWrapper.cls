global with sharing class HospitalWrapper {
    public String Name;
    public String Ref_Code;

    global HospitalWrapper(Account acct) {
        if(acct != null) {
            this.Name = acct.Name;
            this.Ref_Code = acct.Hospital_Ref_Code__c;
        }
    }
}