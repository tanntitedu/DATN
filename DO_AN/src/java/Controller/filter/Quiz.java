package Controller.filter;
// Generated Dec 23, 2014 7:47:50 PM by Hibernate Tools 3.6.0


import java.util.HashSet;
import java.util.Set;

/**
 * Quiz generated by hbm2java
 */
public class Quiz  implements java.io.Serializable {


     private int quizId;
     private Disciplines disciplines;
     private String content;
     private Boolean active;
     private Boolean isview;
     private Set examsDetailses = new HashSet(0);
     private Set questionses = new HashSet(0);

    public Quiz() {
    }

	
    public Quiz(int quizId) {
        this.quizId = quizId;
    }
    public Quiz(int quizId, Disciplines disciplines, String content, Boolean active, Boolean isview, Set examsDetailses, Set questionses) {
       this.quizId = quizId;
       this.disciplines = disciplines;
       this.content = content;
       this.active = active;
       this.isview = isview;
       this.examsDetailses = examsDetailses;
       this.questionses = questionses;
    }
   
    public int getQuizId() {
        return this.quizId;
    }
    
    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }
    public Disciplines getDisciplines() {
        return this.disciplines;
    }
    
    public void setDisciplines(Disciplines disciplines) {
        this.disciplines = disciplines;
    }
    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    public Boolean getActive() {
        return this.active;
    }
    
    public void setActive(Boolean active) {
        this.active = active;
    }
    public Boolean getIsview() {
        return this.isview;
    }
    
    public void setIsview(Boolean isview) {
        this.isview = isview;
    }
    public Set getExamsDetailses() {
        return this.examsDetailses;
    }
    
    public void setExamsDetailses(Set examsDetailses) {
        this.examsDetailses = examsDetailses;
    }
    public Set getQuestionses() {
        return this.questionses;
    }
    
    public void setQuestionses(Set questionses) {
        this.questionses = questionses;
    }




}


