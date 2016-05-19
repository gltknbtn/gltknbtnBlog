package gltknbtn.gltknbtnBlog.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonBackReference;

@Entity
public class Article {

    @Id
    @GeneratedValue
    private int id;
	private String title;
	private String summary;
	private String description;
	private String createdDate;
	private String status;
	
	@ManyToOne
	private User user;
	
	public Article(){
		
	}
	
	public Article(String title, String summary, String description, String createdDate, int id, User user, String status) {
		super();
		this.title= title;
		this.summary= summary;
		this.description = description;
		this.createdDate = createdDate;
		this.user = user;
		this.status = status;
	}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
		return title;
	}
    public void setTitle(String title) {
		this.title = title;
	}
    
    public String getSummary() {
		return summary;
	}
    public void setSummary(String summary) {
		this.summary = summary;
	}
    
    public String getDescription() {
		return description;
	}
    public void setDescription(String description) {
		this.description = description;
	}
    
    public String getCreatedDate() {
		return createdDate;
	}
    public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
    
    @JsonBackReference
    public User getUser() {
		return user;
	}
    
    public void setUser(User user) {
		this.user = user;
	}
    
    public String getStatus() {
		return status;
	}
    
    public void setStatus(String status) {
		this.status = status;
	}

    @Override
    public boolean equals(Object object) {
        if (object instanceof Article){
            Article article = (Article) object;
            return article.id == id;
        }

        return false;
    }

    @Override
    public int hashCode() {
        return id;
    }
}
