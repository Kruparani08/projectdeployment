package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Student;
@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> 
{
	List<Student> findAll();
	
	@Query("select s from Student s where s.studentId=?1 and s.password=?2")
	public Student checkstudentlogin(int id,String pwd);
}
