package com.example;

import com.example.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService {

    private RoleRepository roleRepository;

    @Autowired
    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public List<Role> getAllRole(){
        return roleRepository.findAll();
    }
    public Role getRoleById(Long roleId){
        return roleRepository.findRoleById(roleId);
    }

}
