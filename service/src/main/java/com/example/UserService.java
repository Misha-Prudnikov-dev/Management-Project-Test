package com.example;

import com.example.dto.UserDTO;
import com.example.entity.User;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private UserRepository userRepository;
    private RoleService roleService;
    private final ModelMapper modelMapper;

    @Autowired
    public UserService(UserRepository userRepository,RoleService roleService,ModelMapper modelMapper) {
        this.userRepository = userRepository;
        this.roleService = roleService;
        this.modelMapper = modelMapper;
    }

    public Page<User> getAllUser(Integer offset,Integer limit){
        Pageable nextPage = PageRequest.of(offset,limit);
        return userRepository.findAllByOrderByEmail(nextPage);
    }
    public User addUser(UserDTO userDTO){
        User user = convertToEntity(userDTO);
        user.setId(0L);
        return  userRepository.save(user);
    }
    private User convertToEntity(UserDTO userDTO) {
       User user = modelMapper.map(userDTO, User.class);
       user.setRole(roleService.getRoleById(userDTO.getRoleId()));
       return user;
    }
}
