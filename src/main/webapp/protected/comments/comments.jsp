<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row-fluid container" ng-controller="commentsController">
    <h2>
        <p class="text-center">
            <spring:message code='comments.header'/>
        </p>
    </h2>
    <h4>
        <div ng-class="{'': state == 'list', 'none': state != 'list'}">
            <p class="text-center">
                <spring:message code="message.total.records.found"/>:&nbsp;{{page.totalComments}}
            </p>
        </div>
    </h4>

    <div>
        <div id="gridContainer" ng-class="{'': state == 'list', 'none': state != 'list'}">
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th scope="col"><spring:message code="comment.name"/></th>
                    <th scope="col"><spring:message code="comment.commentDesc"/></th>
                    <th scope="col"><spring:message code="comment.mail"/></th>
                    <th scope="col"><spring:message code="comment.createdDate"/></th>
                    <th class="text-center" scope="col"><spring:message code="comment.accept"/></th>
                    <th class="text-center" scope="col"><spring:message code="comment.reject"/></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="comment in page.source">
                    <td class="tdContactsCentered">{{comment.name}}</td>
                    <td class="tdContactsCentered">{{comment.commentDesc}}</td>
                    <td class="tdContactsCentered">{{comment.mail}}</td>
                    <td class="tdContactsCentered">{{comment.createdDate}}</td>
                    
                    <td class="width15">
                        <div class="text-center">
                            <input type="hidden" value="{{comment.id}}"/>
                            <button type ="button"
                               title="<spring:message code="accept"/>&nbsp;<spring:message code="comment"/>"
                               class="btn btn-default" data-toggle="modal" data-target="#acceptCommentModal"
                               ng-click="selectComment(comment.id)">
                                <i class="glyphicon glyphicon-ok"></i>
                            </button>
                        </div>
                    </td>
                    
                    <td class="width15">
                        <div class="text-center">
                            <input type="hidden" value="{{comment.id}}"/>
                            <button type ="button"
                               title="<spring:message code="delete"/>&nbsp;<spring:message code="comment"/>"
                               class="btn btn-default" data-toggle="modal" data-target="#rejectCommentModal"
                               ng-click="selectComment(comment.id)">
                                <i class="glyphicon glyphicon-minus"></i>
                            </button>
                        </div>
                    </td>
                
                </tr>
                </tbody>
            </table>

            <div class="text-center">
                <button href="#" class="btn btn-default"
                        ng-class="{'btn-default': page.currentPage != 0, 'disabled': page.currentPage == 0}"
                        ng-disabled="page.currentPage == 0" ng-click="changePage(0)"
                        title='<spring:message code="pagination.first"/>'
                        >
                    <spring:message code="pagination.first"/>
                </button>
                <button href="#"
                        class="btn btn-default"
                        ng-class="{'btn-default': page.currentPage != 0, 'disabled': page.currentPage == 0}"
                        ng-disabled="page.currentPage == 0" class="btn btn-default"
                        ng-click="changePage(page.currentPage - 1)"
                        title='<spring:message code="pagination.back"/>'
                        >&lt;</button>
                <span>{{page.currentPage + 1}} <spring:message code="pagination.of"/> {{page.pagesCount}}</span>
                <button href="#"
                        class="btn btn-default"
                        ng-class="{'btn-default': page.pagesCount - 1 != page.currentPage, 'disabled': page.pagesCount - 1 == page.currentPage}"
                        ng-click="changePage(page.currentPage + 1)"
                        ng-disabled="page.pagesCount - 1 == page.currentPage"
                        title='<spring:message code="pagination.next"/>'
                        >&gt;</button>
                <button href="#"
                        class="btn btn-default"
                        ng-class="{'btn-default': page.pagesCount - 1 != page.currentPage, 'disabled': page.pagesCount - 1 == page.currentPage}"
                        ng-disabled="page.pagesCount - 1 == page.currentPage"
                        ng-click="changePage(page.pagesCount - 1)"
                        title='<spring:message code="pagination.last"/>'
                        >
                    <spring:message code="pagination.last"/>
                </button>
            </div>
        </div>
        <jsp:include page="dialogs/commentsDialogs.jsp"/>
    </div>
</div>

<script src="<c:url value="/resources/js/pages/comments.js" />"></script>