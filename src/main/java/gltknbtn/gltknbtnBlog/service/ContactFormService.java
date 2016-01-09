package gltknbtn.gltknbtnBlog.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gltknbtn.gltknbtnBlog.model.ContactForm;
import gltknbtn.gltknbtnBlog.repository.ContactFormRepository;

@Service
@Transactional
public class ContactFormService {

    @Autowired
    private ContactFormRepository contactFormRepository;


    public void save(ContactForm contactForm) {
    	String createdDate = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new Date());
    	contactForm.setCreatedDate(createdDate);
    	contactFormRepository.save(contactForm);
    }

    @Secured("ROLE_ADMIN")
    public void delete(int contactFormId) {
    	contactFormRepository.delete(contactFormId);
    }

}