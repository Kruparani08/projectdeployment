package com.klef.jfsd.springboot.controller;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
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

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Instructor;
import com.klef.jfsd.springboot.model.Question;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.CourseService;
import com.klef.jfsd.springboot.service.InstructorService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(path = "admin")
public class AdminController
{
	@Autowired
    private AdminService adminService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private InstructorService instructorService;
	
	@Autowired
	private CourseService courseservice;
	
	@GetMapping("/")
	public ModelAndView index()
	{
		ModelAndView mv = new ModelAndView();
	    mv.setViewName("index");
	    return mv;
	}
  
    @GetMapping("login")
    public ModelAndView adminlogin()
    {
       ModelAndView mv = new ModelAndView();
       mv.setViewName("adminlogin");
       return mv;
    }
    
    @PostMapping("checkadminlogin")
    public ModelAndView checkadminlogin(HttpServletRequest request)
    {
	 	 ModelAndView mv = new ModelAndView();
	 	 
	 	 String auname = request.getParameter("auname");
	 	 String apwd = request.getParameter("apwd");
	 	 
	 	 Admin admin = adminService.checkadminlogin(auname, apwd);
	 	 
	 	 if(admin!=null)
	 	 {
	 		 mv.setViewName("adminhome");
	 	 }
	 	 else
	 	 {
	 		 mv.setViewName("adminloginfailed");
	 		 mv.addObject("message", "Invalid Credentials, Please Try Again...");
	 	 } 
	 	 return mv;
    }
    
    @GetMapping("adminhome")
    public ModelAndView adminhome()
    {
       ModelAndView mv = new ModelAndView();
       mv.setViewName("adminhome");
       return mv;
    }
    
    @GetMapping("studenthome")
    public ModelAndView adminstudenthome()
    {
       ModelAndView mv = new ModelAndView();
       mv.setViewName("admin_studenthome");
       return mv;
    }
    
    @GetMapping("instructorhome")
    public ModelAndView instructorhome()
    {
       ModelAndView mv = new ModelAndView();
       mv.setViewName("admin_instructorhome");
       return mv;
    }
    
    @GetMapping("addstudent")
    public ModelAndView addstudent()
    {
       ModelAndView mv = new ModelAndView();
       mv.setViewName("addstudent");
       return mv;
    }
    
    @PostMapping("insertstudent")
    public ModelAndView insertstudent(HttpServletRequest request, @RequestParam("studentimage") MultipartFile file) throws Exception {
        String msg = null;
        ModelAndView mv = new ModelAndView();

        try {
            // Getting input values from the request
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String dob = request.getParameter("dob");
            String dept = request.getParameter("dept");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");

            // Set default password as DOB
            String password = dob;  // Using dob as the default password

            // Set default username as student ID
            int username = Integer.valueOf(id);  // Using student ID as the username

            // Process image file
            byte[] bytes = file.getBytes();
            Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

            // Create a Student object
            Student s = new Student();
            s.setStudentId(id);
            s.setStudentName(name);
            s.setDateOfBirth(dob);
            s.setDepartment(dept);
            s.setEmail(email);
            s.setGender(gender);
            s.setImage(blob);
            s.setPhone(phone);
            s.setPassword(password);  // Set default password
            s.setUsername(username);  // Set default username

            // Add student to the database
            msg = studentService.AddStudent(s);
            System.out.println(msg);
            mv.setViewName("addstudent");
		    mv.addObject("message", "Student inserted successfully!");
        } catch (Exception e) {
            msg = e.getMessage();
            System.out.println(msg.toString());
            mv.setViewName("studenterror");
            mv.addObject("message", msg);
        }
        return mv;
    }
    
    @GetMapping("/viewallstudents")
    public ModelAndView viewAllStudents()
    {
        ModelAndView mv = new ModelAndView();
        List<Student> students = studentService.getAllStudents();
        mv.setViewName("viewallstudents");  
        mv.addObject("students", students); 
        return mv;
    }
    
    @GetMapping("displaystudentimage")
    public ResponseEntity<byte[]> displayStudentImage(@RequestParam int id) throws Exception {
        // Retrieve the student by ID from the service
        Student student = studentService.viewStudentById(id);
        
        // Retrieve the image data from the student's Blob field
        byte[] imageBytes = null;
        if (student.getImage() != null) {
            imageBytes = student.getImage().getBytes(1, (int) student.getImage().length());
        }

        // Return the image bytes as a ResponseEntity with proper content type
        return ResponseEntity.ok()
                             .contentType(MediaType.IMAGE_JPEG)
                             .body(imageBytes);
    }

