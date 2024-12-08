package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Map;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;

public interface StudentService 
{
	public String AddStudent(Student student);
	public List<Student> getAllStudents();
	public Student viewStudentById(int id);
	public Student checkstudentlogin(int id,String pwd);
	public void updateStudentDetails(Student student);
	public void deleteStudentById(int id);
	public Map<String, Long> getDashboardCounts();
	  public Course getCourseByCourseCode(String courseCode);
}
