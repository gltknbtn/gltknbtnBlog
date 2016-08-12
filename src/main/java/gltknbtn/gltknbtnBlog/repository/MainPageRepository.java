package gltknbtn.gltknbtnBlog.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.model.Comment;

public interface MainPageRepository extends PagingAndSortingRepository<Article, Integer> {
    Page<Article> findByTitleLike(Pageable pageable, String title);
    Page<Article> findByStatus(Pageable pageable, String status);
    
}