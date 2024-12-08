package com.klef.jfsd.springboot.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.klef.jfsd.springboot.model.Assignment;
import com.klef.jfsd.springboot.repository.AssignmentRepository;

@Service
public class AssignmentServiceImpl implements AssignmentService 
{
	@Autowired
    private AssignmentRepository assignmentRepository;

	private final String uploadDir = "D:\\JFSD\\Assignments\\";

    public Assignment saveAssignment(MultipartFile file, String title, String description) throws IOException 
    {
        String fileName = file.getOriginalFilename();
        String filePath = uploadDir + fileName;

        // Save file to disk
        File dir = new File(uploadDir);
        if (!dir.exists()) dir.mkdirs();
        file.transferTo(new File(filePath));

        // Save assignment details in the database
        Assignment assignment = new Assignment();
        assignment.setTitle(title);
        assignment.setDescription(description);
        assignment.setFileName(fileName);
        assignment.setFilePath(filePath);
        assignment.setUploadDate(new Date());

        return assignmentRepository.save(assignment);
    }

    public List<Assignment> getAllAssignments() {
        return assignmentRepository.findAll();
    }
}
