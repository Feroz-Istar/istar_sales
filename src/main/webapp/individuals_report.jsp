<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta charset="utf-8">
      <meta name="viewport"
         content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Insert title here</title>
      <jsp:include page="inc/head.jsp"></jsp:include>
      <title>Insert title here</title>
      <style type="text/css">
         .tree1.li.
      </style>
   </head>
   <body>
      <jsp:include page="inc/nav.jsp"></jsp:include>
      <div class="container mt-4">
         <div class="d-flex flex-row">
            <i class="material-icons md-48 align-self-center mr-3 theme-color">arrow_back</i>
            <div class="font-32">Yogesh Jain</div>
         </div>
         <h6 class="p-2 pl-3 mt-3 font-18 text-muted">Performance</h6>
         <div class="card mb-3">
            <div class="row p-2 m-2">
               <div class="col-12 d-flex ">
                  <div class="col-md-2 pl-0 pr-0 align-self-center">
                     <div
                        class="d-flex flex-column border border-light-gray text-center">
                        <div class=" pt-4">
                           <i class="material-icons md-36 color-sky">phone_forwarded</i>
                        </div>
                        <div class="  font-weight-bold ">
                           <h3>230</h3>
                        </div>
                        <div class=" pb-4">
                           <h4 class="font-14 text-muted">Calls</h4>
                           <div class="d-flex justify-content-center">
                              <i class="material-icons font-20">arrow_upward</i>
                              <div class="font-14">10% Last Week</div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2 pl-0 pr-0 align-self-center">
                     <div
                        class="d-flex flex-column border border-light-gray text-center">
                        <div class=" pt-4">
                           <i class="material-icons md-36 color-sky">mail_outline</i>
                        </div>
                        <div class="  font-weight-bold ">
                           <h3>230</h3>
                        </div>
                        <div class=" pb-4">
                           <h4 class="font-14 text-muted">Meeting</h4>
                           <div class="d-flex justify-content-center">
                              <i class="material-icons font-20">arrow_downward</i>
                              <div class="font-14">10% Last Week</div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2 pl-0 pr-0 align-self-center">
                     <div
                        class="d-flex flex-column border border-light-gray text-center">
                        <div class=" pt-4">
                           <i class="material-icons md-36 color-sky">tv</i>
                        </div>
                        <div class="  font-weight-bold ">
                           <h3>230</h3>
                        </div>
                        <div class=" pb-4">
                           <h4 class="font-14 text-muted">Presentation</h4>
                           <div class="d-flex justify-content-center">
                              <i class="material-icons font-20">arrow_upward</i>
                              <div class="font-14">10% Last Week</div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2 pl-0 pr-0 align-self-center">
                     <div
                        class="d-flex flex-column border border-light-gray text-center">
                        <div class=" pt-4">
                           <i class="material-icons md-36 color-sky">mail_outline</i>
                        </div>
                        <div class="  font-weight-bold ">
                           <h3>230</h3>
                        </div>
                        <div class=" pb-4">
                           <h4 class="font-14 text-muted">Emails</h4>
                           <div class="d-flex justify-content-center">
                              <i class="material-icons font-20">arrow_downward</i>
                              <div class="font-14">10% Last Week</div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2 pl-0 pr-0 align-self-center">
                     <div
                        class="d-flex flex-column border border-light-gray text-center">
                        <div class=" pt-4">
                           <i class="material-icons md-36 color-sky">tv</i>
                        </div>
                        <div class="  font-weight-bold ">
                           <h3>230</h3>
                        </div>
                        <div class=" pb-4">
                           <h4 class="font-14 text-muted">Webinar</h4>
                           <div class="d-flex justify-content-center">
                              <i class="material-icons font-20">arrow_upward</i>
                              <div class="font-14">10% Last Week</div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2 pl-0 pr-0 align-self-center"></div>
               </div>
            </div>
         </div>
         <div class="card m-4 p-4 " style="background: #e8e8e8 !important">
            <h4 class="font-20 text-muted font-weight-bold mb-3">MASTERY
               LEVEL PER SKILL
            </h4>
            <div class="d-flex">
               <div class="small-square align-self-center ml-2 mr-2"
                  style="background: #bae88a;"></div>
               <div class="mr-3">Wizard</div>
               <div class="small-square align-self-center ml-2 mr-2"
                  style="background: #7295fd;"></div>
               <div class="mr-3">Master</div>
               <div class="small-square align-self-center ml-2 mr-2"
                  style="background: #fd6d81;"></div>
               <div class="mr-3">Apprentice</div>
               <div class="small-square align-self-center ml-2 mr-2"
                  style="background: #30beef;"></div>
               <div class="mr-3">Rookie</div>
            </div>
            <ul id="tree1">
            <%for(int i=0;i<10;i++){ %>
               <li class="bg-white p-2 m-2">
               		<a href="#">
                  <div class="row d-flex" style="margin-top:-40px;margin-left:40px;">
                     <div class="col-md-3 d-flex flex-column">
                        <p class="mb-0 font-weight-bold theme-text">Calls</p>
                        <p class="mb-0 font-weight-bold theme-color">Average 78%</p>
                     </div>
                     <div class="col-md-9 d-flex flex-column">
                        <div class="progress w-100 h-50">
                           <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
                        </div>
                        <div class="align-self-center theme-text">70%</div>
                     </div>
                  </div>
                  </a>
                  <ul>
                  <%for(int j=0;j<10;j++){ %>
                    <li class="">
                  <div class="row " style="margin-top:20px;">
                     <div class="col-md-3 text-center">
                        <p class="mb-0 theme-text">Calls</p>
                     </div>
                     <div class="col-md-9 ">
                        <div class="progress w-100 h-25">
                           <div class="progress-bar bg-success" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
                        </div>
                        <div class="text-center theme-text">70%</div>
                     </div>
                  </div>
                  </li>
                  <%} %>
                  </ul>
               </li>
               <%} %>
            </ul>
         </div>
      </div>
      <jsp:include page="inc/foot.jsp"></jsp:include>
   </body>
</html>