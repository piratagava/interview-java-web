<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<div id="formulario">
		<form id="formdata">
			<label for="nombre">Nombre: </label> 
			<input type="text" name="nombre" id="nombre" required="required"> 
			</br>
			 <label for="apellidos">Apellidos:</label>
			<input type="text" name="apellidos" id="apellidos" required="required">
			 </br> 
			 <label for="direccion">Dirección:</label>
			<input type="text" name="direccion" id="direccion" required="required">
			 </br>
			<div class="form-group">
				<label class="col-form-label">Seleccione: </label> 
				<select required="required" name="singleSelect" id="singleSelect">
					<option value="">SELECCIONE SU OCUPACION</option>
					<option value="Estudiante">Estudiante</option>
					<option value="Empleado">Empleado</option>
				</select>
			</div>

			Género:
			<div>
   				<label><input type="radio" class="form" name="tipo"  value="Masculino">Masculino</label>
			</div>
			<div>
   				<label><input type="radio" class="form" name="tipo"  value="Femenino">Femenino</label>
			</div>
			  <br>
			   <label for="mayor">Es mayor de 18 años: </label>
			 <input type="checkbox" name="mayor" id="mayor" required="required" value="si">
			
			<input type="button" id="botonenviar" value="Enviar">
		</form>
	</div>
	<div id="exito" style="display: none">Sus datos han sido
		recibidos con éxito.</div>
	<div id="fracaso" style="display: none">Se ha producido un error
		durante el envío de datos.</div>
		
		<script type="text/javascript">
		
		function validaForm(){
		    // Campos de texto
		    if($("#nombre").val() == ""){
		        alert("El campo Nombre no puede estar vacío.");
		        $("#nombre").focus();       // Esta función coloca el foco de escritura del usuario en el campo Nombre directamente.
		        return false;
		    }
		    if($("#apellidos").val() == ""){
		        alert("El campo Apellidos no puede estar vacío.");
		        $("#apellidos").focus();
		        return false;
		    }
		    if($("#direccion").val() == ""){
		        alert("El campo Dirección no puede estar vacío.");
		        $("#direccion").focus();
		        return false;
		    }

		    // Checkbox
		    if(!$("#mayor").is(":checked")){
		        alert("Debe confirmar que es mayor de 18 años.");
		        return false;
		    }
		    
		    if ($('#singleSelect').val().trim() == '') {
		    	alert("Debe Seleccionar almenos una ocupacion.");
		        return false;
		    }
		    
		    var value = $("input[type=radio][name=tipo]:checked").val();
	        if (value) {
	            return true;
	        }
	        else {
	        	  alert("Debe seleccionar su sexo");
	        	  return false;
	        }

		    return true; // Si todo está correcto
		}
		
		$(document).ready( function() {   // Esta parte del código se ejecutará automáticamente cuando la página esté lista.
		    $("#botonenviar").click( function() {     // Con esto establecemos la acción por defecto de nuestro botón de enviar.
		        if(validaForm()){    		        	
		        	var nombreCliente = document.getElementById("nombre").value;
		        	var apellido = document.getElementById("apellidos").value;
		        	var direccion = document.getElementById("direccion").value;		        	
		        	var obtengoOcupacion =  document.getElementById('singleSelect').value;
		        	var value = $("input[type=radio][name=tipo]:checked").val();		        	
		        	var mayorEdad = $("input[type=checkbox][name=mayor]:checked").val();
		             
		        	 var objeto = {nombre:nombreCliente, apellidos:apellido, direccion:direccion,ocupacion:obtengoOcupacion,
		        			 sexo:value, mayoredad:mayorEdad};
		        	 		        	 
		             $.ajax({
		                 type: 'post',
		                 url: 'datos',
		                 data: JSON.stringify(objeto),
		                 contentType: "application/json; charset=utf-8",
		                 traditional: true,
		                 success: function (data) {
		                     alert("Nombre: " +data.nombre + " Apellidos: " +data.apellidos + " Direccion: " +
		                    		 data.direccion + " Ocupacion: " + data.ocupacion + " Sexo: " + data.sexo + 
		                    		 " Es Mayor de edad:"+ data.mayoredad);
		                 }
		             });		        	 
		       }
		    });    
		});
		
		</script>
</body>
</html>