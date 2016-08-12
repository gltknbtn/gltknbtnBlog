<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="modal fade" id="rejectCommentModal" tabindex="-1" role="dialog" aria-labelledby="rejectCommentModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
       <h3 id="rejectCommentModalLabel" class="displayInLine">
            <spring:message code="reject"/>&nbsp;<spring:message code="comment"/>
        </h3>
      </div>
      <div class="modal-body">
            <form name="rejectCommentForm" novalidate>
            <p><spring:message code="reject.confirm"/>:&nbsp;{{selectedComment.name}}?</p>

            <input type="submit"
                   class="btn btn-primary"
                   ng-click="rejectComment();"
                   value='<spring:message code="reject"/>'/>
            <button class="btn btn-default"
                    data-dismiss="modal"
                    ng-click="exit('#rejectCommentModal');"
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

<div class="modal fade" id="acceptCommentModal" tabindex="-1" role="dialog" aria-labelledby="acceptCommentModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
       <h3 id="acceptCommentModalLabel" class="displayInLine">
            <spring:message code="accept"/>&nbsp;<spring:message code="comment"/>
        </h3>
      </div>
      <div class="modal-body">
            <form name="acceptCommentForm" novalidate>
            <p><spring:message code="accept.confirm"/>:&nbsp;{{selectedComment.name}}?</p>

            <input type="submit"
                   class="btn btn-primary"
                   ng-click="acceptComment();"
                   value='<spring:message code="accept"/>'/>
            <button class="btn btn-default"
                    data-dismiss="modal"
                    ng-click="exit('#acceptCommentModal');"
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
