package gltknbtn.gltknbtnBlog.controller;

import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gltknbtn.gltknbtnBlog.service.MainPageService;
import gltknbtn.gltknbtnBlog.vo.ArticleListVO;



@Controller
@RequestMapping(value = "/mainpage")
public class MainPageController {
	
    @Autowired
    private MainPageService mainPageService;

	@Autowired
    private MessageSource messageSource;
	
	@Value("5")
    private int maxResults;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("mainPage");
    }
    
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
        return createListAllResponse(page, locale);
    }
    
    private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
        return createListAllResponse(page, locale, null);
    }
    
    private ArticleListVO listAll(int page) {
        return mainPageService.findAll(page, maxResults);
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
    
    private ResponseEntity<ArticleListVO> returnListToUser(ArticleListVO articleList) {
        return new ResponseEntity<ArticleListVO>(articleList, HttpStatus.OK);
    }
    
    
}
