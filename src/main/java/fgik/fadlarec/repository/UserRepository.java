package fgik.fadlarec.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import fgik.fadlarec.model.User;

public interface UserRepository extends PagingAndSortingRepository<User, Integer> {
    User findByEmail(String email);
    
    User findById(int id);
}
