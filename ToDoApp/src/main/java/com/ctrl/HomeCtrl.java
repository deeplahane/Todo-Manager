 package com.ctrl;

import java.util.Date;
import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.ToDodao;
import com.entities.ToDo;

@Controller
public class HomeCtrl {
	
	@Autowired
	ToDodao toDoDao;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("/home")
	public String home(Model m) {
		m.addAttribute("page", "home"); 
		List<ToDo> list= this.toDoDao.getAll();
		m.addAttribute("todos", list);
		return "home"; 	
	}
	 
	@RequestMapping("/add")
	public String addToDo(Model m) {
		ToDo t=new ToDo();
		m.addAttribute("todo", t);  
		m.addAttribute("page", "add");
		return "home"; 	
	}
	
	@RequestMapping(value="/saveToDo",method=RequestMethod.POST) 
	public String saveToDo(@ModelAttribute("todo") ToDo t, Model m) {
		System.out.println(t);
		t.setTodoDate(new Date());
		this.toDoDao.save(t);
		m.addAttribute("msg", "Task successfully added...");
		return "home"; 	
	}
}
