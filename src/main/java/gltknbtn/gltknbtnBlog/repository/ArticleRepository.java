package gltknbtn.gltknbtnBlog.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import gltknbtn.gltknbtnBlog.model.Article;

public interface ArticleRepository extends PagingAndSortingRepository<Article, Integer> {
    Page<Article> findByTitleLike(Pageable pageable, String title);
    
    Article findById(int id);
}