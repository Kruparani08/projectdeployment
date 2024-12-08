package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.service.CourseService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(path = "/student")
public class StudentController 
{
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private CourseService courseservice;
	
;
	
	@GetMapping("login")
	public ModelAndView studentlogin()
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("studentlogin");
	    return mv;
	}
	
	@PostMapping("checkstudentlogin")
    public ModelAndView checkstudentlogin(HttpServletRequest request)
    {
	 	 ModelAndView mv = new ModelAndView();
	 	 
	 	 int id =Integer.parseInt(request.getParameter("id").trim()); 
	 	 String pwd = request.getParameter("pwd");
	 	 
	 	 Student student = studentService.checkstudentlogin(id, pwd);
	 	 
	 	 if(student!=null)
	 	 {
	 		 mv.setViewName("studenthome");
	 	 }
	 	 else
	 	 {
	 		 mv.setViewName("studentloginfailed");
	 		 mv.addObject("message", "Invalid Credentials, Please Try Again...");
	 	 } 
	 	 return mv;
    }
	

//   
//	// Display the student profile
//    @GetMapping("/{id}/profile")
//    public String viewStudentProfile(@PathVariable("id") int studentId, Model model) {
//        // Fetch the student details
//        Student student = studentService.viewStudentById(studentId);
//
//        if (student == null) {
//            model.addAttribute("errorMessage", "Student not found.");
//            return "error"; // Return an error page if the student does not exist
//        }
//
//        // Add student details to the model
//        model.addAttribute("student", student);
//
//        // Dynamically add the student ID to the URL
//        String profileUrl = "/student/" + studentId + "/profile";
//        model.addAttribute("profileUrl", profileUrl);
//
//        
//
//        return "studentprofile"; // Return the JSP for the student profile
//    }
//
//    // Update the student's profile
//    @PostMapping("/update/{id}")
//    public String updateStudentProfile(@PathVariable("id") int studentId,
//                                        @RequestParam("name") String name,
//                                        @RequestParam("contact") String contact,
//                                        @RequestParam("address") String address,
//                                        Model model) {
//        // Fetch the existing student details
//        Student student = studentService.viewStudentById(studentId);
//
//        if (student == null) {
//            model.addAttribute("errorMessage", "Student not found.");
//            return "error";
//        }
//
//        // Update student details
//        student.setStudentName(name);
//        student.setPhone(contact);
//        student.setDepartment(address); // Assuming "address" corresponds to the department field
//
//        // Save the updated student details
//        studentService.updateStudentDetails(student);
//
//        // Add success message and updated student details to the model
//        model.addAttribute("successMessage", "Profile updated successfully!");
//        model.addAttribute("student", student);
//        model.addAttribute("studentId", studentId);
//
//        return "studentprofile"; // Redirect to the updated profile page
//    }
//	
	@GetMapping("/profile")
    public String viewStudentProfile(Model model) {
        // Simulate fetching logged-in student's ID
        int studentId = getLoggedInStudentId();  // Replace with actual logic

        if (studentId <= 0) {
            model.addAttribute("errorMessage", "Invalid student ID.");
            return "error"; // Show an error page if no valid ID is retrieved
        }

        // Fetch student details
        Student student = studentService.viewStudentById(studentId);

        if (student == null) {
            model.addAttribute("errorMessage", "Student not found.");
            return "error"; // Show an error page if the student does not exist
        }

        // Add student details to the model
        model.addAttribute("student", student);

        return "studentprofile"; // Render the student profile page
    }

    @PostMapping("/updateProfile")
    public String updateStudentProfile(@ModelAttribute Student student, 
                                       @RequestParam("image") MultipartFile image, 
                                       Model model) throws SerialException, SQLException {
        try {
            if (!image.isEmpty()) {
                // Convert the image to a Blob
                Blob imageBlob = new SerialBlob(image.getBytes());
                student.setImage(imageBlob);  // Set the Blob image to the student object
            }

            // Update the student's profile information in the database
            studentService.updateStudentDetails(student);

            // Add a success message to the model
            model.addAttribute("message", "Profile updated successfully.");
        } catch (IOException e) {
            // Add an error message to the model in case of failure
            model.addAttribute("errorMessage", "Failed to update profile: " + e.getMessage());
        }

        // Fetch updated student details and return to profile page
        model.addAttribute("student", studentService.viewStudentById(student.getStudentId()));
        return "studentprofile"; // Reload the profile page with updated details
    }

    // Simulate fetching the logged-in student's ID
    private int getLoggedInStudentId() {
        return 1234;  // Replace with your actual authentication logic
    }
    
    @GetMapping("/viewcourses")
    public String viewCourses(Model model) {
        List<Course> courses = courseservice.displayallcourses();  // Fetch the courses from the service
        model.addAttribute("courses", courses);  // Add courses to the model
        return "viewcourses_student";  // Return the view name without .jsp extension
    }
    @GetMapping("coursereferences")
	public ModelAndView coursereferences()
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("courseReferences");
	    return mv;
	}
    
    @GetMapping("/dashboard")
    public String getDashboard(Model model) {
        Map<String, Long> counts = studentService.getDashboardCounts();
        model.addAttribute("coursesCount", counts.get("courses"));
        return "studentdashboard";  
    }
    
    @GetMapping("logout")
    public ModelAndView logout()
    {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("studentlogin");
      return mv;
    }
    
    

}
