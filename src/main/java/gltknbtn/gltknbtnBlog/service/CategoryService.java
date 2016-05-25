package gltknbtn.gltknbtnBlog.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gltknbtn.gltknbtnBlog.model.Category;
import gltknbtn.gltknbtnBlog.repository.CategoryRepository;
import gltknbtn.gltknbtnBlog.vo.CategoryListVO;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    public void save(Category category) {
    	categoryRepository.save(category);
    }
    
    @Secured("ROLE_ADMIN")
    public void delete(int categoryId) {
    	categoryRepository.delete(categoryId);
    }
    
    @Transactional(readOnly = true)
    public Category findById(int id) {
    	return categoryRepository.findById(id);
    }
    
    public Category findByCategoryName(String categoryName){
        return categoryRepository.findByCategoryName(categoryName);
    }
    
    @Transactional(readOnly = true)
    public  List<Category> findAll() {
    	
    	List<Category> allCategories = new ArrayList<Category>();
    	Iterable<Category> iter = categoryRepository.findAll();
    	for (Category category : iter) {
			allCategories.add(category);
		}
    	 
    	return allCategories;
    }
    
    @Transactional(readOnly = true)
    public CategoryListVO findAll(int page, int maxResults) {
        Page<Category> result = executeQueryFindAll(page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAll(lastPage, maxResults);
        }

        return buildResult(result);
    }
    
    private CategoryListVO buildResult(Page<Category> result) {
        return new CategoryListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }
    
    private Page<Category> executeQueryFindAll(int page, int maxResults) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByCategoryNameASC());

        return categoryRepository.findAll(pageRequest);
    }
    
    private Sort sortByCategoryNameASC() {
        return new Sort(Sort.Direction.ASC, "categoryName");
    }
    
    private boolean shouldExecuteSameQueryInLastPage(int page, Page<Category> result) {
        return isCategoryAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }
    
    private boolean isCategoryAfterOrOnLastPage(int page, Page<Category> result) {
        return page >= result.getTotalPages() - 1;
    }
    
    private boolean hasDataInDataBase(Page<Category> result) {
        return result.getTotalElements() > 0;
    }
}
