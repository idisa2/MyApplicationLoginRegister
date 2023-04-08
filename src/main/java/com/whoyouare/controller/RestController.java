package com.whoyouare.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.whoyouare.model.User;
import com.whoyouare.services.UserService;

@org.springframework.web.bind.annotation.RestController
public class RestController {
	
	@Autowired
	private UserService userService;

	@GetMapping("/test")
	public String hello() {
		return "This is Home page";
	}
	
	@GetMapping("/saveuser")
	public String saveUser(@RequestParam String email, @RequestParam String name, @RequestParam String password) {
		User user = new User(email, name, password);
		userService.saveMyUser(user);
		return "User Saved";
	}
}
