package gltknbtn.gltknbtnBlog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gltknbtn.gltknbtnBlog.model.User;
import gltknbtn.gltknbtnBlog.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User findByEmail(String email){
        return userRepository.findByEmail(email);
    }
}
