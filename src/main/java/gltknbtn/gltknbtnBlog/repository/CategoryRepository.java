package gltknbtn.gltknbtnBlog.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import gltknbtn.gltknbtnBlog.model.Category;

public interface CategoryRepository extends PagingAndSortingRepository<Category, Integer> {
	Category findByCategoryName(String categoryName);
    
	Category findById(int id);
	
}
