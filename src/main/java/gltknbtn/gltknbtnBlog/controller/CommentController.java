package gltknbtn.gltknbtnBlog.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gltknbtn.gltknbtnBlog.model.Comment;
import gltknbtn.gltknbtnBlog.service.CommentService;
import gltknbtn.gltknbtnBlog.vo.CommentListVO;

@Controller
@RequestMapping(value = "/comments")
public class CommentController {


    @Autowired
    private CommentService commentService;
    
    @Value("5")
    private int maxResults;

    @RequestMapping(value = "/{articleId}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> search(@PathVariable("articleId") int articleId,
                                    Locale locale,
                                    @RequestParam int page) {
    	 CommentListVO articleComments = commentService.findCommentsByArticleId(page, maxResults, articleId);
    	
    	return new ResponseEntity<CommentListVO>(articleComments, HttpStatus.OK);
    }
}