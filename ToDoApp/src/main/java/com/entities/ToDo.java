 package com.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ToDo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int toDoId;
	private String toDoTitle;
	private String toDoContent;
	private Date todoDate;
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.getToDoTitle()+" : "+this.getToDoContent();
	}
	public String getToDoTitle() {
		return toDoTitle; 
	}
	public void setToDoTitle(String toDoTitle) {
		this.toDoTitle = toDoTitle;
	}
	public String getToDoContent() {
		return toDoContent;
	}
	public void setToDoContent(String toDoContent) {
		this.toDoContent = toDoContent;
	}
	public Date getTodoDate() {
		return todoDate;
	}
	public void setTodoDate(Date todoDate) {
		this.todoDate = todoDate;
	}
	
	public ToDo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ToDo(String toDoTitle, String toDoContent, Date todoDate) {
		super();
		this.toDoTitle = toDoTitle;
		this.toDoContent = toDoContent;
		this.todoDate = todoDate;
	}
	
	
}
