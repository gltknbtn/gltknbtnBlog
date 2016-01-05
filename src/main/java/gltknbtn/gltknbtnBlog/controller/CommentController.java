package gltknbtn.gltknbtnBlog.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import gltknbtn.gltknbtnBlog.model.Comment;
import gltknbtn.gltknbtnBlog.service.CommentService;

@Controller
@RequestMapping(value = "/comments")
public class CommentController {


    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/{articleId}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> search(@PathVariable("articleId") int articleId,
                                    Locale locale) {
    	List<Comment> articleComments = commentService.findCommentsByArticleId(articleId);
    	
    	return new ResponseEntity<List<Comment>>(articleComments, HttpStatus.OK);
    }
}