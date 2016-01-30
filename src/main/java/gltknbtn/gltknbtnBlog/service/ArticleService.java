package gltknbtn.gltknbtnBlog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.repository.ArticleRepository;
import gltknbtn.gltknbtnBlog.vo.ArticleListVO;

@Service
@Transactional
public class ArticleService {

    @Autowired
    private ArticleRepository articleRepository;

    @Transactional(readOnly = true)
    public ArticleListVO findAll(int page, int maxResults) {
        Page<Article> result = executeQueryFindAll(page, maxResults);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindAll(lastPage, maxResults);
        }

        return buildResult(result);
    }

    public void save(Article article) {
    	articleRepository.save(article);
    }

    @Secured("ROLE_ADMIN")
    public void delete(int articleId) {
    	articleRepository.delete(articleId);
    }

    @Transactional(readOnly = true)
    public ArticleListVO findByTitleLike(int page, int maxResults, String title) {
        Page<Article> result = executeQueryFindByTitle(page, maxResults, title);

        if(shouldExecuteSameQueryInLastPage(page, result)){
            int lastPage = result.getTotalPages() - 1;
            result = executeQueryFindByTitle(lastPage, maxResults, title);
        }

        return buildResult(result);
    }
    
    @Transactional(readOnly = true)
    public Article findById(int id) {
    	return articleRepository.findById(id);
    }

    private boolean shouldExecuteSameQueryInLastPage(int page, Page<Article> result) {
        return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
    }

    private Page<Article> executeQueryFindAll(int page, int maxResults) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByIdDESC());

        return articleRepository.findAll(pageRequest);
    }

    private Sort sortByIdDESC() {
        return new Sort(Sort.Direction.DESC, "id");
    }
    
    private Sort sortByTitleASC() {
    	return new Sort(Sort.Direction.ASC, "title");
    }

    private ArticleListVO buildResult(Page<Article> result) {
        return new ArticleListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
    }

    private Page<Article> executeQueryFindByTitle(int page, int maxResults, String title) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByIdDESC());

        return articleRepository.findByTitleLike(pageRequest, "%" + title+ "%");
    }

    private boolean isUserAfterOrOnLastPage(int page, Page<Article> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<Article> result) {
        return result.getTotalElements() > 0;
    }
}