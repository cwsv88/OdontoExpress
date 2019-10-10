<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<title>:::Login:::</title>
</head>

<script src="js/dojo1.6.1/dojo/dojo.js" type="text/javascript"
	djConfig="parseOnLoad: true">
</script>

<script type="text/javascript">
	function login() {	
		f = document.forms[0];
		f.method ='POST';
		f.action = 'servletLogin';
		f.submit();
		window.close();		
	}
	</script>


<script type="text/javascript">
	dojo.require("dijit.form.FilteringSelect");
	dojo.require("dijit.form.Button");
	dojo.require("dijit.form.NumberTextBox");
	dojo.require("dijit.form.TextBox");
	dojo.require("dijit.form.DateTextBox");
	dojo.require("dijit.form.NumberSpinner");
	dojo.require("dijit.form.RadioButton");
	dojo.require('dijit.form.Form');
</script>

<link rel="stylesheet" type="text/css"
	href="js/dojo1.6.1/dijit/themes/claro/claro.css" />
<link rel="stylesheet" href="css/site.css" type="text/css">


<body class="claro">
	<form >
		<table style="margin: auto" border="0">
			<tr>
				<td colspan="2" align="center">
					<h3>Login</h3>
				</td>
			</tr>

			<tr>
				<td>User</td>
				<td><input dojoType="dijit.form.TextBox" name="usuario"
					size="30" maxlength="50" /></td>

			</tr>
			<tr>
				<td>Password</td>
				<td><input dojoType="dijit.form.TextBox" name="password"
					size="30" maxlength="50" type="password"/></td>

			</tr>

			<tr>
				<td colspan="5" align="center">
					<button type="type" dojoType="dijit.form.Button"
						iconClass="dijitIcon dijitIconUsers" style="width: 99px"
						onclick="javascript:login();">Send</button> 
				</td>
			</tr>

		</table>

	</form>
</body>
</html>