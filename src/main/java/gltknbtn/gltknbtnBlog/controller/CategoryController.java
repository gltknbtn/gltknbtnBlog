package gltknbtn.gltknbtnBlog.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

import gltknbtn.gltknbtnBlog.model.Category;
import gltknbtn.gltknbtnBlog.service.CategoryService;
import gltknbtn.gltknbtnBlog.vo.CategoryListVO;

@Controller
@RequestMapping(value = "/protected/categories")
public class CategoryController {

    private static final String DEFAULT_PAGE_DISPLAYED_TO_USER = "0";

    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private MessageSource messageSource;

    @Value("500")
    private int maxResults;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("categories");
    }
    
    
    @RequestMapping(value = "/categorycreate", method = RequestMethod.GET)
    public ModelAndView categoryCreate() {
    	return new ModelAndView("categorycreate");
    }
    

    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
        return createListAllResponse(page, locale);
    }

    @RequestMapping(value = "/categorycreate", method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<?> create(@ModelAttribute("category") Category category,
                                    @RequestParam(required = false) String searchFor,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
    	
    		categoryService.save(category);
    		return createListAllResponse(page, locale, "message.create.success");
    	
    }



	@RequestMapping(value = "categoryedit/{id}", method = RequestMethod.PUT, produces = "application/json")
    public ResponseEntity<?> update(@PathVariable("id") int categoryId,
                                    @RequestBody Category category,
                                    @RequestParam(required = false, defaultValue = DEFAULT_PAGE_DISPLAYED_TO_USER) int page,
                                    Locale locale) {
        if (categoryId != category.getId()) {
            return new ResponseEntity<String>("Bad Request", HttpStatus.BAD_REQUEST);
        }

        categoryService.save(category);

        return createListAllResponse(page, locale, "message.update.success");
    }
    
    
    @RequestMapping(value = "/categoryedit/{id}", method = RequestMethod.GET)
    public ModelAndView fetchCategoryById(@PathVariable("id") int categoryId, Model model,
                                    Locale locale) {
    	
    	model.addAttribute("selectedCategoryId", categoryId);
    	
        return new ModelAndView("categoryedit");

    }
    


    @RequestMapping(value = "/findCategoryById/{selectedCategoryId}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> getCategoryById(@PathVariable("selectedCategoryId") int selectedCategoryId,
                                    Locale locale) {
    	Category category = categoryService.findById(selectedCategoryId);
    	
    	 return new ResponseEntity<Category>(category, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/findByName/{categoryNameTobeUpdated}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<?> getCategoryByName(@PathVariable("categoryNameTobeUpdated") String categoryNameTobeUpdated,
    		Locale locale) {
    	Category category = categoryService.findByCategoryName(categoryNameTobeUpdated);
    	List<Category> listWithOneItem = new ArrayList<Category>();
    	listWithOneItem.add(category);
    	CategoryListVO vo = new CategoryListVO(0, 1, listWithOneItem );
    	
    	return new ResponseEntity<CategoryListVO>(vo, HttpStatus.OK);
    }
    

    private CategoryListVO listAll(int page) {
        return categoryService.findAll(page, maxResults);
    }

    private ResponseEntity<CategoryListVO> returnListToUser(CategoryListVO categoryListVO) {
        return new ResponseEntity<CategoryListVO>(categoryListVO, HttpStatus.OK);
    }

    private ResponseEntity<?> createListAllResponse(int page, Locale locale) {
        return createListAllResponse(page, locale, null);
    }

    private ResponseEntity<?> createListAllResponse(int page, Locale locale, String messageKey) {
    	CategoryListVO categoryListVO = listAll(page);

        addActionMessageToVO(categoryListVO, locale, messageKey, null);

        return returnListToUser(categoryListVO);
    }

    private CategoryListVO addActionMessageToVO(CategoryListVO categoryListVO, Locale locale, String actionMessageKey, Object[] args) {
        if (StringUtils.isEmpty(actionMessageKey)) {
            return categoryListVO;
        }

        categoryListVO.setActionMessage(messageSource.getMessage(actionMessageKey, args, null, locale));

        return categoryListVO;
    }

}