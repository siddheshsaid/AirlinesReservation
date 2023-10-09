<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>

        <link rel="stylesheet" href="resources/admin_Login.css">
    </head>
    <body>
     <script type="text/javascript">
            function Validate(){
              if(document.myForm.lemail.value==""){
                            alert("Enter your email first")
                            document.myForm.lemail.focus()
                            return false
                           }

            else if(document.myForm.lpassword.value==""){
                alert("Enter your password first")
                document.myForm.lpassword.focus()
                return false
               }
               else if (document.myForm.lemail.value != "Airaibiadmin@2023" || document.myForm.lpassword.value != "123") {
                           alert("Your Email id or password is incorrect");
                           document.myForm.lpassword.focus();
                           return false;
                           }


            else{
                return true
            }
        }

            </script>
       <div class="container">
                  <div class="form-card login-card">


                      <h3 class="login-heading"><b>Admin Login</b></h3>
                      <form action="createAdminLogin" method="post" name="myForm" >
                          <div class="form-group">
                              <input type="text" id="loginemail" name="lemail" placeholder="email address*" >
                          </div>
                          <div class="form-group">
                              <input type="password" id="loginpassword" name="lpassword" placeholder="password*">
                          </div>
                          <div class="login-checkbox">
                              <input type="checkbox" id="checkbox" name="checkboxlogin">
                              <span class="login-checkbox1"><b>remember me</b></span>
                              <a class="anchor" href="#"><b>forgot password?</b></a>
                          </div>
                          <button class="btn-btn-primary">Login</button><br><br>
                          <p class="or"><b>or</b></p><br>
                          <button class="btn-btn-secondary"><i class="fa-brands fa-facebook"></i> &nbsp sign in with facebook</button>
                          <button class="btn-btn-thirdly"><i class="fa-solid fa-envelope"></i> &nbsp sign in with google</button>

                      </form>

                  </div>
    </body>
</html>