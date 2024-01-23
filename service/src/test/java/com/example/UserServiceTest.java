package com.example;

import com.example.dto.UserDTO;
import com.example.entity.Role;
import com.example.entity.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import java.util.Arrays;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

public class UserServiceTest {

    @Mock
    private UserRepository userRepository;
    @Mock
    private RoleService roleService;
    @Mock
    private ModelMapper modelMapper;
    @InjectMocks
    private UserService userService;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testGetAllUser() {
        Integer offset = 0;
        Integer limit = 10;
        Page<User> expectedUsers = new PageImpl<>(Arrays.asList(new User(), new User()));

        when(userRepository.findAllByOrderByEmail(any(Pageable.class))).thenReturn(expectedUsers);

        Page<User> result = userService.getAllUser(offset, limit);

        assertEquals(expectedUsers, result);
        verify(userRepository).findAllByOrderByEmail(any(Pageable.class));
    }
    @Test
    public void testAddUser() {
        UserDTO userDTO = new UserDTO();
        userDTO.setRoleId(1L);

        User user = new User();
        user.setId(0L);

        when(modelMapper.map(userDTO, User.class)).thenReturn(user);
        when(roleService.getRoleById(1L)).thenReturn(new Role());
        when(userRepository.save(user)).thenReturn(user);

        User result = userService.addUser(userDTO);

        assertEquals(user, result);
        assertEquals(0L, user.getId());
        verify(modelMapper).map(userDTO, User.class);
        verify(roleService).getRoleById(1L);
        verify(userRepository).save(user);
    }
 }
