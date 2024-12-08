package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "course_table")
public class Course 
{
	@Id
    @Column(name = "course_code")
    private String courseCode;

    @Column(name = "course_name", nullable = false, length = 50)
    private String courseName;

    @Column(name = "course_credits", nullable = false)
    private double credits;

    @Column(name = "course_instructor", length = 50)
    private String instructorName;

    @Column(name = "course_department", nullable = false, length = 20)
    private String department;

    @Column(name = "lecture_hours", nullable = false)
    private double lectureHours;

    @Column(name = "tutorial_hours", nullable = false)
    private double tutorialHours;

    @Column(name = "practical_hours", nullable = false)
    private double practicalHours;

    @Column(name = "skill_hours", nullable = false)
    private double skillHours;
    
    @ManyToOne 
    @JoinColumn(name = "instructor_id") 
    private Instructor instructor;

	public String getCourseCode() {
		return courseCode;
	}

	public void setCourseCode(String courseCode) {
		this.courseCode = courseCode;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public double getCredits() {
		return credits;
	}

	public void setCredits(double credits) {
		this.credits = credits;
	}

	public String getInstructorName() {
		return instructorName;
	}

	public void setInstructorName(String instructorName) {
		this.instructorName = instructorName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public double getLectureHours() {
		return lectureHours;
	}

	public void setLectureHours(double lectureHours) {
		this.lectureHours = lectureHours;
	}

	public double getTutorialHours() {
		return tutorialHours;
	}

	public void setTutorialHours(double tutorialHours) {
		this.tutorialHours = tutorialHours;
	}

	public double getPracticalHours() {
		return practicalHours;
	}

	public void setPracticalHours(double practicalHours) {
		this.practicalHours = practicalHours;
	}

	public double getSkillHours() {
		return skillHours;
	}

	public void setSkillHours(double skillHours) {
		this.skillHours = skillHours;
	}

	public Instructor getInstructor() {
		return instructor;
	}

	public void setInstructor(Instructor instructor) {
		this.instructor = instructor;
	}


}
