package fgik.fadlarec.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping(value = "/mainpage")
public class MainPageController {

    @RequestMapping( method = RequestMethod.GET)
    public ModelAndView welcome() {
        
    	ModelAndView modelAndView = new ModelAndView("fadlarecmain");
    	return modelAndView;
        		
    }
    
    
    
}
