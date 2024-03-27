package kr.co.seoulit.common.servlet.context;

import java.io.FileReader;
import java.util.HashMap;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;


public class ApplicationContext {
	private HashMap<String,Object> map;
	
	public ApplicationContext(ServletConfig config, ServletContext application){
		try {
		map=new HashMap<String,Object>();
		String path=config.getInitParameter("configFile"); 
		
		String rPath=application.getRealPath(path);
		Properties properties=new Properties();
		properties.load(new FileReader(rPath));
		
		
		Set<String> set=properties.stringPropertyNames();
		for(String key: set){
			String value=properties.getProperty(key);
			Object obj = Class.forName(value).getDeclaredConstructor().newInstance();
			map.put(key,obj);
		}
		}catch(Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	public Object getBean(String beanName) {
		// TODO Auto-generated method stub
		return map.get(beanName);
	}
}
