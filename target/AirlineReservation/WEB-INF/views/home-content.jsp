<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>









<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <!-- LINK TAG FOR SLIDER -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">

        <script src="resources/home-content.js"></script>

          <link rel="stylesheet" href="resources/home-content.css">

           <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
                  integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
                  crossorigin="anonymous" referrerpolicy="no-referrer" />


    </head>
    <body>


        <section id="nav" >
            <nav class="sub-nav">
                <div class="menu">
           <ol>


             <li><a href="<c:url value='/'/>">Home</a></li>
              <li><a href="" id="manage-flight-link">Book Flight</a></li>
            <li><a href="" id="admin-login-link">Admin Login</a></li>
             <li><a href="<c:url value='filterflights'/> ">Search Flight</a></li>





                </ol>
                 <div id="openSidebarButton"><i class="fa-solid fa-list"></i></div>
            </div>
            </nav>
        </section>





    <!-- Sidebar -->
    <div id="mySidebar" class="sidebar">
        <div class="sidebar-content">

            <h2>Sidebar Content</h2>
            <p>Some content here.</p>
            <div id="closeSidebarButton"><i class="fa-solid fa-circle-xmark"></i></div>
        </div>


    </div>



           <div id="content">





                             <!-- SLIDER TAG STARTS FROM HERE -->
                                  <div id="carouselExample" class="carousel slide">
                                                              <div class="carousel-inner">
                                                                <div class="carousel-item active">
                                                                 <c:url var="imageURL" value="/resources/images/landscape-night-airplane-lights-wallpaper-preview.jpg" />
                                                                 <img src="<c:out value='${imageURL}' />"class="d-block w-100" alt="..." height="400px" width="100%">


                                                                </div>
                                                                <div class="carousel-item">
                                                                   <c:url var="imageURL" value="/resources/images/plane-3417178__340.jpg" />
                                                                   <img src="<c:out value='${imageURL}' />"class="d-block w-100" alt="..." height="400px" width="100%">


                                                                </div>
                                                                <div class="carousel-item">

                                                                           <c:url var="imageURL" value="/resources/images/airlinebackground.jpg" />
                                                                          <img src="<c:out value='${imageURL}' />"class="d-block w-100" alt="..." height="400px" width="100%">

                                                                </div>
                                                              </div>
                                                              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                                <span class="visually-hidden">Previous</span>
                                                              </button>
                                                              <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                                <span class="visually-hidden">Next</span>
                                                              </button>
                                                            </div>


                      <!-- SCRIPT TAG FOR SLIDER -->
                     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
                     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.min.js" integrity="sha384-heAjqF+bCxXpCWLa6Zhcp4fu20XoNIA98ecBC1YkdXhszjoejr5y9Q77hIrv8R9i" crossorigin="anonymous"></script>



                             <div class="card-heading">
                                 <h1>Personalize your trip</h1>
                                 <p>Personalize your trip with Airaibi airlines and embark on an <br>
                                 unforgottable journey
                                 </p>

                             </div>

                         <div class="main">
                             <!-- <div class="main-card"> -->
                                 <div class="card-4">
                                     <div class="image-4">

                                           <c:url var="imageUR" value="/resources/images/istockphoto-1053526912-612x612.jpg" />
                                            <img src="<c:out value='${imageUR}' />">

                                         <h1 >Before you fly</h1>
                                     </div>
                                     <div class="content-4">
                                     <p class="paragraph-4">Everything you need to prepare for smooth <br>journey travel safe with us
                                     <br>Click below for futher details
                                     </p>
                                     <button class="learn-more">Learn More</button>
                                 </div>
                                 </div>
                                 <div class="card-1">
                                     <div class="image-1">
                                      <c:url var="imageUR" value="/resources/images/landscape-night-airplane-lights-wallpaper-preview.jpg" />
                                      <img src="<c:out value='${imageUR}' />">


                                         <h1 >Airaibi Stopovers</h1>
                                     </div>
                                     <div class="content-1">
                                     <p class="paragraph-1">Enhance your journey by adding a stopover<br>
                                        and immerse yourself in a vibrant culture,rich
                                        <br>history and divere cuisine of the indian cities
                                     </p>
                                     <button class="learn-more">Learn More</button>
                                 </div>
                                 </div>

                                 <div class="card-2">
                                     <div class="image-2">

                                           <c:url var="imageUR" value="/resources/images/download2.jpg" />
                                           <img src="<c:out value='${imageUR}' />">

                                         <h1>Baggage Information</h1>
                                     </div>
                                     <div class="content-2">
                                     <p class="paragraph-2">Explore Airaibi Airlines<br>
                                         baggage rules,weight limits<br> and charges Stay informed for a seamless journey
                                         with all the essential details you need to know
                                     </p>
                                     <button class="learn-more">Learn More</button>
                                 </div>

                                 </div>


                                 <div class="card-3">
                                     <div class="image-3">
                                     <c:url var="imageUR" value="/resources/images/images.jpg" />
                                     <img src="<c:out value='${imageUR}' />">


                                         <h1>Airport Information<h1>
                                     </div>
                                     <div class="content-3">
                                    <p>All airports information is available here</p>
                                     <button class="learn-more">Learn More</button>
                                 </div>
                                 </div>
                             </div>

                         </div>
                     </div>

                      <!-- Site footer -->
                      <footer class="site-footer">
                         <div class="container">
                           <div class="row">
                             <div class="col-sm-12 col-md-6">
                                 <h6>BOOK & MANAGE</h6>
                               <ul class="footer-links">
                                 <li><a href="http://scanfcode.com/category/c-language/">Search flights</a></li>
                                 <li><a href="http://scanfcode.com/category/front-end-development/">Manage Booking</a></li>
                                 <li><a href="http://scanfcode.com/category/back-end-development/">Flight Schedule</a></li>

                               </ul>
                             </div>

                             <div class="col-xs-6 col-md-3">
                               <h6>Prepare to travel</h6>
                               <ul class="footer-links">
                                 <li><a href="http://scanfcode.com/category/c-language/">Baggage</a></li>
                                 <li><a href="http://scanfcode.com/category/front-end-development/">Airport information</a></li>
                                 <li><a href="http://scanfcode.com/category/back-end-development/">Travek with childrens and pets</a></li>
                                 <li><a href="http://scanfcode.com/category/java-programming-language/">Visas and documents</a></li>
                                 <li><a href="http://scanfcode.com/category/android/">Medicak assistance</a></li>
                                 <li><a href="http://scanfcode.com/category/templates/">Templates</a></li>
                               </ul>
                             </div>

                             <div class="col-xs-6 col-md-3">
                               <h6>Quick Links</h6>
                               <ul class="footer-links">
                                 <li><a href="./project.html">About Us</a></li>
                                 <li><a href="http://scanfcode.com/contact/">About Air India</a></li>
                                 <li><a href="http://scanfcode.com/contribute-at-scanfcode/">Careers</a></li>
                                 <li><a href="http://scanfcode.com/privacy-policy/">Privacy Policy</a></li>
                                 <li><a href="http://scanfcode.com/sitemap/">Contact Us</a></li>
                               </ul>
                             </div>
                           </div>
                           <hr>
                         </div>
                         <div class="container">
                           <div class="row">
                             <div class="col-md-8 col-sm-6 col-xs-12">
                               <p class="copyright-text">Copyright &copy; 2023 All Rights Reserved by
                            <a href="#">Airaibi</a>.
                               </p>
                             </div>

                             <div class="col-md-4 col-sm-6 col-xs-12">
                               <ul class="social-icons">
                                 <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
                                 <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
                                 <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
                                 <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
                               </ul>
                             </div>
                           </div>
                         </div>
                       </footer>

                   </div>

                   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


                   <script>
                                      console.log("JavaScript executed.");


                                                                              $(document).ready(function() {
                                                                              // Initial content (home page div element id )
                                                                              $("#content").load("/");

                                                                              // Click event for "Manage Flight" link
                                                                              $("#manage-flight-link").click(function(e) {
                                                                                  e.preventDefault(); // Prevent the link from navigating

                                                                                  // Load "Manage Flight" content dynamically
                                                                                  $("#content").load("manage-flight-content");// url is given here
                                                                              });
                                                                               // Initial content (home page)


                                                                           //Click event for "Admin-login" link
                                                                               $("#admin-login-link").click(function(e) {
                                                                               e.preventDefault(); // Prevent the link from navigating

                                                                             //Load "Admin Login" content dynamically
                                                                               $("#content").load("admin-login-content");
                                                                              });
                                                                              });




                                                                          </script>
         </body>
         </html>