    @GetMapping("/addinstructor")
    public ModelAndView addinstructor()
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("addinstructor");   
        return mv;
    }
    
    @PostMapping("/insertinstructor")
    public ModelAndView insertInstructor(HttpServletRequest request)
    {
        String msg = null;
        ModelAndView mv = new ModelAndView();

        try {
            
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String joiningDate = request.getParameter("joiningDate");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String department = request.getParameter("department");
            String designation = request.getParameter("designation");
            double salary = Double.parseDouble(request.getParameter("salary"));
            String address = request.getParameter("address");

            // Set default password as instructor ID
            String password = String.valueOf(id);

            // Create an Instructor object
            Instructor instructor = new Instructor();
            instructor.setId(id);
            instructor.setName(name);
            instructor.setGender(gender);
            instructor.setJoiningDate(joiningDate);
            instructor.setEmail(email);
            instructor.setContact(contact);
            instructor.setDepartment(department);
            instructor.setDesignation(designation);
            instructor.setSalary(salary);
            instructor.setAddress(address);
            instructor.setPassword(password);
            

            // Save the instructor to the database
            msg = instructorService.addInstructor(instructor);
            System.out.println(msg);
            mv.setViewName("addinstructor");
            mv.addObject("message", "Instructor added successfully!");
        }
        catch (Exception e)
        {
            // Handle errors and set error response
            msg = e.getMessage();
            System.out.println(msg);
            mv.setViewName("instructorerror");
            mv.addObject("message", msg);
        }
        return mv;
    }
    
    @GetMapping("/viewallinstructors")
    public ModelAndView viewallinstructors()
    {
        ModelAndView mv = new ModelAndView();
        List<Instructor> instructors = instructorService.getAllInstructors();
        mv.setViewName("viewallinstructors");  
        mv.addObject("instructors", instructors); 
        return mv;
    }
    
    @GetMapping("coursehome")
    public String coursehome()
    {
    	return "coursehome";
    }
    
    @GetMapping("/addcourses")
    public String courseform()
    {
        return "addcourses"; 
    }

    @PostMapping("/addcourse")
    public ModelAndView addCourse(Course c) {
        ModelAndView mv = new ModelAndView("addcourses");
        try {
            String message = courseservice.addCourse(c);
            mv.addObject("message", message);
            mv.addObject("status", "success");
        } catch (Exception e) {
            e.printStackTrace(); // Print stack trace to help debug
            mv.addObject("message", "Course addition failed: " + e.getMessage());
            mv.addObject("status", "failure");
        }
        return mv;
    }

    @GetMapping("viewallcourses")
    public ModelAndView displayallcourses()
    {
      ModelAndView mv = new ModelAndView();
      List<Course> courselist = courseservice.displayallcourses();
      mv.setViewName("viewallcourses");
      mv.addObject("courselist",courselist);
      return mv;
    }
   
    @GetMapping("/assigncourses") 
    public ModelAndView assignCourseForm() { 
    	ModelAndView mv = new ModelAndView("assigncourses");
    	List<Course> courses = courseservice.displayallcourses(); 
    	List<Instructor> instructors = instructorService.getAllInstructors(); 
    	mv.addObject("courses", courses); 
    	mv.addObject("instructors", instructors);
    	return mv; 
    } 
    @PostMapping("/assigncourse")
    public String assignCourse(@RequestParam String courseCode, @RequestParam int instructorId, 
                               @RequestParam(required = false) Boolean confirmUpdate, Model model) {
        Course course = courseservice.getCourseByCode(courseCode);
        Instructor instructor = instructorService.getInstructorById(instructorId);

        // Check if the course is already assigned
        if (course.getInstructor() != null) {
            if (course.getInstructor().getId() == instructorId) {
                // If the same instructor is assigned, display a specific message
                model.addAttribute("message", "This course is already mapped to the same instructor.");
                model.addAttribute("status", "failure");
                return "assigncourses"; // Stay on the same page with the message
            } else if (confirmUpdate == null || !confirmUpdate) {
                // If a different instructor is assigned and no confirmation is provided, prompt the user
                model.addAttribute("message", "This course is already assigned to another instructor. Do you want to reassign?");
                model.addAttribute("status", "confirmation");
                model.addAttribute("courseCode", courseCode);
                model.addAttribute("instructorId", instructorId);
                return "assigncourses";
            }
        }

        // If confirmation is provided or no instructor is assigned, proceed with the assignment
        course.setInstructor(instructor);
        courseservice.addCourse(course);

        // Redirect to the viewallcourses page after successful reassignment
        return "redirect:/admin/viewallcourses";
    }


    @GetMapping("/editInstructor/{id}")
    public ModelAndView editInstructor(@PathVariable int id) {
        ModelAndView modelAndView = new ModelAndView("editInstructor");
        Instructor instructor = instructorService.getInstructorById(id);
        modelAndView.addObject("instructor", instructor);
        return modelAndView;
    }

    @PostMapping("/updateInstructor")
    public String updateInstructor(@ModelAttribute Instructor instructor) {
        instructorService.updateInstructorDetails(instructor);
        return "redirect:/admin/updateinstructor"; // Redirect to the main page after updating
    }
    
    @GetMapping("/updateinstructor")
    public ModelAndView displayInstructors() {
        ModelAndView modelAndView = new ModelAndView("updateinstructor");
        List<Instructor> instructors = instructorService.getAllInstructors();
        modelAndView.addObject("instructors", instructors);
        return modelAndView;
    }
    
    @GetMapping("/deleteinstructor")
    public ModelAndView displayDelete() {
        ModelAndView modelAndView = new ModelAndView("deleteinstructor");
        List<Instructor> instructors = instructorService.getAllInstructors();
        modelAndView.addObject("instructors", instructors);
        return modelAndView;
    }

    @GetMapping("/deleteInstructor/{id}")
    public String deleteInstructor(@PathVariable int id) {
        instructorService.deleteInstructorById(id);
        return "redirect:/admin/deleteinstructor";
    }

    @GetMapping("/editStudent/{studentId}")
    public ModelAndView editStudent(@PathVariable int studentId) {
        ModelAndView modelAndView = new ModelAndView("editstudent");
        Student student = studentService.viewStudentById(studentId); // Fetch student by ID
        modelAndView.addObject("student", student);
        return modelAndView;
    }

    @PostMapping("/updateStudent")
    public String updateStudent(@ModelAttribute Student student) {
        studentService.updateStudentDetails(student); // Update student details
        return "redirect:/admin/updatestudent"; // Redirect to the main student list page
    }

    @GetMapping("/updatestudent")
    public ModelAndView displayStudents() {
        ModelAndView modelAndView = new ModelAndView("updatestudent");
        List<Student> students = studentService.getAllStudents(); // Fetch all students
        modelAndView.addObject("students", students);
        return modelAndView;
    }
    
    @GetMapping("/deletestudent")
    public ModelAndView displayDeleteStudent() {
        ModelAndView modelAndView = new ModelAndView("deletestudent");
        List<Student> students = studentService.getAllStudents();
        modelAndView.addObject("students", students);
        return modelAndView;
    }

    @GetMapping("/deleteStudent/{id}")
    public String deleteStudent(@PathVariable int id) {
        studentService.deleteStudentById(id);
        return "redirect:/admin/deletestudent";
    }
    
    @GetMapping("/editCourse/{courseCode}")
    public ModelAndView editCourse(@PathVariable String courseCode) {
        ModelAndView modelAndView = new ModelAndView("editCourse");
        Course course = courseservice.getCourseByCode(courseCode);
        modelAndView.addObject("course", course);
        return modelAndView;
    }

    @PostMapping("/updateCourse")
    public String updateCourse(@ModelAttribute Course course) {
        courseservice.updateCourseDetails(course);
        return "redirect:/admin/updatecourse";
    }

    @GetMapping("/updatecourse")
    public ModelAndView displayCourses() {
        ModelAndView modelAndView = new ModelAndView("updatecourse");
        List<Course> courses = courseservice.displayallcourses();
        modelAndView.addObject("courses", courses);
        return modelAndView;
    }
    
    @GetMapping("/deletecourse")
    public ModelAndView displayDeleteCourse() {
        ModelAndView modelAndView = new ModelAndView("deletecourse");
        List<Course> courses = courseservice.displayallcourses();
        modelAndView.addObject("courses", courses);
        return modelAndView;
    }

    @GetMapping("/deleteCourse/{courseCode}")
    public String deleteCourse(@PathVariable String courseCode) {
        courseservice.deleteCourseByCode(courseCode);
        return "redirect:/admin/deletecourse";
    }
    @GetMapping("coursemappinghome")
    public String coursemappinghome()
    {
    	return "coursemappingpage";
    }
    
    @GetMapping("/dashboard")
    public String getDashboard(Model model) {
        Map<String, Long> counts = adminService.getDashboardCounts();
        model.addAttribute("studentsCount", counts.get("students"));
        model.addAttribute("instructorsCount", counts.get("instructors"));
        model.addAttribute("coursesCount", counts.get("courses"));
        return "admindashboard";  
    }
   
    
    @GetMapping("logout")
    public ModelAndView logout()
    {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("adminlogin");
      return mv;
    }
    @GetMapping("feedback")
    public ModelAndView feedback()
    {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("feedback");
      return mv;
    }
    private List<Question> questions = new ArrayList<>();
    // Handle GET request to load the feedback page and display all questions
   

    @PostMapping("/addFeedbackQuestion")
    public String addFeedbackQuestion(@RequestParam("questionText") String questionText,
                                       @RequestParam("questionType") String questionType,
                                       @RequestParam("options") String options,
                                       Model model) {
        System.out.println("Question Text: " + questionText);
        System.out.println("Question Type: " + questionType);
        System.out.println("Options: " + options);

        // Validate input
        if (questionText != null && questionType != null) {
            Question newQuestion = new Question(0, options, options, options);
            newQuestion.setId(questions.size() + 1);
            newQuestion.setText(questionText);
            newQuestion.setType(questionType);
            newQuestion.setOptions(options);

            questions.add(newQuestion);
        }

        model.addAttribute("questions", questions);
        return "feedback";  // Ensure this view corresponds to your JSP
    }
    @PostMapping("/deleteFeedbackQuestion")
    public String deleteFeedbackQuestion(@RequestParam("id") int id, Model model) {
        System.out.println("Deleting question with ID: " + id);
        questions.removeIf(question -> question.getId() == id);

        model.addAttribute("questions", questions);
        return "feedback";
    }
    
}
