package gltknbtn.gltknbtnBlog.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonBackReference;

@Entity
public class Comment {

    @Id
    @GeneratedValue
    private int id;
	private String name;
	private String commentDesc;
	private String mail;
	private String createdDate;
	private String enabled;
	
	
	@ManyToOne
	@JoinColumn(name = "article_id")
	private Article article;
	
	public Comment(){
		
	}
	
	public Comment(String name, String commentDesc, String mail, String createdDate, int id, String enabled) {
		super();
		this.name= name;
		this.commentDesc = commentDesc;
		this.mail = mail;
		this.createdDate = createdDate;
		this.enabled = enabled;
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
    
    public String getCommentDesc() {
		return commentDesc;
	}
    public void setCommentDesc(String commentDesc) {
		this.commentDesc = commentDesc;
	}
    
    public String getMail() {
		return mail;
	}
    public void setMail(String mail) {
		this.mail = mail;
	}
    
    public String getCreatedDate() {
		return createdDate;
	}
    public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

    @JsonBackReference
    public Article getArticle() {
		return article;
	}
    public void setArticle(Article article) {
		this.article = article;
	}
    
    @Override
    public boolean equals(Object object) {
        if (object instanceof Comment){
            Comment article = (Comment) object;
            return article.id == id;
        }

        return false;
    }

    @Override
    public int hashCode() {
        return id;
    }

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
}
