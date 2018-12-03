<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src=" https://code.jquery.com/jquery.js">
	
</script>
<script
	src=" https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js">
	
</script>
<link rel="stylesheet"
	href=" https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta http-equiv="content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/estilos.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>Interfaz de consulta de empleados del m�dulo para el
	administrador</title>
</head>

<style>

html, body {
	height: auto;
	width: 100%;
	margin: 0;
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;
}

.boton-personalizado {
	text-decoration: none;
	font-weight: 600;
	font-size: 20px;
	color: white;
	padding-top: 15px;
	padding-bottom: 15px;
	padding-left: 40px;
	padding-right: 40px;
	background-color: #FFD27D;
	border-color: #d8d8d8;
	border-width: 3px;
	border-style: solid;
	border-radius: 35px;
}

table {
	font-size: 15px;
	width: 60%;
	height: 150px;
	text-align: center;
}

</style>
<body>

	<h2 align="center">Listado de empleados</h2>
	
	<br>
	<form name="normal" method="post">
		<table align="center" border="1" id="table">
			<thead bgcolor="#FFFD86">
				<tr>
					<th width="30">DNI</th>
					<th width="30">Email</th>
					<th width="30">Nombre</th>
					<th width="30">Rol</th>
				</tr>
			</thead>
			<tbody bgcolor="#FFD27D">
				<c:forEach items="${Empleados}" var="proyecto">
					<tr>
						<td>${proyecto.dni}</td>
						<td>${proyecto.email}</td>
						<td>${proyecto.nombre}</td>
						<td>${proyecto.rol}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<input name="dni" id="dni" value="" style="display: none">
		<input name="emailEmpleado" id="email" value="" style="display: none">
		<input name="nombre" id="nombre" value="" style="display: none">
		<input name="rol" id="rol" value="" style="display: none">
		
		
		<p>
			<input type="submit" value="Dar de baja" id="consulta"
				onClick="eliminarEmpleado()" class="btn boton-personalizado"></input>
		</p>
		<p>
			<input type="submit" value="Modificar Empleado" id="consulta"
				onClick="modificar()" class="btn boton-personalizado"></input>
		</p>
		
	</form>
	
		
	
	<form action="direccionAltaEmpleado.htm" method="post" >
		<input class="btn boton-personalizado" type="submit" onClick="darAltaEmpleado()"
			name="darAltaEmpleado" value="Dar de alta" />
	</form>	
		
	
</body>
<script type="text/javascript">
	var seleccionado = null; 

	function onclickHandler() {
		if (seleccionado == this) {
			this.style.backgroundColor = "transparent";
			seleccionado = null;
		} else {
			if (seleccionado != null)
				seleccionado.style.backgroundColor = "transparent";
			this.style.backgroundColor = "#e1b";
			seleccionado = this;
		}
	}
	
	var fil = document.getElementById("table").getElementsByTagName("tr");
	for (var i = 0; i < fil.length; i++) {
		fil[i].onclick = onclickHandler;
	
	}

	function eliminarEmpleado() {
		if (seleccionado == null) {
			alert("Seleccione una fila haciendo click sobre ella");
		}
		var f = seleccionado.getElementsByTagName('td');
		var dni= f[0].textContent;
		var email= f[1].textContent;
		var nombre= f[2].textContent;
		var rol= f[3].textContent;
		
		document.getElementById("dni").value = dni;
		document.getElementById("email").value = email;
		document.getElementById("nombre").value = nombre;
		document.getElementById("rol").value = rol;
		
		document.normal.action = "eliminarEmpleado.htm";
		
	}
	
	function modificar(){
		if (seleccionado == null) {
			alert("Seleccione una fila haciendo click sobre ella");
		}
		
		var f = seleccionado.getElementsByTagName('td');
		var dni= f[0].textContent;
		var email= f[1].textContent;
		var nombre= f[2].textContent;
		var rol= f[3].textContent;
		
		document.getElementById("dni").value = dni;
		document.getElementById("email").value = email;
		document.getElementById("nombre").value = nombre;
		document.getElementById("rol").value = rol;
		
		document.normal.action = "modificarEmpleado.htm";
		
		
	}
	
	
</script>
</html>