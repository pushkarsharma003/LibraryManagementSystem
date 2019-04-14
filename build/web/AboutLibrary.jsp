<%-- 
    Document   : AboutLibrary
    Created on : Apr 13, 2019, 10:25:33 PM
    Author     : PushkarSharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="UserNavbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>About Library</title>
        <style>
            .AboutMain{
                margin-left:15%;
                margin-right:15%;
                text-align: justify;
            }
        </style>
    </head>
    <body>
         <% 
        if(session.getAttribute("username")==null && session.getAttribute("userid")==null){
            response.sendRedirect("UserLogin.jsp");
        }  
    %>
    <div class="AboutMain">
        <br>
            <img src="images/Aboutlibrary.jpg" height="600px" width="100%"><br>
            <h2 style="font-family: cursive;">About University</h2>
            <p>
            <c style="font-size: 25px;">C</c>hitkara University, Himachal Pradesh is a private university located at the HIMUDA 
            Education Hub, near the village Kallujhanda, Solan district, Himachal Pradesh, India. 
            The university was established in 2009 by the Chitkara Educational Trust through the 
            Chitkara University (Establishment and Regulation) Act, 2008. Chitkara Educational Trust, 
            founded by <b>Dr. Ashok K. Chitkara</b> and <b>Dr. Madhu Chitkara</b>, who serve as the institute's Chancellor 
            and Pro-chancellor respectively, has also set up Chitkara University, Punjab.
            </p>
            <p>
                Like all universities in India, Chitkara University, Himachal Pradesh is recognised 
                by the University Grants Commission (UGC), which has also sent an expert committee. 
                The UGC states that "University to take corrective measures in respect of the suggestions 
                of the UGC inspection committee and approach UGC after two years". The university is 
                accredited by the National Assessment and Accreditation Council (NAAC) with a score of 
                2.71 out of 4 and a "B" grade. The university is also a member of the Association of 
                Indian Universities (AIU).
            </p>
            <h2 style="font-family: cursive;">Library Rules</h2>
            <p>
            <u>General Rules:</u><br><br>
            &#8226; Identity Card is compulsory for getting access to the library.<br>
            &#8226; Silence to be maintained.<br>
            &#8226; No discussion permitted inside the library.<br>
            &#8226; Registration should be done to become a library member prior to using the library resources.<br>
            &#8226; No personal belongings allowed inside the library.<br>
            &#8226; Textbooks, printed materials and issued books are not allowed to be taken inside the library.<br>
            &#8226; Using Mobile phones and audio instruments with or without speaker or headphone is strictly prohibited in the library premises.<br>
            &#8226; Enter your name and Sign in the register kept at the entrance counter before entering library.<br>
            &#8226; Show the books and other materials which are being taken out of the library to the staff at the entrance counter.<br>
            &#8226; The librarian may recall any book from any member at any time and the member shall return the same immediately.<br>
            &#8226; Library borrower cards are not transferable. The borrower is responsible for the books borrowed on his/her card.<br>
            &#8226; Refreshment of any kind shall not be taken any where in the library premises.<br>
            </p>
            <p>
            <u>Working Hours of the Library:</u><br><br>
            &#8226; Monday to Friday 8 am to 9 pm (During Examination up to 10 PM)<br>
            &#8226; Saturday 8 am to 5 pm<br>
            &#8226; Sundays 9 am to 5 pm (During Examination Time)<br>
            </p>
            <p>
            <u>Overdue Charges:</u><br><br>
            Materials borrowed should be returned on or before the due date stamped, if returned late overdue fine of Rs. 2 will be charged for the delayed period.
            </p>
            <p>
                <u>Book Lost:</u><br><br>
                If the books are lost, Then the borrower shall replace the books of the same edition or latest edition or pay double cost of the book after getting permission from the librarian.
            </p>
        </div>
    </body>
</html>
