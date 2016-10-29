package gltknbtn.gltknbtnBlog.controller;

import java.util.concurrent.Callable;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.async.WebAsyncTask;

@Controller
@RequestMapping(value = "/testtimeout")
public class TimeoutTestController {
	
	@RequestMapping(method = RequestMethod.GET)
	public @ResponseBody WebAsyncTask<String> callableWithCustomTimeoutHandling() {

		Callable<String> callable = new Callable<String>() {
			@Override
			public String call() throws Exception {
				Thread.sleep(6000);
				return "Callable result";
			}
		};

		return new WebAsyncTask<String>(5000, callable);
	}
	
	@ExceptionHandler
	@ResponseBody
	public String handleException(Exception ex) {
		return "Handled exception: " + ex.getMessage();
	}

}
