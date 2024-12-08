package com.klef.jfsd.springboot.model;

import java.sql.Blob;
import java.util.Base64;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name = "student_table")
public class Student 
{
	//studentId,
	 @Id
	 @Column(name = "student_id")
	 private int studentId;
	 @Column(name="student_name",nullable = false,length = 100)
	 private String studentName;
	 @Column(name="student_email",nullable = false,length = 100,unique = true)
    private String email;
	 @Column(name="student_phone",nullable = false,length = 100,unique = true)
	 private String phone;
	 @Column(name="student_dob",nullable = false,length = 100)
	 private String dateOfBirth;
	 @Column(name="student_gender",nullable = false,length = 100)
	 private String gender;
	 @Column(name="student_dept",nullable = false,length = 100)
	 private String department;
	 @Column(name="student_username",nullable = false, length = 100)
	 private int username;
	 @Column(name="student_password",nullable = false,length = 100)
	 private String password;
	 @Column(name="student_image",nullable = false,length = 100)
	 private Blob image;
	 
	 public String getBase64Image() {
	        try {
	            byte[] bytes = image.getBytes(1, (int) image.length());
	            return Base64.getEncoder().encodeToString(bytes);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	    }
	 
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public int getUsername() {
		return username;
	}
	public void setUsername(int username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
}
