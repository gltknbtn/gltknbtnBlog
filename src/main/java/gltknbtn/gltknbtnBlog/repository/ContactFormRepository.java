package gltknbtn.gltknbtnBlog.repository;

import org.springframework.data.repository.PagingAndSortingRepository;

import gltknbtn.gltknbtnBlog.model.ContactForm;

public interface ContactFormRepository extends PagingAndSortingRepository<ContactForm, Integer> {
	
}