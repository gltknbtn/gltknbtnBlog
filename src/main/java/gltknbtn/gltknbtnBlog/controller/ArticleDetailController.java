package gltknbtn.gltknbtnBlog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.model.Comment;
import gltknbtn.gltknbtnBlog.service.ArticleService;
import gltknbtn.gltknbtnBlog.service.CommentService;

@Controller
@RequestMapping(value = "/articledetail")
public class ArticleDetailController {
	
	@Autowired
	CommentService commentService;

	@Autowired
	ArticleService articleService;

	@Autowired
	private MessageSource messageSource;
	
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("articledetail");
    }
    
    @RequestMapping(method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<?> create(@ModelAttribute("comment") Comment comment) {
    	
    	System.out.println("Commenter name: " + comment.getName());
    	System.out.println("Commenter mail: " + comment.getMail());
    	System.out.println("Commenter description: " + comment.getCommentDesc());
    	
    	/*
        contactService.save(contact);

        if (isSearchActivated(searchFor)) {
            return search(searchFor, page, locale, "message.create.success");
        }

        return createListAllResponse(page, locale, "message.create.success");
        */
    	
    	GltknData gltknData = new GltknData();
    	gltknData.setName(comment.getName());
    	gltknData.setMail(comment.getMail());
    	gltknData.setDesc(comment.getCommentDesc());
    	
    	Article selectedArticle = articleService.findById(3);
    	comment.setArticle(selectedArticle);
    	
    	commentService.save(comment);

    	return new ResponseEntity<GltknData>(gltknData, HttpStatus.OK);
    }
}
