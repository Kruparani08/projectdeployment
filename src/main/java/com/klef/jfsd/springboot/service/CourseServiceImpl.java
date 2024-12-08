package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Instructor;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.InstructorRepository;

@Service
public class CourseServiceImpl implements CourseService
{
	@Autowired
	private CourseRepository courserepository;
	@Autowired
	private InstructorRepository instructorrepository;
	
	
	@Override
	public String addCourse(Course c) 
	{
		courserepository.save(c);
		return "Course added successfully";
	}


	@Override
	public List<Course> displayallcourses()
	{
		return (List<Course>) courserepository.findAll();
	}


	@Override
	public Course getCourseByCode(String courseCode)
	{
		 return courserepository.findById(courseCode).orElse(null);
	}


	@Override
	public void updateCourseDetails(Course course) 
	{
		courserepository.save(course);
	}


	@Override
	public void deleteCourseByCode(String courseCode) 
	{
		courserepository.deleteById(courseCode); 
	}


	@Override
	public List<Course> getCoursesByInstructorId(int instructorId) 
	{
		return courserepository.findByInstructorId(instructorId);
	}
	

}
