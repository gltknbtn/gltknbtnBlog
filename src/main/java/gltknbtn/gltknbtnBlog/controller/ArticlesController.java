package gltknbtn.gltknbtnBlog.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.model.Category;
import gltknbtn.gltknbtnBlog.model.User;
import gltknbtn.gltknbtnBlog.service.ArticleService;
import gltknbtn.gltknbtnBlog.service.CategoryService;
import gltknbtn.gltknbtnBlog.util.Util;
import gltknbtn.gltknbtnBlog.vo.ArticleDTO;
import gltknbtn.gltknbtnBlog.vo.ArticleListVO;

@Controller
@RequestMapping(value = "/protected/articles")
public class ArticlesController {

    private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

    @Autowired
    private ArticleService articleService;
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private MessageSource messageSource;

    @Value("5")
    private int maxResults;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
    	
        return new ModelAndView("articleList");
    }
    
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
    	return createListAllResponse(page, locale);
    }
    
    @RequestMapping(value = "/articlecreate", method = RequestMethod.GET)
    public ModelAndView articleCreate(HttpServletRequest request) {
    	
    	ModelAndView modelAndView = new ModelAndView("articlecreate");
    	HttpSession httpsession = request.getSession();
    	User user = (User)httpsession.getAttribute("user");
    	modelAndView.addObject("userName", user.getName());
    	
    	return modelAndView;
    }

    @ResponseBody
    @RequestMapping(method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<?> create(@ModelAttribute("article") ArticleDTO articleDTO,
                                    @RequestParam(required = false) String searchFor,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    HttpServletRequest request,
                                    Locale locale) {
    	
    	String createdDate = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new Date());
    	articleDTO.setCreatedDate(createdDate);
    	HttpSession httpsession = request.getSession();
    	User user = (User)httpsession.getAttribute("user");
    	
    	Category category = categoryService.findByCategoryName(articleDTO.getCategoryName());
    	
    	Article article = getArticleByArticleDTO(articleDTO, articleDTO.getId());
    	
    	String postBgBase64str = article.getPostBgBase64Str();
    	
    	if(postBgBase64str!=null && !postBgBase64str.equals("")){
    		article.setPostBgBase64Str(Util.getResizedBase64Str(postBgBase64str, 1900, 600));
    	}
    	
    	
    	String titleurl = getTitleUrl(article.getTitle());
    	if (articleService.findByTitleurl(titleurl) != null) {
    		ArticleListVO articleListVo = new ArticleListVO();
    		articleListVo.setActionMessage(messageSource.getMessage("title.allready.exist", null, null, locale));
    		return new ResponseEntity<ArticleListVO>(articleListVo, HttpStatus.OK); 
		}
    	
    	article.setTitleurl(titleurl);
    	article.setUser(user);
    	article.setCategory(category);
    	
        articleService.save(article);

        if (isSearchActivated(searchFor)) {
            return search(searchFor, page, locale, "message.create.success");
        }

        return createListAllResponse(page, locale, "message.create.success");
    }

    @RequestMapping(value = "articleedit/{id}", method = RequestMethod.PUT, produces = "application/json")
    public ResponseEntity<?> update(@PathVariable("id") int articleId,
                                    @RequestBody ArticleDTO articleDto,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
        if (articleId != articleDto.getId()) {
            return new ResponseEntity<String>("Bad Request", HttpStatus.BAD_REQUEST);
        }

        Article article = getArticleByArticleDTO(articleDto, articleId);
        
        String titleurl = getTitleUrl(article.getTitle());
        article.setTitleurl(titleurl);
        
        Category category = categoryService.findByCategoryName(articleDto.getCategoryName());
        article.setCategory(category);
        
        User user = articleService.findById(articleId).getUser();
        article.setUser(user);
        
        articleService.save(article);

        return createListAllResponse(page, locale, "message.update.success");
    }
    
    
    private Article getArticleByArticleDTO(ArticleDTO articleDto, int articleId) {
    	Article article = new Article();
        article.setId(articleId);
        article.setCreatedDate(articleDto.getCreatedDate());
        article.setDescription(articleDto.getDescription());
        article.setSummary(articleDto.getSummary());
        article.setTitle(articleDto.getTitle());
        article.setStatus(articleDto.getStatus());
        article.setPostBgBase64Str(articleDto.getPostBgBase64Str());
		return article;
	}

	@RequestMapping(value = "/articleedit/{id}", method = RequestMethod.GET)
    public ModelAndView fetchArticleById(@PathVariable("id") int articleId, Model model,
                                    Locale locale) {
    	
    	model.addAttribute("selectedArticleId", articleId);
    	
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

    @RequestMapping(value = "/findById/{selectedArticleId}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> getArticleById(@PathVariable("selectedArticleId") int selectedArticleId,
                                    Locale locale) {
    	Article article = articleService.findById(selectedArticleId);
    	
    	ArticleDTO articleDTO = new ArticleDTO();
    	articleDTO.setCreatedDate(article.getCreatedDate());
    	articleDTO.setDescription(article.getDescription());
    	articleDTO.setId(article.getId());
    	articleDTO.setSummary(article.getSummary());
    	articleDTO.setTitle(article.getTitle());
    	articleDTO.setUserName(article.getUser().getName());
    	articleDTO.setStatus(article.getStatus());
    	articleDTO.setCategoryName(article.getCategory().getCategoryName());
    	articleDTO.setPostBgBase64Str(article.getPostBgBase64Str());
    	
    	 return new ResponseEntity<ArticleDTO>(articleDTO, HttpStatus.OK);
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
    
    private String getTitleUrl(String string) {

		String str = string.toLowerCase();
		char[] charArr = str.toCharArray();

		String newStr = "";
		for (Character c : charArr) {
			if (c.equals('ý')) {
				c = 'i';
			} else if (c.equals('ö')) {
				c = 'o';
			} else if (c.equals('ç')) {
				c = 'c';
			} else if (c.equals('þ')) {
				c = 's';
			} else if (c.equals('ð')) {
				c = 'g';
			}else if (c.equals('ü')) {
				c = 'u';
			}else if (c.equals('.')
					|| c.equals(' ')
					|| c.equals(',')
					|| c.equals(':')
					|| c.equals(')')
					|| c.equals('(')
					|| c.equals('/')
					|| c.equals('\\')
					|| c.equals('\'')
					|| c.equals('\"')
					|| c.equals('?')
					|| c.equals('*')
					|| c.equals('&')
					|| c.equals('$')
					|| c.equals('£')
					|| c.equals('<')
					|| c.equals('>')
					) {
				c = '_';
			}

			newStr += c;
		}

		return newStr;
	}

}