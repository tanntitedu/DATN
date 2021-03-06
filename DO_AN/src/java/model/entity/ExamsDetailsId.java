package model.entity;
// Generated Dec 25, 2014 2:34:01 AM by Hibernate Tools 3.6.0



/**
 * ExamsDetailsId generated by hbm2java
 */
public class ExamsDetailsId  implements java.io.Serializable {


     private int examsId;
     private int questionsId;

    public ExamsDetailsId() {
    }

    public ExamsDetailsId(int examsId, int questionsId) {
       this.examsId = examsId;
       this.questionsId = questionsId;
    }
   
    public int getExamsId() {
        return this.examsId;
    }
    
    public void setExamsId(int examsId) {
        this.examsId = examsId;
    }
    public int getQuestionsId() {
        return this.questionsId;
    }
    
    public void setQuestionsId(int questionsId) {
        this.questionsId = questionsId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof ExamsDetailsId) ) return false;
		 ExamsDetailsId castOther = ( ExamsDetailsId ) other; 
         
		 return (this.getExamsId()==castOther.getExamsId())
 && (this.getQuestionsId()==castOther.getQuestionsId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getExamsId();
         result = 37 * result + this.getQuestionsId();
         return result;
   }   


}


