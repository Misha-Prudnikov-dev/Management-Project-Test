# Management-Project-Test

## Tools
* Java 17
* Spring Boot
* Hibernate
* Log4j2
* MySQL
# Application endpoints
##### Request root `http://localhost:8080/api`
* View all users `/users` (Method Get)
* View find user by id `/users/{userId}` (Method Get)
* View find user by email `/users/email/{userEmail}`(Method Get)
* View all roles `/users/roles` (Method Get)
* Add user `/users/add`, example : 
`{
    "name": "Bee",
    "surname": "Dune",
    "patronymic": "cratty",
    "email": "bee@mail.com",
    "roleId": 1
}` (Method Post)
