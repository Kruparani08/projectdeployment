package com.klef.jfsd.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Instructor;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.InstructorRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class InstructorServiceImpl implements InstructorService
{
	@Autowired
	 private StudentRepository studentRepository;

	 @Autowired
	 private InstructorRepository instructorRepository;

	 @Autowired
	 private CourseRepository courseRepository;

	@Override
	public String addInstructor(Instructor instructor) 
	{
        instructorRepository.save(instructor);
        return "Instructor Added Successfully";
	}

	@Override
	public List<Instructor> getAllInstructors() 
	{
		  return instructorRepository.findAll();
	}

	@Override
	public Instructor checkinstructorlogin(int id, String pwd)
	{
		return instructorRepository.checkinstructorlogin(id, pwd);
	}
	
	public Instructor getInstructorById(int id) {
        return instructorRepository.findById(id).orElse(null);
    }

    public void updateInstructorDetails(Instructor updatedInstructor) {
        Instructor instructor = instructorRepository.findById(updatedInstructor.getId()).orElse(null);
        if (instructor != null) {
            instructor.setName(updatedInstructor.getName());
            instructor.setGender(updatedInstructor.getGender());
            instructor.setJoiningDate(updatedInstructor.getJoiningDate());
            instructor.setDepartment(updatedInstructor.getDepartment());
            instructor.setDesignation(updatedInstructor.getDesignation());
            instructor.setSalary(updatedInstructor.getSalary());
            instructor.setAddress(updatedInstructor.getAddress());
            instructorRepository.save(instructor);
        }
    }

	@Override
	public void deleteInstructorById(int id)
	{
	        instructorRepository.deleteById(id);
	}
	public Map<String, Long> getDashboardCounts() {
        Map<String, Long> counts = new HashMap<>();
        counts.put("students", studentRepository.count());
        counts.put("courses", courseRepository.count());
        return counts;
    }
	
}
