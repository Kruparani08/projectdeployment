package com.klef.jfsd.springboot.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Feedback {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String course;
    private String instructor;
    private int navigation;
    private int easeOfUse;
    private int contentOrganization;
    private String overallSatisfaction;
    private String likes;
    private String improvements;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getInstructor() {
		return instructor;
	}
	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}
	public int getNavigation() {
		return navigation;
	}
	public void setNavigation(int navigation) {
		this.navigation = navigation;
	}
	public int getEaseOfUse() {
		return easeOfUse;
	}
	public void setEaseOfUse(int easeOfUse) {
		this.easeOfUse = easeOfUse;
	}
	public int getContentOrganization() {
		return contentOrganization;
	}
	public void setContentOrganization(int contentOrganization) {
		this.contentOrganization = contentOrganization;
	}
	public String getOverallSatisfaction() {
		return overallSatisfaction;
	}
	public void setOverallSatisfaction(String overallSatisfaction) {
		this.overallSatisfaction = overallSatisfaction;
	}
	public String getLikes() {
		return likes;
	}
	public void setLikes(String likes) {
		this.likes = likes;
	}
	public String getImprovements() {
		return improvements;
	}
	public void setImprovements(String improvements) {
		this.improvements = improvements;
	}

    // Getters and setters
}