package com.klef.jfsd.springboot.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Instructor;
import com.klef.jfsd.springboot.model.Student;
@Repository
public interface InstructorRepository extends JpaRepository<Instructor, Integer> 
{
	@Query("select i from Instructor i where i.id=?1 and i.password=?2")
	public Instructor checkinstructorlogin(int id,String pwd);
}
