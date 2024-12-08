package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.LearningMaterials;
import com.klef.jfsd.springboot.repository.LearningMaterialsRepository;

@Service
public class LearningMaterialsServiceImpl implements LearningMaterialsService
{
	@Autowired
    private LearningMaterialsRepository learningMaterialsRepository;

    public void saveLearningMaterial(LearningMaterials learningMaterial) {
        learningMaterialsRepository.save(learningMaterial);
    }
}
