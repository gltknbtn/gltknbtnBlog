package gltknbtn.gltknbtnBlog.vo;


import java.util.List;

import gltknbtn.gltknbtnBlog.model.Comment;

public class CommentListVO {
    private int pagesCount;
    private long totalComments;

    private String actionMessage;
    private String searchMessage;

    private List<Comment> comments;

    public CommentListVO() {
    }

    public CommentListVO(int pages, long totalContacts, List<Comment> comments) {
        this.pagesCount = pages;
        this.comments = comments;
        this.totalComments = totalContacts;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<Comment> getComments() {
		return comments;
	}

    public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
    
    public long getTotalComments() {
		return totalComments;
	}
    
    public void setTotalComments(long totalComments) {
		this.totalComments = totalComments;
	}

    public String getActionMessage() {
        return actionMessage;
    }

    public void setActionMessage(String actionMessage) {
        this.actionMessage = actionMessage;
    }

    public String getSearchMessage() {
        return searchMessage;
    }

    public void setSearchMessage(String searchMessage) {
        this.searchMessage = searchMessage;
    }
}