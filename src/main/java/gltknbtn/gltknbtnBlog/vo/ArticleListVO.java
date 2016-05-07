package gltknbtn.gltknbtnBlog.vo;


import java.util.List;

import gltknbtn.gltknbtnBlog.model.Article;

public class ArticleListVO {
    private int pagesCount;
    private long totalArticles;

    private String actionMessage;
    private String searchMessage;

    private List<ArticleDTO> articles;

    public ArticleListVO() {
    }

    public ArticleListVO(int pages, long totalArticles, List<ArticleDTO> articles) {
        this.pagesCount = pages;
        this.articles = articles;
        this.totalArticles = totalArticles;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<ArticleDTO> getArticles() {
        return articles;
    }

    public void setArticles(List<ArticleDTO> articles) {
        this.articles = articles;
    }

    public long getTotalArticles() {
        return totalArticles;
    }

    public void setTotalArticles(long totalArticles) {
        this.totalArticles = totalArticles;
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