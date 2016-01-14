package gltknbtn.gltknbtnBlog.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.service.ArticleService;
import gltknbtn.gltknbtnBlog.vo.ArticleListVO;

@Controller
@RequestMapping(value = "/protected/articles")
public class ArticlesController {

    private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

    @Autowired
    private ArticleService articleService;

    @Autowired
    private MessageSource messageSource;

    @Value("5")
    private int maxResults;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("articleList");
    }
    
    @RequestMapping(value = "/articlecreate", method = RequestMethod.GET)
    public ModelAndView articleCreate() {
    	return new ModelAndView("articlecreate");
    }

    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
        return createListAllResponse(page, locale);
    }

    @RequestMapping(method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<?> create(@ModelAttribute("article") Article article,
                                    @RequestParam(required = false) String searchFor,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
    	String createdDate = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new Date());
    	article.setCreatedDate(createdDate);
    	
        articleService.save(article);

        if (isSearchActivated(searchFor)) {
            return search(searchFor, page, locale, "message.create.success");
        }

        return createListAllResponse(page, locale, "message.create.success");
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, produces = "application/json")
    public ResponseEntity<?> update(@PathVariable("id") int articleId,
                                    @RequestBody Article article,
                                    @RequestParam(required = false) String searchFor,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
        if (articleId != article.getId()) {
            return new ResponseEntity<String>("Bad Request", HttpStatus.BAD_REQUEST);
        }

        articleService.save(article);

        if (isSearchActivated(searchFor)) {
            return search(searchFor, page, locale, "message.update.success");
        }

        return createListAllResponse(page, locale, "message.update.success");
    }
    
    
    @RequestMapping(value = "/articleedit/{id}", method = RequestMethod.GET)
    public ModelAndView fetchArticleById(@PathVariable("id") int articleId, Model model,
                                    Locale locale) {
    	Article selectedArticle = articleService.findById(articleId);
    	
    	model.addAttribute("selectedArticle", selectedArticle);
    	
        return new ModelAndView("articleedit");

    }
    
    

    @RequestMapping(value = "/{articleId}", method = RequestMethod.DELETE, produces = "application/json")
    public ResponseEntity<?> delete(@PathVariable("articleId") int articleId,
                                    @RequestParam(required = false) String searchFor,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {


        try {
            articleService.delete(articleId);
        } catch (AccessDeniedException e) {
            return new ResponseEntity<Object>(HttpStatus.FORBIDDEN);
        }

        if (isSearchActivated(searchFor)) {
            return search(searchFor, page, locale, "message.delete.success");
        }

        return createListAllResponse(page, locale, "message.delete.success");
    }

    @RequestMapping(value = "/{title}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> search(@PathVariable("title") String title,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
        return search(title, page, locale, null);
    }

    private ResponseEntity<?> search(String title, int page, Locale locale, String actionMessageKey) {
        ArticleListVO articleListVO = articleService.findByTitleLike(page, maxResults, title);

        if (!StringUtils.isEmpty(actionMessageKey)) {
            addActionMessageToVO(articleListVO, locale, actionMessageKey, null);
        }

        Object[] args = {title};

        addSearchMessageToVO(articleListVO, locale, "message.search.for.active", args);

        return new ResponseEntity<ArticleListVO>(articleListVO, HttpStatus.OK);
    }

    private ArticleListVO listAll(int page) {
        return articleService.findAll(page, maxResults);
    }

    private ResponseEntity<ArticleListVO> returnListToUser(ArticleListVO articleList) {
        return new ResponseEntity<ArticleListVO>(articleList, HttpStatus.OK);
    }

    private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
        return createListAllResponse(page, locale, null);
    }

    private ResponseEntity<?> createListAllResponse(int page, Locale locale, String messageKey) {
        ArticleListVO articleListVO = listAll(page);

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

    private ArticleListVO addSearchMessageToVO(ArticleListVO articleListVO, Locale locale, String actionMessageKey, Object[] args) {
        if (StringUtils.isEmpty(actionMessageKey)) {
            return articleListVO;
        }

        articleListVO.setSearchMessage(messageSource.getMessage(actionMessageKey, args, null, locale));

        return articleListVO;
    }

    private boolean isSearchActivated(String searchFor) {
        return !StringUtils.isEmpty(searchFor);
    }
}