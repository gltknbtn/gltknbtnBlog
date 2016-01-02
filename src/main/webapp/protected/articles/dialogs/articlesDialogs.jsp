<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div id="addArticlesModal"
     class="modal hide fade in centering insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="addArticlesModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="addArticlesModalLabel" class="displayInLine">
            <spring:message code="create"/>&nbsp;<spring:message code="article"/>
        </h3>
    </div>
    <div class="modal-body text-center">
        <form name="newArticleForm" novalidate >
            <div class="pull-left">
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="articles.title"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               autofocus
                               ng-model="article.title"
                               name="title"
                               placeholder="<spring:message code='article'/>&nbsp;<spring:message code='articles.title'/>"/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newArticleForm.title.$error.required">
                                        <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="articles.description"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="article.description"
                               name="description"
                               placeholder="<spring:message code='articles.description'/> "/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newArticleForm.description.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="articles.owner"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="article.owner"
                               name="owner"
                               placeholder="<spring:message code='articles.owner'/> "/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newArticleForm.owner.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="articles.createdDate"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="article.createdDate"
                               name="createdDate"
                               placeholder="<spring:message code='articles.createdDate'/> "/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && newArticleForm.owner.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <input type="submit"
                       class="btn btn-inverse"
                       ng-click="createArticle(newArticleForm);"
                       value='<spring:message code="create"/>'/>
                <button class="btn btn-inverse"
                        data-dismiss="modal"
                        ng-click="exit('#addArticlesModal');"
                        aria-hidden="true">
                    <spring:message code="cancel"/>
                </button>
            </div>
        </form>
    </div>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorOnSubmit">
        <spring:message code="request.error"/>
    </span>
</div>

<div id="updateArticlesModal"
     class="modal hide fade in centering insertAndUpdateDialogs"
     role="dialog"
     aria-labelledby="updateArticlesModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="updateArticlesModalLabel" class="displayInLine">
            <spring:message code="update"/>&nbsp;<spring:message code="article"/>
        </h3>
    </div>
    <div class="modal-body">
        <form name="updateArticleForm" novalidate>
            <input type="hidden"
                   required
                   ng-model="article.id"
                   name="id"
                   value="{{article.id}}"/>

            <div class="pull-left">
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="articles.title"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               autofocus
                               required
                               ng-model="article.title"
                               name="title"
                               placeholder="<spring:message code='article'/>&nbsp;<spring:message code='articles.title'/> "/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && updateArticleForm.name.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="articles.description"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="article.description"
                               name="description"
                               placeholder="<spring:message code='articles.description'/> "/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && updateArticleForm.description.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="articles.owner"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="article.owner"
                               name="owner"
                               placeholder="<spring:message code='articles.owner'/> "/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && updateArticleForm.owner.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <div>
                    <div class="input-append">
                        <label>* <spring:message code="articles.createdDate"/>:</label>
                    </div>
                    <div class="input-append">
                        <input type="text"
                               required
                               ng-model="article.createdDate"
                               name="createdDate"
                               placeholder="<spring:message code='articles.createdDate'/> "/>
                    </div>
                    <div class="input-append">
                        <label>
                                <span class="alert alert-error"
                                      ng-show="displayValidationError && updateArticleForm.createdDate.$error.required">
                                    <spring:message code="required"/>
                                </span>
                        </label>
                    </div>
                </div>
                <input type="submit"
                       class="btn btn-inverse"
                       ng-click="updateArticle(updateArticleForm);"
                       value='<spring:message code="update"/>'/>
                <button class="btn btn-inverse"
                        data-dismiss="modal"
                        ng-click="exit('#updateArticlesModal');"
                        aria-hidden="true">
                    <spring:message code="cancel"/></button>
            </div>
        </form>
    </div>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorOnSubmit">
        <spring:message code="request.error"/>
    </span>
</div>

<div id="deleteArticlesModal"
     class="modal hide fade in centering"
     role="dialog"
     aria-labelledby="searchArticlesModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="deleteArticlesModalLabel" class="displayInLine">
            <spring:message code="delete"/>&nbsp;<spring:message code="article"/>
        </h3>
    </div>
    <div class="modal-body">
        <form name="deleteArticleForm" novalidate>
            <p><spring:message code="delete.confirm"/>:&nbsp;{{article.title}}?</p>

            <input type="submit"
                   class="btn btn-inverse"
                   ng-click="deleteArticle();"
                   value='<spring:message code="delete"/>'/>
            <button class="btn btn-inverse"
                    data-dismiss="modal"
                    ng-click="exit('#deleteArticlesModal');"
                    aria-hidden="true">
                <spring:message code="cancel"/>
            </button>
        </form>
    </div>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorOnSubmit">
        <spring:message code="request.error"/>
    </span>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorIllegalAccess">
        <spring:message code="request.illegal.access"/>
    </span>
</div>

<div id="searchArticlesModal"
     class="modal hide fade in centering"
     role="dialog"
     aria-labelledby="searchArticlesModalLabel"
     aria-hidden="true">
    <div class="modal-header">
        <h3 id="searchArticlesModalLabel" class="displayInLine">
            <spring:message code="search"/>
        </h3>
    </div>
    <div class="modal-body">
        <form name="searchArticleForm" novalidate>
            <label><spring:message code="search.for"/></label>

            <div>
                <div class="input-append">
                    <input type="text"
                           autofocus
                           required
                           ng-model="searchFor"
                           name="searchFor"
                           placeholder="<spring:message code='article'/>&nbsp;<spring:message code='articles.title'/> "/>
                </div>
                <div class="input-append displayInLine">
                    <label class="displayInLine">
                        <span class="alert alert-error"
                              ng-show="displayValidationError && searchArticleForm.searchFor.$error.required">
                            <spring:message code="required"/>
                        </span>
                    </label>
                </div>
            </div>
            <input type="submit"
                   class="btn btn-inverse"
                   ng-click="searchArticle(searchArticleForm, false);"
                   value='<spring:message code="search"/>'
                    />
            <button class="btn btn-inverse"
                    data-dismiss="modal"
                    ng-click="exit('#searchArticlesModal');"
                    aria-hidden="true">
                <spring:message code="cancel"/>
            </button>
        </form>
    </div>
    <span class="alert alert-error dialogErrorMessage"
          ng-show="errorOnSubmit">
        <spring:message code="request.error"/>
    </span>
</div>
