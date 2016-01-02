package gltknbtn.gltknbtnBlog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gltknbtn.gltknbtnBlog.model.Article;
import gltknbtn.gltknbtnBlog.repository.MainPageRepository;
import gltknbtn.gltknbtnBlog.vo.ArticleListVO;

@Service
@Transactional
public class MainPageService {

	@Autowired
	private MainPageRepository mainPageRepository;

	@Transactional(readOnly = true)
	public ArticleListVO findAll(int page, int maxResults) {
		Page<Article> result = executeQueryFindAll(page, maxResults);

		if (shouldExecuteSameQueryInLastPage(page, result)) {
			int lastPage = result.getTotalPages() - 1;
			result = executeQueryFindAll(lastPage, maxResults);
		}

		return buildResult(result);
	}

	@Transactional(readOnly = true)
	public ArticleListVO findByTitleLike(int page, int maxResults, String title) {
		Page<Article> result = executeQueryFindByTitle(page, maxResults, title);

		if (shouldExecuteSameQueryInLastPage(page, result)) {
			int lastPage = result.getTotalPages() - 1;
			result = executeQueryFindByTitle(lastPage, maxResults, title);
		}

		return buildResult(result);
	}

	private boolean shouldExecuteSameQueryInLastPage(int page, Page<Article> result) {
		return isUserAfterOrOnLastPage(page, result) && hasDataInDataBase(result);
	}

	private Page<Article> executeQueryFindAll(int page, int maxResults) {
		final PageRequest pageRequest = new PageRequest(page, maxResults, sortByTitleASC());

		return mainPageRepository.findAll(pageRequest);
	}

	private Sort sortByTitleASC() {
		return new Sort(Sort.Direction.ASC, "title");
	}

	private ArticleListVO buildResult(Page<Article> result) {
		return new ArticleListVO(result.getTotalPages(), result.getTotalElements(), result.getContent());
	}

	private Page<Article> executeQueryFindByTitle(int page, int maxResults, String title) {
		final PageRequest pageRequest = new PageRequest(page, maxResults, sortByTitleASC());

		return mainPageRepository.findByTitleLike(pageRequest, "%" + title + "%");
	}

	private boolean isUserAfterOrOnLastPage(int page, Page<Article> result) {
		return page >= result.getTotalPages() - 1;
	}

	private boolean hasDataInDataBase(Page<Article> result) {
		return result.getTotalElements() > 0;
	}
}