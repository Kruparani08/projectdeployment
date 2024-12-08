package com.klef.jfsd.springboot.service;

import java.util.Map;

import com.klef.jfsd.springboot.model.Admin;

public interface AdminService
{
	public Admin checkadminlogin(String unmae,String pwd);
	public Map<String, Long> getDashboardCounts();

}
