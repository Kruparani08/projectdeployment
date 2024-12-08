package com.klef.jfsd.springboot.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "quiz_table")
public class Quiz 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String quizName;
	private String[] questions;
    private String[][] options;
    private int[] answers;
    public Quiz(String quizName, String[] questions, String[][] options, int[] answers) {
		super();
		this.quizName = quizName;
		this.questions = questions;
		this.options = options;
		this.answers = answers;
	}
	public String getQuizName() {
		return quizName;
	}
	public void setQuizName(String quizName) {
		this.quizName = quizName;
	}
	public String[] getQuestions() {
		return questions;
	}
	public void setQuestions(String[] questions) {
		this.questions = questions;
	}
	public String[][] getOptions() {
		return options;
	}
	public void setOptions(String[][] options) {
		this.options = options;
	}
	public int[] getAnswers() {
		return answers;
	}
	public void setAnswers(int[] answers) {
		this.answers = answers;
	}


}
