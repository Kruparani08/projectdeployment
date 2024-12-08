package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Course;

public interface CourseService
{
	public String addCourse(Course c);
	public List<Course> displayallcourses();
	public Course getCourseByCode(String courseCode);
    public void updateCourseDetails(Course course);
    public void deleteCourseByCode(String courseCode);

    List<Course> getCoursesByInstructorId(int instructorId);

}
