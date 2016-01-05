package gltknbtn.gltknbtnBlog.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.model.Comment;

public interface CommentRepository extends PagingAndSortingRepository<Comment, Integer> {
    Page<Comment> findByCommentDescLike(Pageable pageable, String name);
    
    List<Comment> findCommentsByArticleId(int articleId);
    
}