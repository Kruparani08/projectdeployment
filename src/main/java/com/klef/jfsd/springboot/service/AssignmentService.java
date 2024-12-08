package com.klef.jfsd.springboot.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.klef.jfsd.springboot.model.Assignment;

public interface AssignmentService 
{
	public Assignment saveAssignment(MultipartFile file, String title, String description) throws IOException;
	public List<Assignment> getAllAssignments();

}
