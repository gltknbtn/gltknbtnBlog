package gltknbtn.gltknbtnBlog.controller;

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
import org.springframework.web.servlet.ModelAndView;

import gltknbtn.gltknbtnBlog.model.Comment;
import gltknbtn.gltknbtnBlog.service.CommentService;
import gltknbtn.gltknbtnBlog.vo.CommentListVO;

@Controller
@RequestMapping(value = "/protected/comments")
public class CommentController {


    @Autowired
    private CommentService commentService;
    
    @Value("5")
    private int maxResults;
    
    
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
    	
        return new ModelAndView("newComments");
    }
    
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> listAllNewComments(@RequestParam int page, Locale locale) {
    	String enabled = "0";
    	return createListAllCommentsResponseByEnabled(enabled, page, locale);
    }

    @RequestMapping(value = "/findById/{commentId}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> findCommentById(@PathVariable("commentId") int commentId,
    		Locale locale) {
    	Comment selectedComment = commentService.findById(commentId);
    	
    	return new ResponseEntity<Comment>(selectedComment, HttpStatus.OK);
    }
    

    @RequestMapping(value = "/editstatus/{selectedCommentId}", method = RequestMethod.PUT, produces = "application/json")
    public ResponseEntity<?> update(@PathVariable("selectedCommentId") int selectedCommentId,
                                    @RequestParam(required= false) String status,
                                    Locale locale) {
    	Comment selectedComment = commentService.findById(selectedCommentId);
    	selectedComment.setEnabled(status);
    	commentService.save(selectedComment);
    	
    	return new ResponseEntity<Comment>(selectedComment, HttpStatus.OK);
    }
    

    private ResponseEntity<?> createListAllCommentsResponseByEnabled(String enabled, int page, Locale locale) {
        return createListAllCommentsResponseByEnabled(enabled, page, locale, null);
    }
    

    private ResponseEntity<?> createListAllCommentsResponseByEnabled(String enabled, int page, Locale locale, String messageKey) {
        CommentListVO commentListVO = listAllCommentsByEnabled(enabled, page);

        return returnListToUser(commentListVO);
    }
    
    private CommentListVO listAllCommentsByEnabled(String enabled, int page) {
        return commentService.findAllCommentsByEnabled(enabled, page, maxResults);
    }
    

    private ResponseEntity<CommentListVO> returnListToUser(CommentListVO commentList) {
        return new ResponseEntity<CommentListVO>(commentList, HttpStatus.OK);
    }
}