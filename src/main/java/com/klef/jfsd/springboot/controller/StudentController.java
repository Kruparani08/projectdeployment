package com.klef.jfsd.springboot.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Quiz;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.service.CourseService;
import com.klef.jfsd.springboot.service.QuizService;
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
	

	
	 @GetMapping("/profile")
	    public String viewStudentProfile(Model model) {
	        // Simulate fetching logged-in student ID (replace with actual logic)
	        int studentId = 1; 

	        Student student = studentService.viewStudentById(studentId);
	        if (student == null) {
	            model.addAttribute("errorMessage", "Student not found.");
	            return "error";
	        }

	        model.addAttribute("student", student);
	        return "studentprofile";
	    }
	 
	 @PostMapping("/update")
	 public String updateStudent(@ModelAttribute Student student,
	                             @RequestParam("image") MultipartFile image,
	                             RedirectAttributes redirectAttributes) {
	     try {
	         if (!image.isEmpty()) {
	             Blob imageBlob = new SerialBlob(image.getBytes());
	             student.setImage(imageBlob);
	         }
	         studentService.updateStudentDetails(student);
	         redirectAttributes.addFlashAttribute("message", "Profile updated successfully.");
	     } catch (Exception e) {
	         redirectAttributes.addFlashAttribute("errorMessage", "Failed to update profile: " + e.getMessage());
	     }
	     return "redirect:/student/home"; // Redirect to the home page after saving
	 }


	 @GetMapping("/update/{id}")
	 public String showUpdatePage(@PathVariable("id") int id, Model model) {
	     // Fetch the student by ID
	     Student student = studentService.viewStudentById(id);
	     if (student == null) {
	         model.addAttribute("errorMessage", "Student not found.");
	         return "error"; // Redirect to an error page if the student doesn't exist
	     }
	     
	     model.addAttribute("student", student);
	     return "updatestudent"; // JSP page to update student details
	 }

	 
	    
	    
//	 @PostMapping("/updateProfile")
//	 public String updateStudentProfile(@ModelAttribute Student student,
//	                                    @RequestParam("image") MultipartFile image,
//	                                    RedirectAttributes redirectAttributes) {
//	     try {
//	         if (!image.isEmpty()) {
//	             Blob imageBlob = new SerialBlob(image.getBytes());
//             student.setImage(imageBlob);
//	         }
//	         studentService.updateStudentDetails(student);
//	         redirectAttributes.addFlashAttribute("message", "Profile updated successfully.");
//	     } catch (Exception e) {
//	         redirectAttributes.addFlashAttribute("errorMessage", "Failed to update profile: " + e.getMessage());
//	     }
//	     return "redirect:/studenthome"; // Redirect to the student home page
//	 }

//	 @PostMapping("/studenthome")
//	 public String studentHome(Model model, @RequestParam(required = false) String message) {
//	     model.addAttribute("message", message);
//	     return "studenthome"; // JSP page name for the student home
//	 }

	
//    @GetMapping("/viewcourses")
//    public String viewCourses(Model model) {
//        List<Course> courses = courseservice.displayallcourses();  // Fetch the courses from the service
//        model.addAttribute("courses", courses);  // Add courses to the model
//        return "viewcourses_student";  // Return the view name without .jsp extension
//    }
    
    @GetMapping("/viewcourses")
    public String viewCourses(Model model) {
        List<Course> courses = courseservice.displayallcourses();
        model.addAttribute("courses", courses);
        return "viewcourses_student";  // JSP page for displaying courses
    }

    @GetMapping("/coursedetails")
    public String viewCourseDetails(@RequestParam("courseCode") String courseCode, Model model) {
        Course course = courseservice.getCourseByCode(courseCode);
        model.addAttribute("course", course);
        return "coursedetails";  // JSP page for course details
    }
    

    @GetMapping("/assigned-courses")
    public String viewAssignedCourses() {
        return "student/assignedcoursesstudent";
    }
