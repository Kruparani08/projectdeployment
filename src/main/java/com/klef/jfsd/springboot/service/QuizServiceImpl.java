package com.klef.jfsd.springboot.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Quiz;
//import com.klef.jfsd.springboot.repository.QuizRepository;
@Service
public class QuizServiceImpl implements QuizService
{
	 //private final QuizRepository quizRepository;
	private List<Quiz> quizzes = new ArrayList<>();

    // Save quiz
    public void saveQuiz(Quiz quiz) {
        quizzes.add(quiz);
    }
//    public List<Quiz> getAllQuizzes() 
//    {
//        return quizzes;
//    }

//    @Autowired
//    public QuizServiceImpl(QuizRepository quizRepository) {
//        this.quizRepository = quizRepository;
//    }
//
//    public List<Quiz> getAllQuizzes() {
//        return quizRepository.findAll();  // Fetch all quizzes
//    }
//
//    public Quiz getQuizById(int quizId) {
//        return quizRepository.findById(quizId).orElse(null);  // Fetch a quiz by its ID
//    }
}
