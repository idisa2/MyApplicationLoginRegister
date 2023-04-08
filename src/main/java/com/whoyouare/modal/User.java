package com.whoyouare.modal;

import javax.persistence.*;

@Entity
@Table(name="mytable")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String email;
	private String name;
	private String password;
	
	public User() {
		
	}
	
	
	public User(String email, String name, String password) {
		super();
		this.email = email;
		this.name = name;
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", email=" + email + ", name=" + name
				+ ", password=" + password + "]";
	}
	
	
	
	

}
