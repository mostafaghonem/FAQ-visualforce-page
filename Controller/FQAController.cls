public class FQAController {

    public List<FQA__c> fQARecord {get; set;}
    String option ;
    set<String> myString = new set<String>();
    Boolean result;

 	public FQAController() {

        fQARecord=[Select id,Answer__c,Category__c,Question__c From FQA__c];

        
    }
    public List<SelectOption> getSoptions() {
        //Intialize the selectOptions with The Pickup list values of Categories
        List<SelectOption> Soptions = new List<SelectOption>();
        Soptions.add(new SelectOption('--Select--','--Select--'));
        for(FQA__c f:fQARecord){
            result = true;
            result = myString.contains(f.Category__c);
            if(result == false){
                myString.add(f.Category__c);
                Soptions.add(new SelectOption(f.Category__c,f.Category__c));
            }
        }
        myString = new set<String>();
        return Soptions;
    }
    
    public String getOption(){
        return option;
    }
    public void setOption(String option){
        this.option = option;
    }

}