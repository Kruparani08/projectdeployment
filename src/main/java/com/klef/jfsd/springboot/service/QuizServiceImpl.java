package com.klef.jfsd.springboot.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Quiz;
@Service
public class QuizServiceImpl implements QuizService
{
	private List<Quiz> quizzes = new ArrayList<>();

    // Save quiz
    public void saveQuiz(Quiz quiz) {
        quizzes.add(quiz);
    }
//    public List<Quiz> getAllQuizzes() 
//    {
//        return quizzes;
//    }

}
