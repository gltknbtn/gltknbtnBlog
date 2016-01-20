package gltknbtn.gltknbtnBlog.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import gltknbtn.gltknbtnBlog.model.User;

public interface UserRepository extends PagingAndSortingRepository<User, Integer> {
    User findByEmail(String email);
    
    User findById(int id);
}
