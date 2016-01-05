package gltknbtn.gltknbtnBlog.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import gltknbtn.gltknbtnBlog.model.Comment;
import gltknbtn.gltknbtnBlog.model.Contact;
import gltknbtn.gltknbtnBlog.service.ArticleService;
import gltknbtn.gltknbtnBlog.service.CommentService;
import gltknbtn.gltknbtnBlog.vo.ContactListVO;

@Controller
@RequestMapping(value = "/articledetail")
public class ArticleDetailController {
	
	@Autowired
	CommentService commentService;

	@Autowired
	ArticleService articleService;

	@Autowired
	private MessageSource messageSource;
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView fetchArticleById(@PathVariable("id") int articleId, Model model,
                                    Locale locale) {
        if (articleId == 0) {
        	return new ModelAndView("articledetail");
        }else{
        	Article selectedArticle = articleService.findById(articleId);
        	
        	//List<Comment> list = commentService.findCommentsByArticleId(articleId);
        	
        	model.addAttribute("selectedArticle", selectedArticle);
        	return new ModelAndView("articledetail");
        }

    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<?> create(@PathVariable("id") int articleId, @ModelAttribute("comment") Comment comment) {
    	
    	System.out.println("selected article id: " + articleId);
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
    	
    	Article selectedArticle = articleService.findById(articleId);
    	comment.setArticle(selectedArticle);
    	
    	commentService.save(comment);

    	return new ResponseEntity<GltknData>(gltknData, HttpStatus.OK);
    }
}
