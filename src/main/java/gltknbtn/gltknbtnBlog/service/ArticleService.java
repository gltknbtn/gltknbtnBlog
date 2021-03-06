package gltknbtn.gltknbtnBlog.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.model.Category;
import gltknbtn.gltknbtnBlog.model.User;
import gltknbtn.gltknbtnBlog.repository.ArticleRepository;
import gltknbtn.gltknbtnBlog.repository.UserRepository;
import gltknbtn.gltknbtnBlog.vo.ArticleDTO;
import gltknbtn.gltknbtnBlog.vo.ArticleListVO;

@Service
@Transactional
public class ArticleService {

    @Autowired
    private ArticleRepository articleRepository;
    
    @Autowired
    private UserRepository userRepository;

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
    
    
    @Transactional(readOnly = true)
    public Article findByTitleurl(String titleurl) {
    	return articleRepository.findByTitleurl(titleurl);
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
    	List<Article> articleList = result.getContent();
    	List<ArticleDTO> articleDTOList = new ArrayList<ArticleDTO>();
    	for (int i = 0; i < articleList.size(); i++) {
    		Article article = articleList.get(i);
    		ArticleDTO articleDTO  = new ArticleDTO();
    		articleDTO.setCreatedDate(article.getCreatedDate());
    		articleDTO.setDescription(article.getDescription());
    		articleDTO.setId(article.getId());
    		articleDTO.setSummary(article.getSummary());
    		articleDTO.setTitle(article.getTitle());
    		articleDTO.setCategoryName(article.getCategory().getCategoryName());
    		articleDTO.setTitleurl(article.getTitleurl());
    		
    		User user = userRepository.findById(article.getUser().getId());
    		articleDTO.setUserName(user.getName());
    		articleDTO.setStatus(article.getStatus());
    		
			articleDTOList.add(articleDTO);
		}
    	
        return new ArticleListVO(result.getTotalPages(), result.getTotalElements(), articleDTOList);
    }

    private Page<Article> executeQueryFindByTitle(int page, int maxResults, String title) {
        final PageRequest pageRequest = new PageRequest(page, maxResults, sortByIdDESC());

        return articleRepository.findByTitleLike(pageRequest, "%" + title+ "%");
    }
    
    public ArticleListVO findByCategory(Category category, int page, int maxResults) {
    	
    	return findAllActiveArticlesByCategory(category, page, maxResults);
    } 
    

    private boolean isUserAfterOrOnLastPage(int page, Page<Article> result) {
        return page >= result.getTotalPages() - 1;
    }

    private boolean hasDataInDataBase(Page<Article> result) {
        return result.getTotalElements() > 0;
    }

	public ArticleListVO findAllActiveArticlesByCategory(Category category, int page, int maxResults) {
		Page<Article> result = executeQueryFindAllActiveArticlesByCategory(category, page, maxResults);

		if (shouldExecuteSameQueryInLastPage(page, result)) {
			int lastPage = result.getTotalPages() - 1;
			result = executeQueryFindAllActiveArticlesByCategory(category, lastPage, maxResults);
		}

		return buildResult(result);
	}
	
	private Page<Article> executeQueryFindAllActiveArticlesByCategory(Category category, int page, int maxResults) {
		final PageRequest pageRequest = new PageRequest(page, maxResults, sortByIdDESC());
		return articleRepository.findByCategory(pageRequest, category, "enable");
	}
}