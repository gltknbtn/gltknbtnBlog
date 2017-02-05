package gltknbtn.gltknbtnBlog.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.scheduling.annotation.Async;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.model.Category;

public interface ArticleRepository extends PagingAndSortingRepository<Article, Integer> {
    Page<Article> findByTitleLike(Pageable pageable, String title);
    
    @Async
    @Query("SELECT t FROM Article t where t.category = ?1 AND t.status = ?2") 
    Page<Article> findByCategory(Pageable pageable, Category category, String status);
    
    Article findById(int id);
}