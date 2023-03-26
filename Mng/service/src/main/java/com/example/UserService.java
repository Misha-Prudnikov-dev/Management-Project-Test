package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Service
public class UserService {

    private UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUser(){

        return userRepository.findAllByOrderByEmail();

    }
    public User getUserById(Long userId){

        return userRepository.findUserById(userId);

    }
    public User getUserByEmail(String email){

        return  userRepository.findUserByEmail(email);
    }
    public User addUser(User user){

        return  userRepository.save(user);
    }
}
