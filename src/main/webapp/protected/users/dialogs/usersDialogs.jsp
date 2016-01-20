<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="modal fade" id="deleteUsersModal" tabindex="-1" role="dialog" aria-labelledby="deleteUsersModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
       <h3 id="deleteArticlesModalLabel" class="displayInLine">
            <spring:message code="delete"/>&nbsp;<spring:message code="article"/>
        </h3>
      </div>
      <div class="modal-body">
            <form name="deleteArticleForm" novalidate>
            <p><spring:message code="delete.confirm"/>:&nbsp;{{selectedUser.name}}?</p>

            <input type="submit"
                   class="btn btn-primary"
                   ng-click="deleteUser();"
                   value='<spring:message code="delete"/>'/>
            <button class="btn btn-default"
                    data-dismiss="modal"
                    ng-click="exit('#deleteUsersModal');"
                    aria-hidden="true">
                <spring:message code="cancel"/>
            </button>
        </form>
      </div>
			<div class="modal-footer">
				<span class="alert alert-error dialogErrorMessage"
					ng-show="errorOnSubmit"> <spring:message
						code="request.error" />
				</span> <span class="alert alert-error dialogErrorMessage"
					ng-show="errorIllegalAccess"> <spring:message
						code="request.illegal.access" />
				</span>
			</div>
		</div>
  </div>
</div>
