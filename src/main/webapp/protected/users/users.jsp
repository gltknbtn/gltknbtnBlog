<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row-fluid container" ng-controller="usersController">
    <h2>
        <p class="text-center">
            <spring:message code='articles.header'/>
        </p>
    </h2>
    <h4>
        <div ng-class="{'': state == 'list', 'none': state != 'list'}">
            <p class="text-center">
                <spring:message code="message.total.records.found"/>:&nbsp;{{page.totalUsers}}
            </p>
        </div>
    </h4>

    <div>
        <div id="gridContainer" ng-class="{'': state == 'list', 'none': state != 'list'}">
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th scope="col"><spring:message code="user.name"/></th>
                    <%-- <th scope="col"><spring:message code="user.password"/></th> --%>
                    <th scope="col"><spring:message code="user.email"/></th>
                    <th scope="col"><spring:message code="user.enabled"/></th>
                    <th class="text-center" scope="col"><spring:message code="user.edit"/></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="user in page.source">
                    <td class="tdContactsCentered">{{user.name}}</td>
                    <!-- <td class="tdContactsCentered">{{user.password}}</td> -->
                    <td class="tdContactsCentered">{{user.email}}</td>
                    <td class="tdContactsCentered">{{user.enabled}}</td>
                    <td class="width15">
                        <div class="text-center">
                            <input type="hidden" value="{{user.id}}"/>
                            <a href="<c:url value='/protected/users/useredit/{{user.id}}'/>"
                               role="button"
                               title="<spring:message code="update"/>&nbsp;<spring:message code="user"/>"
                               class="btn btn-default" data-toggle="modal">
                                <i class="glyphicon glyphicon-pencil"></i>
                            </a>
                            <%-- <button type ="button"
                               title="<spring:message code="delete"/>&nbsp;<spring:message code="user"/>"
                               class="btn btn-default" data-toggle="modal" data-target="#deleteUsersModal"
                               ng-click="selectUser(user.id)">
                                <i class="glyphicon glyphicon-minus"></i>
                            </button> --%>
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
        <div ng-class="{'text-center': displayCreateUserButton == true, 'none': displayCreateUserButton == false}">
            <br/>
            <a href="<c:url value='/protected/users/usercreate'/>"
               role="button"
               ng-click="resetUser();"
               title="<spring:message code='create'/>&nbsp;<spring:message code='user'/>"
               class="btn btn-default">
                <i class="icon-plus"></i>
                &nbsp;&nbsp;<spring:message code="create"/>&nbsp;<spring:message code="user"/>
            </a>
        </div>
        <jsp:include page="dialogs/usersDialogs.jsp"/>
    </div>
</div>

<script src="<c:url value="/resources/js/pages/users.js" />"></script>