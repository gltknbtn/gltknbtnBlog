package fgik.fadlarec.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class ContactForm {

    @Id
    @GeneratedValue
    private int id;
    
    private String name;
    private String email;
    private String phone;
    private String title;
    private String message;
    private String createdDate;
    
	public ContactForm(int id, 
						String name,
						String email,
						String phone,
						String title, 
						String message,
						String createdDate){
		
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.title = title;
		this.message = message;
		this.createdDate = createdDate;
	}
	
	public ContactForm() {
	}
	

    public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCreatedDate() {
		return createdDate;
	}
	
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	@Override
    public boolean equals(Object object) {
        if (object instanceof ContactForm){
            ContactForm article = (ContactForm) object;
            return article.id == id;
        }

        return false;
    }

    @Override
    public int hashCode() {
        return id;
    }
}
