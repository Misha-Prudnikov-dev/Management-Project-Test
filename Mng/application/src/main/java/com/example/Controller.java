package com.example;

import com.example.dto.UserDTO;
import jakarta.validation.Valid;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class Controller {

    private UserService userService;
    private RoleService roleService;

    private static final Logger LOGGER = LogManager.getLogger(Controller.class);

    @Autowired
    public Controller(UserService userService,RoleService roleService) {

        this.userService = userService;
        this.roleService = roleService;
    }

    @GetMapping("/users")
    public List<User> getAllUser(){

        LOGGER.info("getAllUser method");

        return  userService.getAllUser();

    }

    @GetMapping("/users/roles")
    public List<Role> getAllRole(){

        LOGGER.info("getAllRole method");

        return  roleService.getAllRole();

    }


    @GetMapping("/users/{userId}")
    public User getUserById(@PathVariable Long userId){

        LOGGER.info("getUserById method");

        return  userService.getUserById(userId);
    }
    @GetMapping("/users/email/{userEmail}")
    public User getUserByEmail(@PathVariable String userEmail){

        LOGGER.info("getUserByEmail method");


        return  userService.getUserByEmail(userEmail);
    }

    @PostMapping("/users/add")
    public void addUser(@RequestBody @Valid UserDTO userDTO, BindingResult bindingResult) {

        if (bindingResult.hasErrors()){

            LOGGER.error("User not added");

            return;
        }

        User user = new User();
        user.setName(userDTO.getName());
        user.setSurname(userDTO.getSurname());
        user.setPatronymic(userDTO.getPatronymic());
        user.setEmail(userDTO.getEmail());
        user.setRole(roleService.getRoleById(userDTO.getRoleId()));

        userService.addUser(user);

        LOGGER.info("User was added");

    }

}

