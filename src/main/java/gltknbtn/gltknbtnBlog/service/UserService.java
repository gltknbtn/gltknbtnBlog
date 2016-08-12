package gltknbtn.gltknbtnBlog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.model.User;
import gltknbtn.gltknbtnBlog.repository.UserRepository;
import gltknbtn.gltknbtnBlog.vo.UserListVO;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public void save(User user) {
    	userRepository.save(user);
    }
    
    @Secured("ROLE_ADMIN")
    public void delete(int userId) {
    	userRepository.delete(userId);
    }
    
    @Transactional(readOnly = true)
    public User findById(int id) {
    	return userRepository.findById(id);
    }
    
    public User findByEmail(String email){
        return userRepository.findByEmail(email);
    }
    
    @Transactional(readOnly = true)
    public UserListVO findAll(int page, int maxResults) {
        Page<User> result = executeQueryFindAll(page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAll(lastPage, maxResults);
        }

        return buildResult(result);
    }
    
    private UserListVO buildResult(Page<User> result) {
        return new UserListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }
    
    private Page<User> executeQueryFindAll(int page, int maxResults) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return userRepository.findAll(pageRequest);
    }
    
    private Sort sortByNameASC() {
        return new Sort(Sort.Direction.ASC, "name");
    }
    
    private boolean shouldExecuteSameQueryInLastPage(int page, Page<User> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }
    
    private boolean isUserAfterOrOnLastPage(int page, Page<User> result) {
        return page >= result.getTotalPages() - 1;
    }
    
    private boolean hasDataInDataBase(Page<User> result) {
        return result.getTotalElements() > 0;
    }
}
