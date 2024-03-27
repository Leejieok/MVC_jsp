package kr.co.seoulit.common.servlet.mapper;

import java.io.FileReader;
import java.util.HashMap;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import kr.co.seoulit.common.servlet.context.ApplicationContext;
import kr.co.seoulit.common.servlet.mvc.Controller;

public class SimpleUrlHandlerMapping {
	private HashMap<String,String> map;
	private static SimpleUrlHandlerMapping instance;
	public static SimpleUrlHandlerMapping getInstance(ServletContext application) {
		// TODO Auto-generated method stub
		if(instance==null) instance=new SimpleUrlHandlerMapping(application);
		return instance;
	}
	private SimpleUrlHandlerMapping(ServletContext application){
		try {
		map=new HashMap<String,String>();
		String path=application.getInitParameter("urlmappingFile");
		String rPath=application.getRealPath(path);
		Properties properties=new Properties();
		properties.load(new FileReader(rPath));
		
		Set<String> set=properties.stringPropertyNames(); 
		for(String key: set){
			String value=properties.getProperty(key);
			map.put(key,value);
		}
		}catch(Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	public Controller getController(ApplicationContext applicationContext, HttpServletRequest request) {
		// TODO Auto-generated method stub
		String uri=request.getRequestURI(); //uri=프로젝트명/XXX.html
		String contextPath=request.getContextPath(); //contextPath=/프로젝트명
		int sIndex=contextPath.length(); 
		String key=uri.substring(sIndex); //key=/XXX.html
		
		String beanName=map.get(key); //key의 value값은 beanName이 됨
		return (Controller)applicationContext.getBean(beanName);
	}
}
