package com.example;

import com.example.dto.UserDTO;
import com.example.entity.User;
import jakarta.validation.Valid;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
    public ResponseEntity<List<User>> getAllUser(@RequestParam Integer offset){
        LOGGER.info("getAllUser method");
        Integer limit = Integer.valueOf(10);
        return new ResponseEntity<List<User>>(userService.getAllUser(offset, limit).getContent(), HttpStatus.OK) ;
    }

    @PostMapping("/users/add")
    public void addUser(@RequestBody @Valid UserDTO userDTO, BindingResult bindingResult) {

        if (bindingResult.hasErrors()){
            LOGGER.error("User not added");
            return;
        }
        userService.addUser(userDTO);
        LOGGER.info("User was added");
    }
}

