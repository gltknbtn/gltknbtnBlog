package gltknbtn.gltknbtnBlog.controller;

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
import org.springframework.web.servlet.ModelAndView;

import gltknbtn.gltknbtnBlog.model.User;
import gltknbtn.gltknbtnBlog.service.UserService;
import gltknbtn.gltknbtnBlog.vo.UserListVO;

@Controller
@RequestMapping(value = "/protected/users")
public class UserController {

    private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

    @Autowired
    private UserService userService;
    
    @Autowired
    private MessageSource messageSource;

    @Value("5")
    private int maxResults;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome(HttpServletRequest request, Model model) {
    	
    	HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		model.addAttribute("loggedUsername", user.getName());
    	
        return new ModelAndView("users");
    }
    
    
    @RequestMapping(value = "/usercreate", method = RequestMethod.GET)
    public ModelAndView userCreate() {
    	
    	return new ModelAndView("usercreate");
    }
    

    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
        return createListAllResponse(page, locale);
    }

    @RequestMapping(value = "/usercreate", method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<?> create(@ModelAttribute("user") User user,
                                    @RequestParam(required = false) String searchFor,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
    	
    	boolean isUserExists = checkUserEmailExist(user);
    	if (!isUserExists) {
    		userService.save(user);
    		return createListAllResponse(page, locale, "message.create.success");
		}else{
			return createListAllResponse(page, locale, "message.user.exists");
		}
    	
    }

    private boolean checkUserEmailExist(User user) {
    	boolean isUserExists = false;
    	User tmpUser = userService.findByEmail(user.getEmail());
    	if (tmpUser != null) {
			return isUserExists = true;
		}else
		return isUserExists;
	}


	@RequestMapping(value = "useredit/{id}", method = RequestMethod.PUT, produces = "application/json")
    public ResponseEntity<?> update(@PathVariable("id") int userId,
                                    @RequestBody User user,
                                    @RequestParam String repassword,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
        if (userId != user.getId()) {
            return new ResponseEntity<String>("Bad Request", HttpStatus.BAD_REQUEST);
        }

        userService.save(user);

        return createListAllResponse(page, locale, "message.update.success");
    }
    
    
    @RequestMapping(value = "/useredit/{id}", method = RequestMethod.GET)
    public ModelAndView fetchUserById(
    								@PathVariable("id") int userId, 
    								Model model,
			Locale locale) {

		model.addAttribute("selectedUserId", userId);

		return new ModelAndView("useredit");

	}
    
    

    @RequestMapping(value = "/{userId}", method = RequestMethod.DELETE, produces = "application/json")
    public ResponseEntity<?> delete(@PathVariable("userId") int userId,
                                    @RequestParam(required = false) String searchFor,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {


        try {
            userService.delete(userId);
        } catch (AccessDeniedException e) {
            return new ResponseEntity<Object>(HttpStatus.FORBIDDEN);
        }

        return createListAllResponse(page, locale, "message.delete.success");
    }

    @RequestMapping(value = "/findById/{selectedUserId}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> getUserById(@PathVariable("selectedUserId") int selectedUserId,
                                    Locale locale) {
    	User user = userService.findById(selectedUserId);
    	
    	 return new ResponseEntity<User>(user, HttpStatus.OK);
    }
    

    private UserListVO listAll(int page) {
        return userService.findAll(page, maxResults);
    }

    private ResponseEntity<UserListVO> returnListToUser(UserListVO userList) {
        return new ResponseEntity<UserListVO>(userList, HttpStatus.OK);
    }

    private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
        return createListAllResponse(page, locale, null);
    }

    private ResponseEntity<?> createListAllResponse(int page, Locale locale, String messageKey) {
        UserListVO userListVO = listAll(page);

        addActionMessageToVO(userListVO, locale, messageKey, null);

        return returnListToUser(userListVO);
    }

    private UserListVO addActionMessageToVO(UserListVO userListVO, Locale locale, String actionMessageKey, Object[] args) {
        if (StringUtils.isEmpty(actionMessageKey)) {
            return userListVO;
        }

        userListVO.setActionMessage(messageSource.getMessage(actionMessageKey, args, null, locale));

        return userListVO;
    }

}