package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Course;
@Repository
public interface CourseRepository extends JpaRepository<Course, String>
{
	List<Course> findByInstructorId(int instructorId);

//	Course getCourseCode(String courseCode);
    Course findByCourseCode(String courseCode);  // Corrected method name


}
