package gltknbtn.gltknbtnBlog.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.model.Category;

public interface ArticleRepository extends PagingAndSortingRepository<Article, Integer> {
    Page<Article> findByTitleLike(Pageable pageable, String title);
    
    Page<Article> findByCategory(Pageable pageable, Category category);
    
    Article findById(int id);
}