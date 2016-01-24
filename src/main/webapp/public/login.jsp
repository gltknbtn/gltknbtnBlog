<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container">
  
  <div class="row" id="pwd-container">
    
    <div class="col-lg-4 col-md-4 col-sm-4"></div>
    
    <div class="col-lg-4 col-md-6 col-sm-6 well" ng-controller="loginController">
      <div class="alert alert-danger" ng-class="{'': displayLoginError == true, 'hidden': displayLoginError == false}">
            <spring:message code="login.error" />
        </div>
        <form method="post" action="j_spring_security_check">
          
          <div class="text-center"><legend><spring:message code="login.header" /></legend></div>
          <input name="j_username" id="j_username" type="text" class="form-control input-lg" placeholder="<spring:message code='sample.email' /> ">
          <input name="j_password" id="j_password" type="password"  class="form-control input-lg" placeholder="Password"><br/>
          
          <div class="pwstrength_viewport_progress"></div>
          
          <button type="submit" name="submit" class="btn btn-lg btn-primary btn-block"><spring:message code="login.signIn" /></button>
          
        </form>
        
      </div>
      
      <div class="col-lg-4 col-md-2 col-sm-2"></div>

  </div>
  
  
</div>


<script src="<c:url value='/resources/js/pages/login.js' />"></script>