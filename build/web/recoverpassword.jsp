<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPOLL</title>
    </head>
    <body style="color:blue;">
        <form name="form1" method="post" action="/NATPOL/recoverpwdchk.jsp" autocomplete="off">
            <table width="50%"  border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td colspan="3">Plz enter your login id to recover password....... </td>
                </tr>
                <tr>
                    <td>Login ID </td>
                    <td colspan="2">
                        <input type="text" name="id">
                    example: abc@gmail.com</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="2"> <p>
                        <select name="profile" id="profile">
		    <option value="1">user</option>
		    <option value="2">candidate</option>
		    <option value="3">eco</option>
		    </select>
	      </p></td>
                </tr>
                <tr align="center">
                    <td colspan="3"><p>
                            <input type="submit" name="Submit" value="Submit">
                            <label>          </label>
                    </p></td>
                </tr>
            </table>
        </form>
        <h1>&nbsp;</h1>




    </body>
</html>
