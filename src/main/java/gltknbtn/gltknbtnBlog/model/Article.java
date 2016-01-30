package gltknbtn.gltknbtnBlog.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.codehaus.jackson.annotate.JsonManagedReference;

@Entity
public class Article {

    @Id
    @GeneratedValue
    private int id;
	private String title;
	private String summary;
	private String description;
	private String owner;
	private String createdDate;
	
	@OneToMany(targetEntity=Comment.class, mappedBy="article", cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	private List<Comment> comments;
	
	public Article(){
		
	}
	
	public Article(String title, String summary, String description, String owner, String createdDate, int id) {
		super();
		this.title= title;
		this.summary= summary;
		this.description = description;
		this.owner = owner;
		this.createdDate = createdDate;
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
    
    public String getOwner() {
		return owner;
	}
    public void setOwner(String owner) {
		this.owner = owner;
	}
    
    public String getCreatedDate() {
		return createdDate;
	}
    public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
    
    @JsonManagedReference
    public List<Comment> getComments() {
		return comments;
	}
    public void setComments(List<Comment> comments) {
		this.comments = comments;
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
