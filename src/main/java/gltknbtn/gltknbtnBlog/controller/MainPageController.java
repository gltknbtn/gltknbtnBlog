package gltknbtn.gltknbtnBlog.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.model.Category;
import gltknbtn.gltknbtnBlog.model.User;
import gltknbtn.gltknbtnBlog.service.ArticleService;
import gltknbtn.gltknbtnBlog.service.CategoryService;
import gltknbtn.gltknbtnBlog.service.MainPageService;
import gltknbtn.gltknbtnBlog.vo.ArticleListVO;
import gltknbtn.gltknbtnBlog.vo.CategoryDTO;



@Controller
@RequestMapping(value = "/mainpage")
public class MainPageController {
	
    @Autowired
    private MainPageService mainPageService;
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private ArticleService articleService;

	@Autowired
    private MessageSource messageSource;
	
	@Value("5")
    private int maxResults;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("mainpageclean");
    }
    
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> listAllActiveArticles(@RequestParam int page, Locale locale) {
        return createListAllActiveArticlesResponse(page, locale);
    }
    
    @RequestMapping(value = "/categories", method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<?> getAllCategories(Locale locale) {
    	
		List<Category> categoryList = categoryService.findAll();
		List<CategoryDTO> categoryDtoList = new ArrayList<CategoryDTO>();
		
		for (int i = 0; i < categoryList.size(); i++) {
			Category category = categoryList.get(i);
			Page<Article> articleBundleByCategory = articleService.findByCategory(category);
			CategoryDTO categoryDTO = new CategoryDTO(category.getCategoryName(), articleBundleByCategory.getTotalElements());
			categoryDtoList.add(categoryDTO);
		}
		return new ResponseEntity<List<CategoryDTO>>(categoryDtoList, HttpStatus.OK);
    	
    }
    
    private ResponseEntity<?> createListAllActiveArticlesResponse(int page, Locale locale) {
        return createListAllActiveArticlesResponse(page, locale, null);
    }
    
    private ArticleListVO listAllActiveArticles(int page) {
        return mainPageService.findAllActiveArticles(page, maxResults);
    }

    private ResponseEntity<?> createListAllActiveArticlesResponse(int page, Locale locale, String messageKey) {
        ArticleListVO articleListVO = listAllActiveArticles(page);

        addActionMessageToVO(articleListVO, locale, messageKey, null);

        return returnListToUser(articleListVO);
    }
    
    private ArticleListVO addActionMessageToVO(ArticleListVO articleListVO, Locale locale, String actionMessageKey, Object[] args) {
        if (StringUtils.isEmpty(actionMessageKey)) {
            return articleListVO;
        }

        articleListVO.setActionMessage(messageSource.getMessage(actionMessageKey, args, null, locale));

        return articleListVO;
    }
    
    private ResponseEntity<ArticleListVO> returnListToUser(ArticleListVO articleList) {
        return new ResponseEntity<ArticleListVO>(articleList, HttpStatus.OK);
    }
    
    
}
