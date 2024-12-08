package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Map;

import com.klef.jfsd.springboot.model.Instructor;
import com.klef.jfsd.springboot.model.Student;

public interface InstructorService 
{
	public String addInstructor(Instructor instructor);
	public List<Instructor> getAllInstructors();
	public Instructor getInstructorById(int id);
	public Instructor checkinstructorlogin(int id,String pwd);
	public void updateInstructorDetails(Instructor updatedInstructor);
	public void deleteInstructorById(int id);
	public Map<String, Long> getDashboardCounts();

}
