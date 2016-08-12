package fgik.fadlarec.vo;

public class CategoryDTO {

	private long articleCount;
	private String categoryName;

	public CategoryDTO(String categoryName, long articleCount) {
		this.categoryName = categoryName;
		this.articleCount = articleCount;
	}
	
	public long getArticleCount() {
		return articleCount;
	}
	public void setArticleCount(long articleCount) {
		this.articleCount = articleCount;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	

}
