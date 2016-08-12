package gltknbtn.gltknbtnBlog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.model.Comment;
import gltknbtn.gltknbtnBlog.repository.CommentRepository;
import gltknbtn.gltknbtnBlog.vo.CommentListVO;

@Service
@Transactional
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Transactional(readOnly = true)
    public CommentListVO findAll(int page, int maxResults) {
        Page<Comment> result = executeQueryFindAll(page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAll(lastPage, maxResults);
        }

        return buildResult(result);
    }
    
    @Transactional(readOnly = true)
	public CommentListVO findAllCommentsByEnabled(String enabled, int page, int maxResults) {
    	Page<Comment> result = executeQueryFindAllCommentsByEnabled(enabled, page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAllCommentsByEnabled(enabled, lastPage, maxResults);
        }

        return buildResult(result);
	}

    public void save(Comment comment) {
        commentRepository.save(comment);
    }

    @Secured("ROLE_ADMIN")
    public void delete(int commentId) {
        commentRepository.delete(commentId);
    }

    @Transactional(readOnly = true)
    public CommentListVO findByCommentDescLike(int page, int maxResults, String commentDesc) {
        Page<Comment> result = executeQueryFindByCommentDesc(page, maxResults, commentDesc);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindByCommentDesc(lastPage, maxResults, commentDesc);
        }

        return buildResult(result);
    }

    private boolean shouldExecuteSameQueryInLastPage(int page, Page<Comment> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }

    @Transactional(readOnly = true)
    public CommentListVO findCommentsByArticle(int page, int maxResults, Article selectedArticle, String commentStatus) {

    	 Page<Comment> result = executeQueryFindCommentsByArticle(page, maxResults, selectedArticle, commentStatus);

         if(shouldExecuteSameQueryInLastPage(page, result)){
             int lastPage = result.getTotalPages() - 1;
             result = executeQueryFindCommentsByArticle(lastPage, maxResults, selectedArticle, commentStatus);
         }

         return buildResult(result);
    }

	private Page<Comment> executeQueryFindAll(int page, int maxResults) {
    	final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());
    	
    	return commentRepository.findAll(pageRequest);
    }
	
	private Page<Comment> executeQueryFindAllCommentsByEnabled(String enabled, int page, int maxResults) {
		final PageRequest pageRequest = new PageRequest(page, maxResults, sortByIdDesc());
		return commentRepository.findByEnabled(enabled, pageRequest);
	}
	
	public Comment findById(int commentId) {
		
		return commentRepository.findOne(commentId);
	}

    private Sort sortByNameASC() {
        return new Sort(Sort.Direction.ASC, "name");
    }
    
    private Sort sortByIdDesc() {
    	return new Sort(Sort.Direction.DESC, "id");
    }

    private CommentListVO buildResult(Page<Comment> result) {
        return new CommentListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }

    
    private Page<Comment> executeQueryFindCommentsByArticle(int page, int maxResults, Article selectedArticle, String commentStatus) {
    	  final PageRequest pageRequest = new PageRequest(page, maxResults, sortByIdDesc());

          return commentRepository.findCommentsByArticle(pageRequest, selectedArticle, commentStatus);
	}
    
    private Page<Comment> executeQueryFindByCommentDesc(int page, int maxResults, String name) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByNameASC());

        return commentRepository.findByCommentDescLike(pageRequest, "%" + name + "%");
    }

    private boolean isUserAfterOrOnLastPage(int page, Page<Comment> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<Comment> result) {
        return result.getTotalElements() > 0;
    }

}