//    @GetMapping("/student/quizzes")
//    public String showQuizzes(Model model) {
//        try {
//            List<Quiz> quizzes = QuizService.getAllQuizzes();
//            model.addAttribute("quizzes", quizzes);
//            return "quizzes";  // JSP page where quizzes are listed
//        } catch (Exception e) {
//            model.addAttribute("errorMessage", "An error occurred while fetching quizzes.");
//            return "error";  // Custom error page
//        }
//    }
//
//    
//    @RequestMapping("/student/quizzes")
//    public String showQuizzes1(Model model) {
//        List<Quiz> quizzes = QuizService.getAllQuizzes();
//        model.addAttribute("quizzes", quizzes);
//        return "quizzes";  // Make sure quizzes.jsp exists in /WEB-INF/jsp/
//    }
//        @GetMapping("/student/quiz/attempt/{quizId}")
//        public String attemptQuiz(@PathVariable("quizId") int quizId, Model model) {
//            try {
//                Quiz quiz = QuizService.getQuizById(quizId);  // Fetch the quiz by its ID
//                if (quiz == null) {
//                    model.addAttribute("errorMessage", "Quiz not found.");
//                    return "error";  // Custom error page
//                }
//                model.addAttribute("quiz", quiz);
//                return "attemptQuiz";  // JSP page where the quiz is displayed
//            } catch (Exception e) {
//                model.addAttribute("errorMessage", "An error occurred while attempting the quiz.");
//                return "error";  // Custom error page
//            }
//        }
//
//        @PostMapping("/student/quiz/submit/{quizId}")
//        public String submitQuiz(@PathVariable("quizId") int quizId, @RequestParam Map<String, String> answers, Model model) {
//            try {
//                Quiz quiz = QuizService.getQuizById(quizId);
//                if (quiz == null) {
//                    model.addAttribute("errorMessage", "Quiz not found.");
//                    return "error";  // Custom error page
//                }
//
//                int score = 0;
//
//                // Check answers (assuming you have logic to compare selected answers with correct answers)
//                for (int i = 0; i < quiz.getQuestions().length; i++) {
//                    String answer = answers.get("answer" + i);
//                    if (answer != null && answer.equals(quiz.getAnswers()[i])) {
//                        score++;
//                    }
//                }
//
//                model.addAttribute("score", score);
//                model.addAttribute("totalQuestions", quiz.getQuestions().length);
//                return "quizResult";  // JSP page to show the result
//            } catch (Exception e) {
//                model.addAttribute("errorMessage", "An error occurred while submitting the quiz.");
//                return "error";  // Custom error page
//            }
//        }

    

//    @GetMapping("/student/submitassignment")
//    public String showSubmitAssignmentPage(Model model) {
//        model.addAttribute("successMessage", "Assignment uploaded successfully!");
//        return "studentassignmentupload";  // The view name (JSP file)
//    }
//    
    

   


    @GetMapping("/student/submitassignment")
    public String showSubmitAssignmentPage(Model model) {
        return "student/submitassignment";  // This will map to /WEB-INF/views/student/submitassignment.jsp
    }
 // Handle Assignment Upload (POST method)
    @PostMapping("/student/submitassignment")
    public String handleAssignmentUpload(@RequestParam("studentassignmentupload") MultipartFile file, 
                                         RedirectAttributes redirectAttributes) {
        try {
            // Specify the location to save the uploaded file
            String uploadDirPath = "/path/to/upload/directory";  // Replace with actual path
            File uploadDir = new File(uploadDirPath);

            // Check if the directory exists, if not, create it
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();  // Create the directory if it doesn't exist
            }

            // Save the uploaded file to the directory
            File destinationFile = new File(uploadDir, file.getOriginalFilename());
            file.transferTo(destinationFile);

            // Add a success message to the redirectAttributes to be displayed after the redirect
            redirectAttributes.addFlashAttribute("successMessage", "Assignment uploaded successfully!");
            
            // Redirect to the same page to show the success message
            return "redirect:/student/submitassignment";  // This will trigger the GET method to show the page again

        } catch (IOException e) {
            // If there is an error, add an error message to the redirectAttributes
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to upload assignment. Please try again.");
            
            // Redirect to the same page to show the error message
            return "redirect:/student/submitassignment";  // This will trigger the GET method to show the page again
        }
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
