package com.whoyouare.repository;

import org.springframework.data.repository.CrudRepository;

import com.whoyouare.model.User;

public interface UserRepository extends CrudRepository<User, Integer> {	
	
	public User findByEmailAndPassword(String email, String password);
}
