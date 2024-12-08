package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Instructor;
import com.klef.jfsd.springboot.model.LearningMaterials;
import com.klef.jfsd.springboot.model.Quiz;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.AssignmentService;
import com.klef.jfsd.springboot.service.CourseService;
import com.klef.jfsd.springboot.service.InstructorService;
import com.klef.jfsd.springboot.service.LearningMaterialsService;
import com.klef.jfsd.springboot.service.QuizService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/instructor")
public class InstructorController 
{
	@Autowired
	private InstructorService instructorService;
	
	@Autowired
	private  CourseService courseService;
	
	@Autowired
    private LearningMaterialsService learningMaterialsService;
	
	@Autowired
    private StudentService studentService;
	
	@Autowired
    private AssignmentService assignmentService;
	
	@GetMapping("login")
	public ModelAndView instructorlogin()
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("instructorlogin");
	    return mv;
	}
	
	@PostMapping("checkinstructorlogin")
	public ModelAndView checkinstructorlogin(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    
	    int id = Integer.parseInt(request.getParameter("id")); // Parse the ID from the form
	    String pwd = request.getParameter("pwd"); // Get the password

	    Instructor instructor = instructorService.checkinstructorlogin(id, pwd);

	    if (instructor != null) {
	        mv.setViewName("instructorhome"); // Set view to instructorhome.jsp
	        mv.addObject("instructorId", id); // Add "instructorId" to the model
	    } else {
	        mv.setViewName("instructorloginfailed");
	        mv.addObject("message", "Invalid Credentials, Please Try Again...");
	    }
	    return mv;
	}

	
	@GetMapping("/{id}/courses")
	public ModelAndView viewAssignedCourses(@PathVariable int id) {
	    ModelAndView mv = new ModelAndView("viewassignedcourses");
	    mv.addObject("courses", courseService.getCoursesByInstructorId(id));
	    return mv;
	}
	@GetMapping("/{instructorId}/assignedcoursedetails")
	public String getAssignedCourseDetails(
	        @PathVariable("instructorId") String instructorId, 
	        @RequestParam("courseCode") String courseCode, 
	        Model model) {
	    
	    // Fetch course details using courseCode
	    Course course = courseService.getCourseByCode(courseCode);

	    if (course == null) {
	        // Handle case where course is not found
	        model.addAttribute("errorMessage", "Course not found for code: " + courseCode);
	        return "error"; // Redirect to an error page or provide fallback behavior
	    }

	    // Add instructor and course details to the model
	    model.addAttribute("instructorId", instructorId);
	    model.addAttribute("assignedCourse", course.getCourseName()); // Pass the course name directly as "assignedCourse"
	    
	    // Return the name of the JSP file
	    return "assignedcoursedetails"; 
	}
	 @GetMapping("learningmaterials")
	    public String showLearningMaterialsForm(Model model) {
	        model.addAttribute("learningMaterial", new LearningMaterials());
	        model.addAttribute("successMessage", null); // Initialize success message
	        return "learningmaterials";
	    }

	    @PostMapping("/addlearningmaterials")
	    public String addLearningMaterial(@ModelAttribute LearningMaterials learningMaterial, Model model) {
	        learningMaterialsService.saveLearningMaterial(learningMaterial);
	        model.addAttribute("successMessage", "Content added successfully");
	        model.addAttribute("learningMaterial", new LearningMaterials()); // Reset form
	        return "learningmaterials";
	    }

	    @PostMapping("/{instructorId}/upload")
	    public ResponseEntity<String> uploadAssignment(
	        @PathVariable("instructorId") int instructorId,
	        @RequestParam("file") MultipartFile file,
	        @RequestParam("title") String title,
	        @RequestParam("description") String description)
	    {
	        try {
	            assignmentService.saveAssignment(file, title, description);
	            return ResponseEntity.ok("Assignment uploaded successfully.");
	        } catch (IOException e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                    .body("Failed to upload assignment: " + e.getMessage());
	        }
	    }

	    @GetMapping("/{instructorId}/uploadAssignments")
	    public ModelAndView uploadAssignments(@PathVariable("instructorId") int instructorId) {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("uploadAssignments");
	        mv.addObject("instructorId", instructorId); // Add instructorId to the model
	        return mv;
	    }
	    
	    @GetMapping("/{id}/profile")
	    public String viewInstructorProfile(@PathVariable("id") int id, Model model) {
	        Instructor instructor = instructorService.getInstructorById(id);
	        if (instructor == null) {
	            model.addAttribute("errorMessage", "Instructor not found.");
	            return "error";
	        }
	        model.addAttribute("instructor", instructor);
	        model.addAttribute("instructorId", id);
	        return "instructorprofile";
	    }

	    // Handle the update profile form submission
	    @PostMapping("/update/{id}")
	    public String updateInstructorProfile(@PathVariable("id") int id,
	                                          @RequestParam("name") String name,
	                                          @RequestParam("contact") String contact,
	                                          @RequestParam("address") String address,
	                                          Model model) {
	        // Fetch the instructor from the database
	        Instructor instructor = instructorService.getInstructorById(id);
	        if (instructor == null) {
	            model.addAttribute("errorMessage", "Instructor not found.");
	            return "error";
	        }

	        // Update the instructor's profile with new data
	        instructor.setName(name);
	        instructor.setContact(contact);
	        instructor.setAddress(address);

	        // Save the updated instructor data to the database
	        instructorService.updateInstructorDetails(instructor);

	        // Add the updated instructor and a success message to the model
	        model.addAttribute("instructor", instructor);
	        model.addAttribute("instructorId", id);
	        model.addAttribute("successMessage", "Profile updated successfully!");

	        return "instructorprofile";  
	    }
	    @GetMapping("/dashboard")
	    public String getDashboard(Model model) 
	    {
	        Map<String, Long> counts = instructorService.getDashboardCounts();
	        model.addAttribute("studentsCount", counts.get("students"));
	        model.addAttribute("coursesCount", counts.get("courses"));
	        return "instructordashboard";  
	    }


	@GetMapping("logout")
    public ModelAndView logout()
    {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("instructorlogin");
      return mv;
    }
	
	@Autowired
    private QuizService quizService;

    // Show quiz upload form
	@GetMapping("/{instructorId}/quiz/uploads")
	public String showQuizUploadForm(@PathVariable("instructorId") int instructorId) {
	    return "uploadQuiz";
	}


    // Handle quiz submission
    @PostMapping("/quiz/upload")
    public String uploadQuiz(
            @RequestParam("quizName") String quizName,
            @RequestParam("questions") String[] questions,
            @RequestParam("options") String[][] options,
            @RequestParam("answers") int[] answers,
            Model model) {
        
        Quiz quiz = new Quiz(quizName, questions, options, answers);
        quizService.saveQuiz(quiz);

        model.addAttribute("message", "Quiz uploaded successfully!");
        return "uploadQuiz";
    }
    
    @GetMapping("/viewallstudents")
    public ModelAndView viewAllStudents()
    {
        ModelAndView mv = new ModelAndView();
        List<Student> students = studentService.getAllStudents();
        mv.setViewName("students_list");  
        mv.addObject("students", students); 
        return mv;
    }

    
}
