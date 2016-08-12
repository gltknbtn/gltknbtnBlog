package fgik.fadlarec.vo;

import java.util.List;

import fgik.fadlarec.model.Category;

public class CategoryListVO {
    private int pagesCount;
    private long totalCategories;

    private String actionMessage;
    private String searchMessage;

    private List<Category> categories;

    public CategoryListVO() {
    }

    public CategoryListVO(int pages, long totalCategories, List<Category> categories) {
        this.pagesCount = pages;
        this.categories = categories;
        this.totalCategories = totalCategories;
    }

    public int getPagesCount() {
        return pagesCount;
    }

    public void setPagesCount(int pagesCount) {
        this.pagesCount = pagesCount;
    }

    public List<Category> getCategories() {
		return categories;
	}
    public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

    public long getTotalCategories() {
		return totalCategories;
	}
    public void setTotalCategories(long totalCategories) {
		this.totalCategories = totalCategories;
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
