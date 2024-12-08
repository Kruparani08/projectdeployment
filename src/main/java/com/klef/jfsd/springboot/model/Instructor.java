package com.klef.jfsd.springboot.model;

import java.sql.Blob;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "instructor_table")
public class Instructor 
{
	@Id
	@Column(name = "ins_id")
	private int id;
	@Column(name = "ins_name",nullable=false,length = 50)
	private String name;
	@Column(name = "ins_gender",nullable=false,length = 20)
	private String gender;
	@Column(name = "ins_joiningDate",nullable=false,length = 50)
	private String joiningDate;
	@Column(name = "ins_email",unique = true ,nullable=false,length = 50)
	private String email;
	@Column(name = "ins_contact",unique = true,nullable=false,length = 50)
	private String contact;
	@Column(name = "ins_department", nullable=false,length = 50)
	private String department;
	@Column(name = "ins_designation",nullable=false,length = 50)
	private String designation;
	@Column(name = "ins_salary",nullable=false)
	private double salary;
	@Column(name = "ins_address",nullable=false,length = 50)
	private String address;
	@Column(name="ins_password",nullable=false,length = 50)
	private String password;
	
	@OneToMany(mappedBy = "instructor", cascade = CascadeType.ALL) 
	private List<Course> courses;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJoiningDate() {
		return joiningDate;
	}
	public void setJoiningDate(String joiningDate) {
		this.joiningDate = joiningDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Course> getCourses() {
		return courses;
	}
	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

}
