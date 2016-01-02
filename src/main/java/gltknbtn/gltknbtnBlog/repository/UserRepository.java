package gltknbtn.gltknbtnBlog.repository;

import org.springframework.data.repository.CrudRepository;

import gltknbtn.gltknbtnBlog.model.User;

public interface UserRepository extends CrudRepository<User, Integer> {
    User findByEmail(String email);
}
