package gltknbtn.gltknbtnBlog.controller;

import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.model.ContactForm;
import gltknbtn.gltknbtnBlog.service.ArticleService;
import gltknbtn.gltknbtnBlog.service.ContactFormService;
import gltknbtn.gltknbtnBlog.vo.ArticleListVO;

@Controller
@RequestMapping(value = "/contactme")
public class ContactFormController {

    @Autowired
    private ContactFormService contactFormService;


    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("contactme");
    }


    @RequestMapping(method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<?> create(@ModelAttribute("contactForm") ContactForm contactForm,
                                    Locale locale) {
    	String responseMessage = "Sending Failed";
    	try {
    		contactFormService.save(contactForm);
    		responseMessage = "Thanks for your attention. Admin will be returned you as soon as possible";
		} catch (Exception e) {
			e.printStackTrace();
		}

    	return new ResponseEntity<String>(responseMessage, HttpStatus.OK);
    }

}