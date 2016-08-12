package fgik.fadlarec.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import fgik.fadlarec.model.Category;

public interface CategoryRepository extends PagingAndSortingRepository<Category, Integer> {
	Category findByCategoryName(String categoryName);
    
	Category findById(int id);
	
}
