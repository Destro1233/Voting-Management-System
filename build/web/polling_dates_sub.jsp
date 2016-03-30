<%@ taglib prefix="a" uri="http://jmaki/v1.0/jsp" %>
<%-- tpl:insert page="masterpage.jtpl" --%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
    <style>

        body
        {

            margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
padding: 0;
        }
    </style>

</head>
<body >


                            <font color="blue" size="6"><center><u>POLLING DATES</u></center></font><br>
                        <a:widget name="yahoo.dataTable"
    value="{columns : [
     { label : 'State Name', id : 'name'},
     { label :'Seats Available', id : 'avail'},
     { label : 'Political Party conducting Polling ', id : 'pname'},
     { label : 'Polling Dates', id : 'dates'}
     ],
     rows : [
     {name : 'Assam', avail : '126', pname: 'AGP', dates : 'September 4'},
      {name : 'TamilNadu', avail : '234', pname: 'DMK', dates : 'September 13'},
       {name : 'Kerala', avail : '140', pname: 'Left Front', dates : 'September 15'},
        {name : 'Pondicherry', avail : '30', pname: 'Congress', dates : ' September 17'},
         {name : 'West Bengal', avail : '294', pname: 'TMC', dates : 'September 18'},
          {name : 'Delhi', avail : '256', pname: 'NCT', dates : 'September 20'},
           {name : 'Mumbai', avail : '128', pname: 'CPI', dates : 'September 22'},
            {name : 'Andhra Pradesh', avail : '217', pname: 'Congress', dates : 'September 24'},
             {name : 'Karnataka', avail : '116', pname: 'Congress', dates : 'September 26'},
              {name : 'Arunachal Pradesh', avail : '120', pname: 'Congress', dates : 'September 28'},
               {name : 'Bihar', avail : '100', pname: 'Congress', dates : 'August 2'},
                {name : 'Chandigarh', avail : '106', pname: 'Congress', dates : 'August 4'},
             {name : 'Punjab', avail : '136', pname: 'Congress', dates : 'August 6'},
        {name : 'Rajasthan', avail : '106', pname: 'Congress', dates : 'August 8'},
         {name : 'Goa', avail : '196', pname: 'Congress', dates : 'August 10'},
          {name : 'Gujarat', avail : '126', pname: 'Congress', dates : 'August 10'},
           {name : 'Haryana', avail : '126', pname: 'Congress', dates : 'August 10'},
            {name : 'Himachal Pradesh', avail : '126', pname: 'Congress', dates : 'August 10'},
             {name : 'Jharkhand', avail : '126', pname: 'Congress', dates : 'August 10'},
              {name : 'Karnataka', avail : '126', pname: 'Congress', dates : 'August 10'},
               {name : 'Madhya Pradesh', avail : '126', pname: 'Congress', dates : 'August 10'}
     ]
     }" />

                      <br><br>
</html>
<%-- /tpl:insert --%>
