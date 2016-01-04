<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div id="MyMenu" class="navbar navbar-inverse navbar-static-top">
                    <div class="container">
                        <div class="navbar-header">
                            <a href="/gltknbtnBlog/mainpage" class="navbar-brand">GltknBtn</a>

                            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbarSec">
                                <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="collapse navbar-collapse navbarSec">
                            <ul class="nav navbar-nav navbar-right"  ng-controller="LocationController">
                                <li ng-class="{'active': activeURL == 'mainpage', '': activeURL != 'mainpage'}"><a href="/gltknbtnBlog/mainpage">Anasayfa</a></li>
                                <li ng-class="{'active': activeURL == 'aboutme', '': activeURL != 'aboutme'}"><a href="/gltknbtnBlog/aboutme">Hakkımda</a></li>
                            <!--     <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dersler <b class="caret"></b></a>
                                    <ul class="dropdown-menu navbar-inverse derslerDropdown">
                                        <li><a href="makaleler.html">Makaleler</a></li>
                                        <li><a href="videolar.html">Videolar</a></li>
                                    </ul>
                                </li> -->
                                <li ng-class="{'active': activeURL == 'contactme', '': activeURL != 'contactme'}"><a href="/gltknbtnBlog/contactme">İletişim</a></li>
                                <li ng-class="{'active': activeURL == 'home', '': activeURL != 'home'}"><a href="<c:url value="/"/>">Admin Home</a></li>
                                <li class="dropdown">
                                    <a href="#" title="" class="dropdown-toggle" data-toggle='dropdown'><i class="glyphicon glyphicon-search"></i></a>
                                    <ul class="dropdown-menu navbar-inverse">
                                        <li>
                                            <form role='search' class="navbar-form">
                                                <div class="input-group">
                                                    <input type="text" class="form-control input-sm" placeholder="Arama Yap"/>
                                                    <span class="input-group-btn">
                                                        <button type="submit" class="form-control input-sm">
                                                            <i class="glyphicon glyphicon-search"></i>
                                                        </button>
                                                    </span>
                                                </div>
                                            </form>
                                        </li>
                                    </ul>
                                    
                                </li>
                                    <li><a href="login" title=""><i class="glyphicon glyphicon-log-in"></i></a></li>
                            </ul> 
                        </div>
                    </div>
</div>
                <!-- Navbar alanimiz bitti -->
