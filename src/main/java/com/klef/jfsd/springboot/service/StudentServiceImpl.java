package com.klef.jfsd.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;
@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Override
	public String AddStudent(Student student)
	{
		studentRepository.save(student);
		return "Student Added Successfully";
	}

	@Override
	public List<Student> getAllStudents() 
	{
	     return studentRepository.findAll();
	}

	@Override
	public Student viewStudentById(int id)
	{
	        return studentRepository.findById(id).orElse(null); 
	}

	@Override
	public Student checkstudentlogin(int id, String pwd) 
	{
		return studentRepository.checkstudentlogin(id, pwd);
	}

	@Override
	public void updateStudentDetails(Student student) 
	{
		 studentRepository.save(student);
	}

	@Override
	public void deleteStudentById(int id) 
	{
		 studentRepository.deleteById(id); 
	}
	
	public Map<String, Long> getDashboardCounts() {
        Map<String, Long> counts = new HashMap<>();
        counts.put("courses", courseRepository.count());
        return counts;
    }
	   @Override
	    public Course getCourseByCourseCode(String courseCode) {
	        return courseRepository.findByCourseCode(courseCode);  // Use the corrected method
	    }
}
