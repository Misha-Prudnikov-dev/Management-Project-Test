package com.example.dto;

import com.example.Role;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;

public class UserDTO {

    @NotEmpty(message = "Name should not be empty")
    @Size(min = 2,max = 40,message = "Name should be between 2 and 40")
    private String name;

    @NotEmpty(message = "surname should not be empty")
    @Size(min = 2,max = 40,message = "surname should be between 2 and 40")
    private String surname;

    @NotEmpty(message = "patronymic should not be empty")
    @Size(min = 2,max = 40,message = "patronymic should be between 2 and 40")
    private String patronymic;


    @NotEmpty(message = "Email should not be empty")
    @Email(message = "Email should be valid")
    private String email;

    @Min(value = 1,message = "not 0")
    private Long roleId;




    public UserDTO() {

    }

    public UserDTO(String name, String surname, String patronymic, String email, Long roleId) {
        this.name = name;
        this.surname = surname;
        this.patronymic = patronymic;
        this.email = email;
        this.roleId = roleId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(String patronymic) {
        this.patronymic = patronymic;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", patronymic='" + patronymic + '\'' +
                ", email='" + email + '\'' +
                ", roleId=" + roleId +
                '}';
    }
}
