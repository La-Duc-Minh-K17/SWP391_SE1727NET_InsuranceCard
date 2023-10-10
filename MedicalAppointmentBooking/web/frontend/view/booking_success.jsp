<%-- 
    Document   : booking_success
    Created on : Oct 10, 2023, 10:36:47 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="back-to-home rounded d-none d-sm-block">
            <a href="index.html" class="btn btn-icon btn-primary"><i data-feather="home" class="icons"></i></a>
        </div>
        
       
        <section class="bg-home d-flex bg-light align-items-center" style="background: url('../assets/images/bg/bg-lines-one.png') center;">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 ">
                        <div class="text-center">
                            <div class="features feature-primary text-center">
                                <div class="icon text-center rounded-circle mx-auto" style="height: 90px; width:90px;">
                                    <i class="uil uil-thumbs-up h1 mb-0"></i>
                                </div>
                            </div>
                            <h1 class="my-4  text-primary font-weight-bold">Thank you for using our services</h1>
                            <p class=" h5 text-success">Your appointment has been added to waiting list.</p>
                            <p class=" h5 text-success  ">We will inform you soon. </p>
                            <p class=" h5 text-success  "> Please check your email to get more information. </p>
                            <a href="" class="btn btn-soft-primary mt-3">Go To Home</a>
                        </div><!---->
                    </div> 
                </div>
            </div> 
        </section>
         <jsp:include page="/frontend/common/footer.jsp" />
        </body>
    </html>
