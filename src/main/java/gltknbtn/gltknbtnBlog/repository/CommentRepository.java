package gltknbtn.gltknbtnBlog.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.scheduling.annotation.Async;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.model.Comment;

public interface CommentRepository extends PagingAndSortingRepository<Comment, Integer> {
    Page<Comment> findByCommentDescLike(Pageable pageable, String name);
    
    @Async
    @Query("SELECT t FROM Comment t where t.article = ?1 AND t.enabled = ?2")
    Page<Comment> findCommentsByArticle(Pageable pageable, Article selectedArticle, String commentStatus);

	Page<Comment> findByEnabled(String enabled, Pageable pageable);
    
}