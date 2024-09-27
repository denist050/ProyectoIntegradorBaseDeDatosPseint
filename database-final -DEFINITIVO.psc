// Subalgoritmos de menú

///SubAlgoritmo menuPrincipal///
SubAlgoritmo menuPrincipal(documento Por Referencia,nombres Por Referencia,saldo Por Referencia,activo Por Referencia,cantRegistros Por Valor)
	Definir opciones Como Entero;
	//Crea un bucle que se ejecuta hasta que el usuario selecciona la opción 6 (Terminar).
	Repetir
		
		Limpiar Pantalla;
		
		Escribir ' ____________________________________________________________________________________________________________';
		Escribir '|                                                                                                            |';
		Escribir '|     ______   ______   ______   ______  _________  ________  _________  ________   ___   __    ______       |';
		Escribir '|    /_____/\ /_____/\ /_____/\ /_____/\/________/\/_______/\/________/\/_______/\ /__/\ /__/\ /_____/\      |';
		Escribir '|    \:\ __\/ \:\ \ \ \\:\ \ \ \\:\/___/\  \::\ \    \::\ \    \::\ \   \::(_)  \ \\:. `-\  \ \\:\/___/\     |';
		Escribir '|     \:\ \___ \:\ \ \ \\:\ \ \ \\::___\/_  \::\ \   _\::\ \__  \::\ \   \:: __  \ \\:. _    \ \\_::._\:\    |';
		Escribir '|      \:\____/\\:\_\ \ \\:\/.:| |\:\____/\  \::\ \ /__\::\__/\  \::\ \   \:.\ \  \ \\. \`-\  \ \ /____\:\   |';
		Escribir '|       \_____\/ \_____\/ \____/_/ \_____\/   \__\/ \________\/   \__\/    \__\/\__\/ \__\/ \__\/ \_____\/   |';
		Escribir '|                                                                                                            |';
		Escribir '|                                           ** MENU PRINCIPAL **                                             |';
		Escribir '|____________________________________________________________________________________________________________|';
		Escribir '';
		
		Escribir '===== > Seleccione una opción < =====';
		Escribir '[1]. Consultar';
		Escribir '[2]. Ordenar';
		Escribir '[3]. Eliminar';
		Escribir '[4]. Ingresar';
		Escribir '[5]. Sobre Nosotros';
		Escribir '[6]. Terminar';
		Escribir '==============================================';
		
		Leer opciones;
		//Se utiliza para ejecutar el subalgoritmo correspondiente a la opción seleccionada por el usuario.
		Segun opciones Hacer
			1:
				//  Llama al subalgoritmo consultar para gestionar la consulta de registros.
				consultar(documento,nombres,saldo,activo,cantRegistros);
			2:
				// Llama al subalgoritmo ordenar para gestionar la ordenación de registros.
				ordenar(documento,nombres,saldo,activo,cantRegistros);
			3:
				// Llama al subalgoritmo eliminar para gestionar la eliminación de registros.
				eliminar(documento,nombres,saldo,activo,cantRegistros);
			4:
				//Llama al subalgoritmo ingresar para gestionar la creación de nuevos registros.
				ingresar(documento,nombres,saldo,activo,cantRegistros);
			5:
				// Llama al subalgoritmo sobreNosotros para mostrar información sobre los autores del sistema.
				sobreNosotros();
				
			6:
				
				Escribir 'Finalizando sesión...';
				//Se ejecuta si el usuario ingresa una opción que no está dentro del rango válido (1 a 6).
			De Otro Modo:
				
				Limpiar Pantalla;
				
				Escribir '** MENÚ PRINCIPAL **';
				Escribir 'Opción no válida!, ingrese una opción válida...';
				
				Esperar 2 Segundos;
		FinSegun
		// Hasta Que opciones=6: El bucle se repetirá hasta que el usuario ingrese la opción 6 (Terminar).
	Hasta Que opciones=6
FinSubAlgoritmo

///Subproceso para ordenar los registros///
SubAlgoritmo ordenar (documento Por Referencia,nombres Por Referencia,saldo Por Referencia,activo Por Referencia,cantRegistros Por Valor)
	Definir orden, cantReg Como Entero;
	// Verificamos posiciones llenas en el vector   
	// cantReg <- disponibilidad(documento,cantRegistros): Se llama al subalgoritmo 'disponibilidad' para obtener la cantidad de registros válidos en la base de datos. 
	cantReg <- disponibilidad(documento,cantRegistros);
	// Se ejecuta si la cantidad de registros válidos es mayor que 1.
	Si cantReg>1 Entonces
		//se ejecuta hasta que el usuario ingrese una opción válida (1 o 2).
		Repetir
			// Limpia la pantalla de la consola antes de mostrar el menú 
			Limpiar Pantalla;
			//Se llama al subalgoritmo 'menuOrdenar' para mostrar el menú de con el logo del programa.
			menuOrdenar();
			// Se muestra un mensaje al usuario indicando el orden actual de la base de datos. 
			Escribir '===== Orden actual de la base de datos =====';
			// Se llama al subalgoritmo 'listar' para mostrar la lista de registros de la base de datos.
			listar(documento,nombres,saldo,activo,cantReg);
			
			Escribir '';
			// Se muestran las opciones para el usuario en la consola. 
			Escribir 'Seleccione [1]. Para ordenar de MENOR a MAYOR por Documento';
			Escribir 'Seleccione [2]. Para ordenar de MAYOR a MENOR por Documento';
			// Se lee la opción que el usuario ha ingresado.
			Leer orden;
			// Se ejecuta si la opción ingresada por el usuario no es válida (es decir, si no corresponde a 1 o 2).
			Si orden<1 O orden>2 Entonces
				
				Escribir '';
				// mensaje de error al usuario indicando que la opción ingresada no es válida. 
				Escribir 'Opción incorrecta!, elige una opción válida...';
				
				Esperar 2 Segundos;
			FinSi
			// El bucle 'Repetir' se repetirá hasta que el usuario ingrese una opción válida (1 o 2).
		Hasta Que orden<=2
		//Se llama al subalgoritmo 'ordenados' para ordenar los registros de la base de datos según la opción seleccionada. 
		ordenados(documento,nombres,saldo,activo,cantRegistros,orden);
		
		Escribir '';
		
		Limpiar Pantalla;
		//Se llama al subalgoritmo 'menuOrdenar' para mostrar el menú con el logo del programa.
		menuOrdenar();
		// Se muestra un mensaje al usuario indicando que la base de datos ha sido ordenada. 
		Escribir '===== Base de datos Ordenada  =====';
		// Se llama al subalgoritmo 'listar' para mostrar la lista de registros de la base de datos.
		listar(documento,nombres,saldo,activo,cantReg);
		
		Escribir '';
		//Se muestra un mensaje al usuario pidiendo que presione ENTER para regresar al menú principal.
		Escribir 'Presione ENTER para volver al menú principal...';
		// Se espera a que el usuario presione ENTER.
		Esperar Tecla;
		// SiNo: Se ejecuta si la cantidad de registros válidos es menor o igual a 1.
	SiNo
		//Se ejecuta si la cantidad de registros válidos es 1.
		Si cantReg=1 Entonces
			
			Limpiar Pantalla;
			
			menuOrdenar();
			
			Escribir '===== ORDENAR BASE DE DATOS =====';
			// Se llama al subalgoritmo 'listar' para mostrar la lista de registros de la base de datos. 
			listar(documento,nombres,saldo,activo,cantReg);
			
			Escribir '';
			Escribir 'No hay suficientes registros para ordenar.';
			Escribir 'Presione ENTER para regresar al menú princial...';
			
			Esperar Tecla;
			// SiNo: Se ejecuta si la cantidad de registros válidos es 0.
		SiNo
			
			Limpiar Pantalla;
			
			menuOrdenar();
			
			Escribir '===== ORDENAR BASE DE DATOS =====';
			Escribir 'Esta base de datos no tiene registros para ordenar...';
			
			Esperar 2 Segundos;
		FinSi
	FinSi
FinSubAlgoritmo

/// SubAlgoritmo ELIMINAR///
SubAlgoritmo eliminar (documento Por Referencia,nombres Por Referencia,saldo Por Referencia,activo Por Referencia,cantRegistros Por Valor)
	Definir option, i, cantReg Como Entero;
	Definir entrada, confirmacion Como Cadena;
	Definir continuar Como Logico;
	
	// El algoritmo comienza por verificar si hay registros en la base de datos utilizando la función disponibilidad(documento, cantRegistros).
	// Se llama al subalgoritmo 'disponibilidad' para obtener la cantidad de registros válidos en la base de datos.
	cantReg <- disponibilidad(documento,cantRegistros); //Le asignamos el valor de disponibilidad, cantReg = disponibilidad y trae el total de registros.
	
	continuar <- falso; // a continuar se le da el valor de falso 
	
	Limpiar Pantalla;
	// Se ejecuta si la base de datos está vacía.
	Si cantReg=0 Entonces 
		
		menuEliminar(); // Se encarga de mostrar el logo del programa del menu eliminar. No recibe parámetros ni retorna valores.
		
		Escribir '===== ELIMINAR UN REGISTRO =====';
		Escribir 'No hay registros a eliminar. Escriba SI y presione ENTER para ingresar un nuevo registro o cualquier tecla para volver al menu principal';
		// Se lee la respuesta del usuario.
		Leer confirmacion;
		
		Limpiar Pantalla;
		//Se ejecuta si el usuario ha ingresado "si" o "SI" (sin importar mayúsculas o minúsculas). 
		Si confirmacion='si' O confirmacion='SI' Entonces 
			
			menuEliminar(); 
			
			Escribir 'Ingresando el menu creando nuevo registro...';
			
			Esperar 2 Segundos;
			
			Limpiar Pantalla;
			
			menuEliminar(); 
			//Se llama al subalgoritmo 'ingresar' para gestionar la creación de nuevos registros.
			ingresar(documento,nombres,saldo,activo,cantRegistros); // aqui llamamos al subalgoritmo ingresar con los nuevos datos que seran ingresados
			// Se establece la variable 'continuar' en verdadero para salir del subalgoritmo 'eliminar' y regresar al menú principal. 
			continuar <- Verdadero; // aqui continuar se le da el valor de verdadero para que finalicela condicion y subalgoritmo eliminar
			
		SiNo // SiNo:  Se ejecuta si el usuario no ha ingresado "si" o "SI". 
			
			menuEliminar();
			
			Escribir 'Regresando al menu principal...';
			
			Esperar 2 Segundos;
			// Se llama al subalgoritmo 'menuPrincipal' para mostrar el menú principal al usuario.
			menuPrincipal(documento,nombres,saldo,activo,cantRegistros);
			//Se establece la variable 'continuar' en verdadero para salir del subalgoritmo 'eliminar' y regresar al menú principal.
			continuar <- Verdadero;
		FinSi
	FinSi
	// en el caso de que la base de datos contenga registros comenzara esta condicion
	// mostrara un mensaje con la lista de los registros que seran llamados desde el subalgoritmo listar 
	// Se ejecuta si la variable 'continuar' es falsa (es decir, si la base de datos no está vacía y el usuario no ha decidido ingresar un nuevo registro). 
	Si continuar = falso Entonces 
		
		menuEliminar(); 
		
		Escribir '===== ELIMINAR UN REGISTRO =====';
		Escribir 'Actualmente estos son los registros de la base de datos, Ingrese el numero del registro que desea eliminar.';
		// Se llama al subalgoritmo 'listar' para mostrar la lista de registros disponibles en la base de datos.
		listar(documento,nombres,saldo,activo,cantReg);
		
		Escribir '';
		Escribir 'Para volver al menu principal, escriba la tecla S y precione ENTER';
		// Se lee la opción que el usuario ha ingresado.
		Leer entrada;
		// Si entrada='s' O entrada='S' Entonces: Se ejecuta si el usuario ha ingresado 's' o 'S' (sin importar mayúsculas o minúsculas). 
		Si entrada='s' O entrada='S' Entonces // este ciclo nos es util para volver al menu principal si el usuario no quiere eliminar registros
			
			Limpiar Pantalla;
			
			menuEliminar();
			
			Escribir 'Regresando al menu principal...';
			
			Esperar 1 Segundos;
			// Se llama al subalgoritmo 'menuPrincipal' para mostrar el menú principal al usuario.
			menuPrincipal(documento,nombres,saldo,activo,cantRegistros);
			
		FinSi
	FinSi
	
	//Se convierte la entrada del usuario (que debe ser un número) a un número entero. 
	option <- ConvertirANumero(entrada);
	// Se ajusta la opción del usuario para que coincida con el índice del arreglo (ya que los arreglos empiezan en el índice 0). 
	option <- option-1;
	// Se ejecuta si la opción ingresada por el usuario no es válida (es decir, si no corresponde a un índice válido del arreglo).
	Si option<0 O option>cantReg Entonces 
		
		Limpiar Pantalla;
		
		menuEliminar();
		
		Escribir '===== ELIMINAR UN REGISTRO =====';
		Escribir 'El registro a eliminar no existe!.. Regresando';
		
		Esperar 2 Segundos;
		
	SiNo // Se ejecuta si la opción ingresada por el usuario es válida (corresponde a un índice válido del arreglo).
		
		// Confirmación de eliminación
		Limpiar Pantalla;
		
		menuEliminar();
		Escribir '===== CONFIRMAR ELIMINACIÓN =====';
		Escribir '¿Está seguro que desea eliminar el registro?';
		Escribir ' Nombre & Apellido: ', nombres[option];
		Escribir ' DNI: ', documento[option];
		Escribir ' Saldo: ', saldo[option];
		Escribir ' Activo: ',activo[option];
		Escribir '';
		Escribir 'Escriba SI y presione ENTER para confirmar o cualquier otra tecla para cancelar.';
		//Se lee la respuesta del usuario.
		Leer confirmacion;
		//En este ciclo solo acepta el caracter si , sino repetira el mensaje
		
		
		//Se ejecuta si el usuario ha ingresado 'si' o 'SI' (sin importar mayúsculas o minúsculas).
		Si confirmacion='si' O confirmacion='SI' Entonces 
			// Se utiliza para recorrer el arreglo de registros desde el índice del registro a eliminar hasta el penúltimo registro.
			Para i<-option Hasta cantReg-2 Hacer
				// Se copian los datos del siguiente registro al actual. 
				documento[i] <- documento[i+1];
				nombres[i] <- nombres[i+1];
				saldo[i] <- saldo[i+1];
				activo[i] <- activo[i+1];
			FinPara
			// eliminamos el ultimo elemento
			documento[cantReg-1]<-0;
			nombres[cantReg-1]<-'';
			saldo[cantReg-1]<-0;
			activo[cantReg-1]<-'';
			
			Limpiar Pantalla;
			
			menuEliminar();
			
			Escribir '===== Registro eliminado con éxito. =====';
			
			Esperar 2 Segundos;
			
			//Se llama al subalgoritmo 'disponibilidad' para obtener la cantidad de registros válidos en la base de datos.
			cantReg <- disponibilidad(documento,cantRegistros);
			
			Limpiar Pantalla;
			
			menuEliminar();
			
			///**Mostrar los registros restantes:** Se muestra al usuario un mensaje confirmando que el registro se eliminó correctamente 
			///y se le presenta una lista de los registros restantes, si los hay. 
			
			
			Escribir '===== Registros restantes ====';
			//Se ejecuta si hay registros restantes. 
			Si cantReg>0 Entonces
				// Se llama al subalgoritmo 'listar' para mostrar la lista de registros restantes.
				listar(documento,nombres,saldo,activo,cantReg);
				
				Escribir '';
				Escribir 'Presione ENTER para salir';
				
				Esperar Tecla;
				
			SiNo
				
				Limpiar Pantalla;
				//Se llama al subalgoritmo 'menuEliminar' para mostrar el menú de eliminación con el logo del programa. 
				menuEliminar();
				
				Escribir '¡BUENISIMO!.. La base de datos ahora está vacía!';
				Escribir '';
				Escribir 'Presione ENTER para regresar al menú Principal';
				
				Esperar Tecla;
			FinSi
			
		SiNo// SiNo: Se ejecuta si el usuario no ha ingresado 'si' o 'SI'.
		
		Escribir '';
		Escribir 'Regresando al menu eliminar...';
		
		Esperar 1 Segundos;
		//Se llama al subalgoritmo 'eliminar' para volver a mostrar el menú de eliminación. 
		eliminar(documento,nombres,saldo,activo,cantRegistros);
	FinSi
FinSi
FinSubAlgoritmo

///Subproceso para CONSULTAR registros///
SubAlgoritmo consultar (documento Por Referencia,nombres Por Referencia,saldo Por Referencia,activo Por Referencia,cantRegistros Por Valor)
	Definir option, registro, i, cantReg Como Entero;
	Definir respuesta Como Logico;
	
	Limpiar Pantalla;
	
	menuConsultar();
	
	Escribir '===== CONSULTANDO UN REGISTRO =====';
	Escribir 'Seleccione [1]. Consultar por documento.';
	Escribir 'Seleccione [2]. Listar todos los registros.';
	Escribir 'Seleccione [3]. Salir.';
	
	Leer option;//Lee la opción que el usuario ha seleccionado.
	
	Escribir '';
	//Se crea un bucle que se repite hasta que el usuario selecciona la opción 3 (Salir).
	Repetir
		//Se utiliza para ejecutar el subalgoritmo correspondiente a la opción seleccionada por el usuario.
		Segun option Hacer
			1:
				
				Limpiar Pantalla;
				
				menuConsultar();
				
				Escribir 'Ingrese el documento a consultar';
				
				Leer registro;//Lee el documento que el usuario ha ingresado.
				
				// Se utiliza para recorrer el arreglo de documentos y comparar el documento ingresado por el usuario con cada elemento del arreglo.
				Para i<-0 Hasta cantRegistros-1 Con Paso 1 Hacer
					//Si el documento ingresado por el usuario coincide con un documento en el arreglo, se establece la variable 'respuesta' como verdadero.
					Si registro=documento[i] Entonces
						respuesta <- Verdadero;
					FinSi
				FinPara
				// Verificamos si la búsqueda arrojó algun resultado
				// Se ejecuta si la variable 'respuesta' es verdadera (es decir, si se encontró el documento en el arreglo).
				Si respuesta=Verdadero Entonces
					// Si lo encontró mostramos la información del registro
					//Se utiliza para recorrer el arreglo de documentos y mostrar la información del registro correspondiente al documento ingresado.
					Para i<-0 Hasta cantRegistros-1 Con Paso 1 Hacer
						//Se ejecuta si el documento ingresado por el usuario coincide con un documento en el arreglo.
						Si registro=documento[i] Entonces
							
							Limpiar Pantalla;
							
							menuConsultar();
							
							Escribir '===== CONSULTANDO UN REGISTRO =====';
							Escribir 'Documento: ', documento[i];
							Escribir 'Nombres: ', nombres[i];
							Escribir 'Saldo: $', saldo[i];
							Si activo[i]='1' Entonces
								Escribir 'Activo: SI';
							SiNo
								Escribir 'Activo: NO';
							FinSi
							
							Escribir '';
							Escribir 'Presione ENTER para regresar al menú principal';
							
							Esperar Tecla;
							// Se llama al subalgoritmo menuPrincipal para mostrar el menú principal al usuario.
							menuPrincipal(documento,nombres,saldo,activo,cantRegistros);
						FinSi
					FinPara
					//Se ejecuta si la variable 'respuesta' es falsa (es decir, si no se encontró el documento en el arreglo).
				SiNo
					// Se crea un bucle que se repite hasta que el usuario selecciona la opción 2 (No).
					Repetir
						
						Limpiar Pantalla;
						
						menuConsultar();
						
						Escribir '===== CONSULTANDO UN REGISTRO =====';
						Escribir 'Registro no encontrado ¿Desea registrarlo?';
						Escribir '[1]. Si';
						Escribir '[2]. No';
						// Se lee la opción que el usuario ha ingresado.
						Leer option;
						//Se utiliza para ejecutar el subalgoritmo correspondiente a la opción seleccionada por el usuario.
						Segun option Hacer
							1:
								//se llama al subalgoritmo ingresar para gestionar la creación de nuevos registros.
								ingresar(documento,nombres,saldo,activo,cantRegistros);
							2:
								
								Limpiar Pantalla;
								
								menuConsultar();
								
								Escribir '===== CONSULTANDO UN REGISTRO =====';
								Escribir 'Saliendo del proceso de consulta...';
								
								Esperar 2 Segundos;
								
							De Otro Modo:// Se ejecuta si el usuario ingresa una opción que no está dentro del rango válido (1 a 2).
								
								Escribir 'Opción incorrecta! elige una opción válida...';
								
								Esperar 2 Segundos;
						FinSegun
						
					Hasta Que option=2//El bucle se repetirá hasta que el usuario ingrese la opción 2 (No).
				FinSi
				
				option <- 3;//Se establece la variable 'option' en 3 para salir del bucle 'Repetir'.
			2:
				// Se llama al subalgoritmo 'disponibilidad' para obtener la cantidad de registros válidos en la base de datos.
				cantReg <- disponibilidad(documento,cantRegistros);
				
				Si cantReg>0 Entonces//Se ejecuta si la cantidad de registros válidos es mayor que 0.
					
					Limpiar Pantalla;
					
					menuConsultar();
					
					Escribir '===== LISTANDO TODOS REGISTROS =====';
					
					listar(documento,nombres,saldo,activo,cantReg);// Se llama al subalgoritmo 'listar' para mostrar la lista de todos los registros de la base de datos.
					
					Escribir '';
					Escribir 'Presione ENTER para continuar...';
					
					Esperar Tecla;
					
					option <- 3;//Se establece la variable 'option' en 3 para salir del bucle 'Repetir'.
					
				SiNo//Se ejecuta si la cantidad de registros válidos es 0.
				
				Limpiar Pantalla;
				
				menuConsultar();
				
				Escribir '===== LISTANDO TODOS REGISTROS =====';
				Escribir 'La base de datos está vacía!';
				Escribir '';
				
				Esperar 2 Segundos;
				
				option <- 3;//Se establece la variable 'option' en 3 para salir del bucle 'Repetir'.
			FinSi
		3:
			
			Escribir 'Regresando al menú principal...';
			Escribir '';
			
			Esperar 2 Segundos;
			
		De Otro Modo://Se ejecuta si el usuario ingresa una opción que no está dentro del rango válido (1 a 3).
			
			Limpiar Pantalla;
			
			menuConsultar();
			
			Escribir '===== LISTANDO TODOS REGISTROS =====';
			Escribir 'Opción incorrecta!, elige una opción válida...';
			Escribir '';
			
			Esperar 2 Segundos;
			
			consultar(documento,nombres,saldo,activo,cantRegistros);//Se llama al subalgoritmo 'consultar' para volver a mostrar el menú de consulta.
	FinSegun
	
Hasta Que option=3// El bucle se repetirá hasta que el usuario ingrese la opción 3 (Salir).
FinSubAlgoritmo

/// SubAlgoritmo INGRESAR///
SubAlgoritmo ingresar (documento Por Referencia,nombres Por Referencia,saldo Por Referencia,activo Por Referencia,cantRegistros Por Valor)
	Definir option, indice, cantReg, nDocumento, regVal, i Como Entero;
	Definir detener, dupliDocumento, dupliNombre, continuar Como Logico;
	Definir nNombre, salida, cadenaDocumento,cadenaSaldo Como Cadena;
	
	
	// Inicializa la variable 'detener' en falso para controlar el bucle 'Mientras'.
	detener <- falso;
	// Mientras' que se ejecuta hasta que la variable 'detener' sea verdadera.
	Mientras  NO detener Hacer 
		//Llama al subalgoritmo 'disponibilidad' para obtener la cantidad de registros válidos en la base de datos. 
		cantReg <- disponibilidad(documento,cantRegistros);
		// Se ejecuta si la cantidad de registros válidos es igual a la cantidad total de registros de la base de datos (es decir, la base de datos está llena). 
		Si cantReg = cantRegistros Entonces 
			
			Limpiar Pantalla;
			
			menuIngresar(); 
			
			Escribir '===== CREANDO NUEVO REGISTRO =====';
			Escribir 'No hay espacios libres en la base de datos...';
			Escribir '=== > ¿Desea eliminar un registro?..  ';
			Escribir '[1]. Si';
			Escribir '[2]. No';
			
			Leer option;
			// Se ejecuta si el usuario ha seleccionado la opción 1 (Si).
			Si option=1 Entonces 
				// Se llama al subalgoritmo 'eliminar' para gestionar la eliminación de registros.
				eliminar(documento,nombres,saldo,activo,cantRegistros);
				// Se llama al subalgoritmo 'disponibilidad' para obtener la cantidad de registros válidos en la base de datos después de la eliminación.
				cantReg <- disponibilidad(documento,cantRegistros);
				
				// SiNo: Se ejecuta si el usuario ha seleccionado la opción 2 (No). 
			SiNo
				//Se establece la variable 'detener' en verdadero para salir del bucle 'Mientras' y regresar al menú principal. 
				detener <- Verdadero; 
				
				Escribir 'Regresando al menú principal...';
				
				Esperar 2 Segundos;
			FinSi
		FinSi
		// Se ejecuta si la cantidad de registros válidos es menor que la cantidad total de registros de la base de datos (es decir, hay espacio disponible en la base de datos).
		Si cantReg<cantRegistros Entonces 
			
			Limpiar Pantalla;
			
			// Llama al subalgoritmo 'menuIngresar' para mostrar el menú de ingreso con el logo del programa.
			menuIngresar();
			
			Escribir '===== CREANDO NUEVO REGISTRO =====';
			// Se crea un bucle 'Repetir' que se ejecuta hasta que se ingresa un documento válido.
			Repetir
				
				//Este ciclo lo usaremos como validacion de campos
				// Se crea un bucle 'Repetir' que se ejecuta hasta que se ingresa un documento válido (solo números).
				Repetir
					
					Escribir 'Escriba el documento a registrar...';
					Escribir "(Sin puntos y sin espacios por favor)";
					
					Leer cadenaDocumento; 
					//Se verifica que cada carácter del documento sea un número. 
				Hasta Que (SubCadena(cadenaDocumento, i, 1) >= "0" y SubCadena(cadenaDocumento, i, 1) <= "9")
				//si se ingresan numeros, la variable cadenaDocumento se guarda como entero en nDocumento
				// Se ejecuta si todos los caracteres del documento son números.
				si ((SubCadena(cadenaDocumento, i, 1) >= "0" y SubCadena(cadenaDocumento, i, 1) <= "9")) Entonces
					//Se convierte el documento a un número entero. 
					nDocumento <- ConvertirANumero(cadenaDocumento);
				FinSi
				
				
				//Se llama al subalgoritmo 'validador' para verificar si el documento ya existe.
				dupliDocumento <- validador(documento,nombres,cantRegistros,nDocumento,1);
				
				Si dupliDocumento=Verdadero Entonces //Se ejecuta si el documento ya existe en la base de datos. 
					
					Escribir 'Este documento ya existe!...';
					Escribir '';
					Escribir 'Por favor, presione ENTER para ingresar otro o escriba S para regresar al menu principal...';
					
					Leer salida;
					
					Si salida='s' O salida='S' Entonces// Se ejecuta si el usuario ha escrito 's' o 'S'.
						
						Escribir '';
						Escribir 'Regresando al menu principal...';
						//Se llama al subalgoritmo 'menuPrincipal' para mostrar el menú principal al usuario.
						menuPrincipal(documento,nombres,saldo,activo,cantRegistros);
					FinSi
					//Se establece la variable 'continuar' en falso para salir del bucle 'Repetir' de la sección de validación del documento.
					continuar <- falso; 
					//Se ejecuta si el documento no existe en la base de datos.
				SiNo
					// Se crea un bucle 'Repetir' que se ejecuta hasta que se ingresa un nombre válido.
					Repetir
						
						//otro ciclo lo usaremos como validacion de campos
						// Se crea un bucle 'Repetir' que se ejecuta hasta que se ingresa un nombre válido (solo letras).
						Repetir
							
							Escribir 'Escriba Nombre & Apellido del cliente...';
							
							Leer nNombre;
							//Se verifica que cada carácter del nombre sea una letra. 
						Hasta Que (SubCadena(nNombre, i, 1) >= "a" y SubCadena(nNombre, i, 1) <= "z") o (SubCadena(nNombre, i, 1) >= "A" y SubCadena(nNombre, i, 1) <= "Z")
						
						//Se llama al subalgoritmo 'validador' para verificar si el nombre ya existe en la base de datos.
						dupliNombre <- validador(documento,nombres,cantRegistros,nNombre,2);
						
						
						Si dupliNombre=Verdadero Entonces// Se ejecuta si el nombre ya existe en la base de datos. 
							
							Escribir 'Nombre ya existe con documento diferente, ¿desea registrarlo?.';
							Escribir '1. Si';
							Escribir '2. No';
							
							Leer option;
							// Se establece la variable 'continuar' en verdadero si el usuario ha seleccionado la opción 1. Esto permite continuar con el ingreso de datos. 
							continuar <- option = 1; //si desea registrarlo con otro nombre continuara el ciclo hasta que se ingrese otro nombre o decida registrarlo con el mismo
							
							
						SiNo// Se ejecuta si el nombre no existe en la base de datos.
						
						continuar <- Verdadero;// Se establece la variable 'continuar' en verdadero para salir del bucle 
					FinSi
					// El bucle 'Repetir' se repetirá hasta que la variable 'continuar' sea verdadera (es decir, hasta que se ingrese un nombre válido o el usuario decida registrar el nuevo nombre aunque ya exista).
				Hasta Que continuar
			FinSi
			// El bucle 'Repetir' se repetirá hasta que la variable 'continuar' sea verdadera (es decir, hasta que se ingrese un documento válido y un nombre válido).
		Hasta Que continuar
		// Se asigna el índice del próximo registro disponible en la base de datos a la variable 'indice'.
		indice <- cantReg;
		// Se guarda el documento ingresado por el usuario en el arreglo 'documento' en la posición indicada por la variable 'indice'.
		documento[indice] <- nDocumento;
		// Se guarda el nombre ingresado por el usuario en el arreglo 'nombres' en la posición indicada por la variable 'indice'.
		nombres[indice] <- nNombre;
		
		// Se crea un bucle 'Repetir' que se ejecuta hasta que se ingresa un saldo válido (solo números).
		Repetir
			
			Escribir 'Escriba el saldo del cliente';
			
			Leer cadenaSaldo;
			// Se verifica que cada carácter del saldo sea un número.
		Hasta Que (SubCadena(cadenaSaldo, i, 1) >= "0" y SubCadena(cadenaSaldo, i, 1) <= "9")
		
		// Se ejecuta si todos los caracteres del saldo son números.
		si ((SubCadena(cadenaSaldo, i, 1) >= "0" y SubCadena(cadenaSaldo, i, 1) <= "9")) Entonces
			//Se convierte el saldo a un número entero.
			saldo[indice] <- ConvertirANumero(cadenaSaldo);
		FinSi
		
		// se ejecuta hasta que se ingresa un estado de actividad válido (SI o NO).
		Repetir
			
			Escribir '¿Cliente activo? Escriba SI... O NO...';
			
			Leer activo[indice];
			// Se verifica que el estado de actividad ingresado sea "SI" o "NO" (sin importar mayúsculas o minúsculas).
		Hasta Que activo[indice]='SI'O activo[indice]='NO' O activo[indice]='si'O activo[indice]='no' 
		
		// Se llama al subalgoritmo 'ordenados' para ordenar los registros de la base de datos por documento de menor a mayor.
		ordenados(documento,nombres,saldo,activo,cantRegistros,1);
		// Se llama al subalgoritmo 'disponibilidad' para obtener la cantidad de registros válidos en la base de datos después de la ordenación.
		cantReg <- disponibilidad(documento,cantRegistros);
		
		Limpiar Pantalla;
		// Se establece la variable 'detener' en falso.
		detener <- falso;
		// Llama al subalgoritmo 'menuIngresar' para mostrar el menú de ingreso con el logo del programa.
		menuIngresar();
		
		Escribir '===== REGISTRO EXITOSO =====';
		Escribir '¿Desea agregar otro registro?.. [1] = SI, [2] = NO';
		
		Leer option;
		//Se ejecuta si el usuario ha seleccionado la opción 2 (NO).
		Si option=2 Entonces
			
			detener <- Verdadero;// Se establece la variable 'detener' en verdadero para salir del bucle 'Mientras' y regresar al menú principal.
			
			Escribir 'Regresando al menú principal...';
			
			Esperar 1 Segundos;
			// Se llama al subalgoritmo 'menuPrincipal' para mostrar el menú principal al usuario.
			menuPrincipal(documento,nombres,saldo,activo,cantRegistros);
		FinSi
	FinSi
	// El bucle 'Mientras' se repetirá hasta que la variable 'detener' sea verdadera (es decir, hasta que el usuario decida no crear más registros o la base de datos esté llena).
FinMientras
FinSubAlgoritmo

// Subalgoritmos de utilidad

///función para contar las posiciones llenas en el vector///
// Objetivo: El objetivo principal del subalgoritmo es contar la cantidad de registros que realmente contienen 
//información válida en el arreglo documento, ya que es posible que algunos registros estén vacíos.
SubAlgoritmo totalRegistros <- disponibilidad (documento Por Referencia,cantRegistros Por Valor)
	Definir i, totalRegistros Como Entero;
	// Esta variable se usará para contar la cantidad de registros válidos.
	totalRegistros <- 0;
	// Verificamos posiciones llenas en el vector
	// recorre el tamaño de la base de datos que se le ha dado al comienzo en el subalgoritmo cantidadDeRegistros(cantRegistros); en busca de documentos ingresados
	// Recorre el arreglo 'documento' desde la posición 0 hasta la posición 'cantRegistros-1'. 
	Para i<-0 Hasta cantRegistros-1 Con Paso 1 Hacer 
		// Se ejecuta si el elemento actual del arreglo 'documento' es diferente de 0.
		Si documento[i]<>0 Entonces
			// Se incrementa el contador 'totalRegistros' en 1 para indicar que se encontró un registro válido.
			totalRegistros <- totalRegistros+1;
		FinSi
	FinPara
FinSubAlgoritmo

/// SUBALGORITMO PARA VALIDAR REGISTROS DUPLICADOS///
// El objetivo principal del subalgoritmo es prevenir la creación de registros duplicados en la base de datos. 
//Se utiliza para verificar si un nuevo registro, con un valor específico, ya existe dentro de la base de datos.
SubAlgoritmo duplicado <- validador(documento Por Referencia,nombres Por Referencia,cantRegistros Por Valor,regValidar Por Valor,vectorValidar Por Valor)
	Definir i Como Entero;
	Definir duplicado Como Logico;
	// Se utiliza para determinar si se debe validar el documento o el nombre, dependiendo del valor de vectorValidar.
	Segun vectorValidar Hacer
		1:
			// Recorre el arreglo 'documento' desde la posición 0 hasta la posición 'cantRegistros-1', comparando el valor 'regValidar' con cada elemento del arreglo.
			Para i<-0 Hasta cantRegistros-1 Con Paso 1 Hacer
				// Se ejecuta si el valor 'regValidar' (que es el valor que se está validando) es igual al elemento actual del arreglo 'documento'.
				Si regValidar=documento[i] Entonces
					//e establece la variable 'duplicado' en verdadero, indicando que se encontró un duplicado.
					duplicado <- Verdadero;
				FinSi
			FinPara
		2:
			//Recorre el arreglo 'nombres' desde la posición 0 hasta la posición 'cantRegistros-1', comparando el valor 'regValidar' con cada elemento del arreglo.
			Para i<-0 Hasta cantRegistros-1 Con Paso 1 Hacer
				// Se ejecuta si el valor 'regValidar' (que es el valor que se está validando) es igual al elemento actual del arreglo 'nombres'.
				Si regValidar=nombres[i] Entonces
					//Se establece la variable 'duplicado' en verdadero, indicando que se encontró un duplicado.
					duplicado <- Verdadero;
				FinSi
			FinPara
	FinSegun
FinSubAlgoritmo

// Subalgoritmos principales

SubAlgoritmo mostrarLogo
	Definir i, j, z, num_filas, num_filas2 Como Entero;
	Definir logo Como Cadena;
	// DSe crea un arreglo bidimensional llamado 'logo' que tiene 7 filas y 1 columna. Este arreglo se usará para almacenar el logo del programa.
	Dimensionar logo(7,1);
	logo[0,0]<-'     ______   ______   ______   ______  _________  ________  _________  ________   ___   __    ______       ';
	logo[1,0]<-'    /_____/\ /_____/\ /_____/\ /_____/\/________/\/_______/\/________/\/_______/\ /__/\ /__/\ /_____/\      ';
	logo[2,0]<-'    \:\ __\/ \:\ \ \ \\:\ \ \ \\:\/___/\  \::\ \    \::\ \    \::\ \   \::(_)  \ \\:. `-\  \ \\:\/___/\     ';
	logo[3,0]<-'     \:\ \___ \:\ \ \ \\:\ \ \ \\::___\/_  \::\ \   _\::\ \__  \::\ \   \:: __  \ \\:. _    \ \\_::._\:\    ';
	logo[4,0]<-'      \:\____/\\:\_\ \ \\:\/.:| |\:\____/\  \::\ \ /__\::\__/\  \::\ \   \:.\ \  \ \\. \`-\  \ \ /____\:\   ';
	logo[5,0]<-'       \_____\/ \_____\/ \____/_/ \_____\/   \__\/ \________\/   \__\/    \__\/\__\/ \__\/ \__\/ \_____\/   ';
	logo[6,0]<-'                                                                                                            ';
	
	// Se establecen dos variables 'num_filas' y 'num_filas2' para controlar la cantidad de filas que se muestran en la consola.
	num_filas <- 35;
	num_filas2 <- 15;
	
	// Este bucle 'Para' se utiliza para crear un efecto de movimiento del logo hacia arriba en la consola.
	Para z<-num_filas-1 Hasta 0 Con Paso -1 Hacer
		
		Limpiar Pantalla;
		// Espacios en blanco adicionales para que el logo se "mueva" hacia arriba
		// Para i<-1 Hasta z Con Paso 1 Hacer: Se utiliza para mostrar espacios en blanco en la consola antes del logo.
		// i: Variable que controla el número de espacios en blanco que se muestran.
		// 1: El valor inicial de i es 1.
		// z: El valor final de i es z.
		// Con Paso 1: i aumenta en 1 en cada iteración.
		Para i<-1 Hasta z Con Paso 1 Hacer
			// Escribir '': Se escribe un espacio en blanco en la consola en cada iteración del bucle.
			Escribir '';
		FinPara
		
		Para i<-0 Hasta 6 Con Paso 1 Hacer
			
			Para j<-0 Hasta 0 Con Paso 1 Hacer
				// Se muestra la línea del logo correspondiente al índice actual de la fila (i) en la consola.
				
				Escribir '', logo[i,j]Sin Saltar;
			FinPara
			
			Escribir '';
		FinPara
		
		// Esperar 90 Milisegundos: Se pausa la ejecución del programa por 90 milisegundos para crear un efecto de movimiento lento.
		Esperar 90 Milisegundos;
	FinPara
	// Esperar 0.1 Segundos: Se pausa la ejecución del programa por 0.1 segundos al final del movimiento del logo.
	Esperar 0.1 Segundos;
FinSubAlgoritmo

///////////////////////////////////////
///SubAlgoritmo cantidadDeRegistros///
SubAlgoritmo cantidadDeRegistros(cantRegistros Por Referencia)
	Definir registros como cadena;
	Definir continuar como logico;
	
	// Limpiar Pantalla: Limpia la pantalla de la consola antes de mostrar el mensaje.
	Limpiar Pantalla;
	// Repetir: Crea un bucle que se repite hasta que el usuario ingresa un valor válido para la cantidad de registros.
	Repetir
		continuar <- falso;
		Limpiar Pantalla;
		// Escribir: Muestra el logo del programa utilizando caracteres de subrayado y barras verticales.
		Escribir '     ______   ______   ______   ______  _________  ________  _________  ________   ___   __    ______       ';
		Escribir '    /_____/\ /_____/\ /_____/\ /_____/\/________/\/_______/\/________/\/_______/\ /__/\ /__/\ /_____/\      ';
		Escribir '    \:\ __\/ \:\ \ \ \\:\ \ \ \\:\/___/\  \::\ \    \::\ \    \::\ \   \::(_)  \ \\:. `-\  \ \\:\/___/\     ';
		Escribir '     \:\ \___ \:\ \ \ \\:\ \ \ \\::___\/_  \::\ \   _\::\ \__  \::\ \   \:: __  \ \\:. _    \ \\_::._\:\    ';
		Escribir '      \:\____/\\:\_\ \ \\:\/.:| |\:\____/\  \::\ \ /__\::\__/\  \::\ \   \:.\ \  \ \\. \`-\  \ \ /____\:\   ';
		Escribir '       \_____\/ \_____\/ \____/_/ \_____\/   \__\/ \________\/   \__\/    \__\/\__\/ \__\/ \__\/ \_____\/   ';
		Escribir '';
		// Escribir: Muestra un mensaje al usuario indicando que se está creando la base de datos y pide que defina la cantidad de registros.
		Escribir '===== > Creando la base de datos. < =====';
		Escribir 'La capacidad de la base de datos es de 10 registros maximos.';
		Escribir 'Defina cuantos registros tendrá la base de datos.';
		// Leer cantRegistros: Lee la cantidad de registros que el usuario ha ingresado.
		Leer registros;
		
		// Validar la cantidad de registros ingresada
		Si registros = "1" o registros = "2" o registros = "3" o registros = "4" o registros = "5" o registros = "6" o registros = "7" o registros = "8"  o registros = "9"  o registros = "10" Entonces
			// Asignar la cantidad de registros a cantRegistros
			cantRegistros <- ConvertirANumero(registros);
			// Mostrar mensaje de ingreso al menú principal
			Escribir '';
			Escribir 'Ingresando al menú principal...';
			// Esperar 2 segundos
			Esperar 2 Segundos;
			continuar <- verdadero;
		Sino
			// Mostrar mensaje de error
			Escribir 'El número ingresado supera la capacidad de la base de datos o ha ingresado un caracter, por favor intente nuevamente';
			// Esperar 2 segundos antes de volver a solicitar la cantidad de registros
			Esperar 3 Segundos;
		FinSi
	hasta que continuar = Verdadero;
FinSubAlgoritmo

///Orden general///
SubAlgoritmo ordenados (documento Por Referencia,nombres Por Referencia,saldo Por Referencia,activo Por Referencia,cantRegistros Por Valor,nOrden Por Valor)
	Definir cantReg, i, j, tmpDocumento Como Entero;
	Definir tmpSaldo Como Real; ///agregado para que el saldo pueda tener "Centavos"
	Definir tmpNombre, tmpActivo Como Cadena;
	// Se utiliza para determinar si se debe ordenar de menor a mayor o de mayor a menor, dependiendo del valor de nOrden. 
	Segun nOrden Hacer
		1:
			
			//Recorre el arreglo 'documento' desde la posición 0 hasta la posición 'cantRegistros-1', comparando cada elemento con los siguientes.
			Para i<-0 Hasta cantRegistros-1 Con Paso 1 Hacer
				//Recorre el arreglo 'documento' desde la posición 'i+1' hasta la posición 'cantRegistros-1', comparando el elemento actual con los siguientes.
				Para j<-i+1 Hasta cantRegistros-1 Con Paso 1 Hacer
					// Se ejecuta si el elemento actual del arreglo 'documento' es menor que el siguiente elemento.
					Si documento[i]<documento[j] Entonces
						// Ordenando los documentos: Se intercambian los elementos del arreglo 'documento' si el elemento actual es menor que el siguiente.
						tmpDocumento <- documento[i];
						documento[i] <- documento[j];
						documento[j] <- tmpDocumento;
						// Ordenando los nombres: Se intercambian los elementos del arreglo 'nombres' para mantener la correspondencia con los documentos.
						tmpNombre <- nombres[i];
						nombres[i] <- nombres[j];
						nombres[j] <- tmpNombre;
						// Ordenando los saldos: Se intercambian los elementos del arreglo 'saldo' para mantener la correspondencia con los documentos.
						tmpSaldo <- saldo[i];
						saldo[i] <- saldo[j];
						saldo[j] <- tmpSaldo;
						// Ordenando los activos: Se intercambian los elementos del arreglo 'activo' para mantener la correspondencia con los documentos.
						tmpActivo <- activo[i];
						activo[i] <- activo[j];
						activo[j] <- tmpActivo;
					FinSi
				FinPara
			FinPara
			
			// Se llama al subalgoritmo 'disponibilidad' para obtener la cantidad de registros válidos en la base de datos.
			cantReg <- disponibilidad(documento,cantRegistros);
			// Ordeno de Menor a Mayor unicamente los cupos que contienen datos en el vector
			// Recorre el arreglo 'documento' desde la posición 0 hasta la posición 'cantReg-1', comparando cada elemento con los siguientes. 
			Para i<-0 Hasta cantReg-1 Con Paso 1 Hacer
				//Recorre el arreglo 'documento' desde la posición 'i+1' hasta la posición 'cantReg-1', comparando el elemento actual con los siguientes.
				Para j<-i+1 Hasta cantReg-1 Con Paso 1 Hacer
					// Se ejecuta si el elemento actual del arreglo 'documento' es mayor que el siguiente elemento. 
					Si documento[i]>documento[j] Entonces
						// Ordenando los documentos: Se intercambian los elementos del arreglo 'documento' si el elemento actual es mayor que el siguiente. 
						tmpDocumento <- documento[i];
						documento[i] <- documento[j];
						documento[j] <- tmpDocumento;
						// Ordenando los nombres: Se intercambian los elementos del arreglo 'nombres' para mantener la correspondencia con los documentos.
						tmpNombre <- nombres[i];
						nombres[i] <- nombres[j];
						nombres[j] <- tmpNombre;
						// Ordenando los saldos: Se intercambian los elementos del arreglo 'saldo' para mantener la correspondencia con los documentos.
						tmpSaldo <- saldo[i];
						saldo[i] <- saldo[j];
						saldo[j] <- tmpSaldo;
						// Ordenando los activos: Se intercambian los elementos del arreglo 'activo' para mantener la correspondencia con los documentos.
						tmpActivo <- activo[i];
						activo[i] <- activo[j];
						activo[j] <- tmpActivo;
					FinSi
				FinPara
			FinPara
		2:
			// Ordeno de Mayor a menor segun la cantidad total de cupos
			//Recorre el arreglo 'documento' desde la posición 0 hasta la posición 'cantRegistros-1', comparando cada elemento con los siguientes.
			Para i<-0 Hasta cantRegistros-1 Con Paso 1 Hacer
				//Recorre el arreglo 'documento' desde la posición 'i+1' hasta la posición 'cantRegistros-1', comparando el elemento actual con los siguientes.
				Para j<-i+1 Hasta cantRegistros-1 Con Paso 1 Hacer
					// Si documento[i]<documento[j] Entonces: Se ejecuta si el elemento actual del arreglo 'documento' es menor que el siguiente elemento.
					Si documento[i]<documento[j] Entonces
						// Ordenando los documentos: Se intercambian los elementos del arreglo 'documento' si el elemento actual es menor que el siguiente.
						tmpDocumento <- documento[i];
						documento[i] <- documento[j];
						documento[j] <- tmpDocumento;
						// Ordenando los nombres: Se intercambian los elementos del arreglo 'nombres' para mantener la correspondencia con los documentos.
						tmpNombre <- nombres[i];
						nombres[i] <- nombres[j];
						nombres[j] <- tmpNombre;
						// Ordenando los saldos: Se intercambian los elementos del arreglo 'saldo' para mantener la correspondencia con los documentos.
						tmpSaldo <- saldo[i];
						saldo[i] <- saldo[j];
						saldo[j] <- tmpSaldo;
						// Ordenando los activos: Se intercambian los elementos del arreglo 'activo' para mantener la correspondencia con los documentos.
						tmpActivo <- activo[i];
						activo[i] <- activo[j];
						activo[j] <- tmpActivo;
					FinSi
				FinPara
			FinPara
	FinSegun
FinSubAlgoritmo

/// Proceso para listar todos los registros de la "base de datos"///
SubAlgoritmo listar (documento Por Referencia,nombres Por Referencia,saldo Por Referencia,activo Por Referencia,cantRegistros Por Valor)
	Definir i Como Entero;
	// Recorre el arreglo 'activo' desde la posición 0 hasta la posición 'cantRegistros-1'.
	Para i<-0 Hasta cantRegistros-1 Con Paso 1 Hacer
		//Se ejecuta si el elemento actual del arreglo 'activo' es igual a '1'. 
		Si activo[i]='si' o activo[i] = 'SI' Entonces
			//Muestra el número de registro, el DNI, el nombre, el saldo y el estado de actividad (SI) del registro actual.
			Escribir i+1, '. DNI: ', documento[i], ', Nombre & Apellido: ', nombres[i], ', Saldo: ', saldo[i], ', ¿Activo?: SI';
			// SiNo: Se ejecuta si el elemento actual del arreglo 'activo' es diferente de '1'.
		SiNo
			//Muestra el número de registro, el DNI, el nombre, el saldo y el estado de actividad (NO) del registro actual.
			Escribir i+1, '. DNI: ', documento[i], ', Nombre & Apellido: ', nombres[i], ', Saldo: ', saldo[i], ', ¿Activo?: NO';
		FinSi
	FinPara
FinSubAlgoritmo


///Funcion sobre nosotros///
SubAlgoritmo sobreNosotros
    Definir salir Como Logico;
	salir <- Falso;
	Mientras No salir Hacer
		
		
		Limpiar Pantalla;
		Escribir ' ____________________________________________________________________________________________________________';
		Escribir '|                                                                                                            |';
		Escribir '|     ______   ______   ______   ______  _________  ________  _________  ________   ___   __    ______       |';
		Escribir '|    /_____/\ /_____/\ /_____/\ /_____/\/________/\/_______/\/________/\/_______/\ /__/\ /__/\ /_____/\      |';
		Escribir '|    \:\ __\/ \:\ \ \ \\:\ \ \ \\:\/___/\  \::\ \    \::\ \    \::\ \   \::(_)  \ \\:. `-\  \ \\:\/___/\     |';
		Escribir '|     \:\ \___ \:\ \ \ \\:\ \ \ \\::___\/_  \::\ \   _\::\ \__  \::\ \   \:: __  \ \\:. _    \ \\_::._\:\    |';
		Escribir '|      \:\____/\\:\_\ \ \\:\/.:| |\:\____/\  \::\ \ /__\::\__/\  \::\ \   \:.\ \  \ \\. \`-\  \ \ /____\:\   |';
		Escribir '|       \_____\/ \_____\/ \____/_/ \_____\/   \__\/ \________\/   \__\/    \__\/\__\/ \__\/ \__\/ \_____\/   |';
		Escribir '|                                                                                                            |';
		Escribir '|                                           ** Sobre Nosotros **                                             |';
		Escribir '|____________________________________________________________________________________________________________|';
		Escribir '';
		Escribir '   |################|';
		Escribir '   |**Integrantes:**|';
		Escribir '   |################|';
		Escribir '';
		Escribir '*** Leandro Gonzalez ***';
		Escribir '*** Denis Taraborelli ***';
		Escribir '*** Martiniano Zallocco ***';
		Escribir '*** Guillermo Pacheco ***';
		Escribir '*** Cecilia Olejarczyk ***';
		Escribir '*** Martin Coria ***';
		Escribir '*** Mauro Exequiel Gonzalez ***';
		Escribir '*** Guardini Philama ***';
		Escribir '';
		Escribir Sin Saltar 'Presione ENTER para salir ';
		Esperar Tecla;
		salir <- Verdadero;
	FinMientras  
FinSubAlgoritmo





SubAlgoritmo menuOrdenar
	Escribir ' ____________________________________________________________________________________________________________';
	Escribir '|                                                                                                            |';
	Escribir '|     ______   ______   ______   ______  _________  ________  _________  ________   ___   __    ______       |';
	Escribir '|    /_____/\ /_____/\ /_____/\ /_____/\/________/\/_______/\/________/\/_______/\ /__/\ /__/\ /_____/\      |';
	Escribir '|    \:\ __\/ \:\ \ \ \\:\ \ \ \\:\/___/\  \::\ \    \::\ \    \::\ \   \::(_)  \ \\:. `-\  \ \\:\/___/\     |';
	Escribir '|     \:\ \___ \:\ \ \ \\:\ \ \ \\::___\/_  \::\ \   _\::\ \__  \::\ \   \:: __  \ \\:. _    \ \\_::._\:\    |';
	Escribir '|      \:\____/\\:\_\ \ \\:\/.:| |\:\____/\  \::\ \ /__\::\__/\  \::\ \   \:.\ \  \ \\. \`-\  \ \ /____\:\   |';
	Escribir '|       \_____\/ \_____\/ \____/_/ \_____\/   \__\/ \________\/   \__\/    \__\/\__\/ \__\/ \__\/ \_____\/   |';
	Escribir '|                                                                                                            |';
	Escribir '|                                     ** ORDENAR BASE DE DATOS **                                            |';
	Escribir '|____________________________________________________________________________________________________________|';
	Escribir '';
FinSubAlgoritmo

SubAlgoritmo menuEliminar
	Escribir ' ____________________________________________________________________________________________________________';
	Escribir '|                                                                                                            |';
	Escribir '|     ______   ______   ______   ______  _________  ________  _________  ________   ___   __    ______       |';
	Escribir '|    /_____/\ /_____/\ /_____/\ /_____/\/________/\/_______/\/________/\/_______/\ /__/\ /__/\ /_____/\      |';
	Escribir '|    \:\ __\/ \:\ \ \ \\:\ \ \ \\:\/___/\  \::\ \    \::\ \    \::\ \   \::(_)  \ \\:. `-\  \ \\:\/___/\     |';
	Escribir '|     \:\ \___ \:\ \ \ \\:\ \ \ \\::___\/_  \::\ \   _\::\ \__  \::\ \   \:: __  \ \\:. _    \ \\_::._\:\    |';
	Escribir '|      \:\____/\\:\_\ \ \\:\/.:| |\:\____/\  \::\ \ /__\::\__/\  \::\ \   \:.\ \  \ \\. \`-\  \ \ /____\:\   |';
	Escribir '|       \_____\/ \_____\/ \____/_/ \_____\/   \__\/ \________\/   \__\/    \__\/\__\/ \__\/ \__\/ \_____\/   |';
	Escribir '|                                                                                                            |';
	Escribir '|                                        ** ELIMINAR REGISTRO **                                             |';
	Escribir '|____________________________________________________________________________________________________________|';
	Escribir '';
FinSubAlgoritmo

SubAlgoritmo menuConsultar
	Escribir ' ____________________________________________________________________________________________________________';
	Escribir '|                                                                                                            |';
	Escribir '|     ______   ______   ______   ______  _________  ________  _________  ________   ___   __    ______       |';
	Escribir '|    /_____/\ /_____/\ /_____/\ /_____/\/________/\/_______/\/________/\/_______/\ /__/\ /__/\ /_____/\      |';
	Escribir '|    \:\ __\/ \:\ \ \ \\:\ \ \ \\:\/___/\  \::\ \    \::\ \    \::\ \   \::(_)  \ \\:. `-\  \ \\:\/___/\     |';
	Escribir '|     \:\ \___ \:\ \ \ \\:\ \ \ \\::___\/_  \::\ \   _\::\ \__  \::\ \   \:: __  \ \\:. _    \ \\_::._\:\    |';
	Escribir '|      \:\____/\\:\_\ \ \\:\/.:| |\:\____/\  \::\ \ /__\::\__/\  \::\ \   \:.\ \  \ \\. \`-\  \ \ /____\:\   |';
	Escribir '|       \_____\/ \_____\/ \____/_/ \_____\/   \__\/ \________\/   \__\/    \__\/\__\/ \__\/ \__\/ \_____\/   |';
	Escribir '|                                                                                                            |';
	Escribir '|                                       ** CONSULTAR REGISTRO **                                             |';
	Escribir '|____________________________________________________________________________________________________________|';
	Escribir '';
FinSubAlgoritmo

SubAlgoritmo menuIngresar
	Escribir ' ____________________________________________________________________________________________________________';
	Escribir '|                                                                                                            |';
	Escribir '|     ______   ______   ______   ______  _________  ________  _________  ________   ___   __    ______       |';
	Escribir '|    /_____/\ /_____/\ /_____/\ /_____/\/________/\/_______/\/________/\/_______/\ /__/\ /__/\ /_____/\      |';
	Escribir '|    \:\ __\/ \:\ \ \ \\:\ \ \ \\:\/___/\  \::\ \    \::\ \    \::\ \   \::(_)  \ \\:. `-\  \ \\:\/___/\     |';
	Escribir '|     \:\ \___ \:\ \ \ \\:\ \ \ \\::___\/_  \::\ \   _\::\ \__  \::\ \   \:: __  \ \\:. _    \ \\_::._\:\    |';
	Escribir '|      \:\____/\\:\_\ \ \\:\/.:| |\:\____/\  \::\ \ /__\::\__/\  \::\ \   \:.\ \  \ \\. \`-\  \ \ /____\:\   |';
	Escribir '|       \_____\/ \_____\/ \____/_/ \_____\/   \__\/ \________\/   \__\/    \__\/\__\/ \__\/ \__\/ \_____\/   |';
	Escribir '|                                                                                                            |';
	Escribir '|                                       ** CREANDO REGISTRO **                                               |';
	Escribir '|____________________________________________________________________________________________________________|';
	Escribir '';
FinSubAlgoritmo


///////////////////////
///PROCESO PRINCIPAL///
/////////////////////
Proceso BaseDeDatos
	Definir opciones, cantRegistros, regVal, documento, cantReg Como Entero;
    Definir saldo Como Real;
	Definir nombres, activo Como Cadena;
	// mostrarLogo(): Llama al subalgoritmo mostrarLogo, el cual se encarga de mostrar el logo del programa al inicio.
	mostrarLogo();
	
	// Llama al subalgoritmo cantidadDeRegistros, el cual permite al usuario definir la cantidad de registros que tendrá la base de datos.
	cantidadDeRegistros(cantRegistros);
	
	// Dimensionar documento(cantRegistros), nombres(cantRegistros), saldo(cantRegistros), activo(cantRegistros), regValidar(cantRegistros), regVal(cantRegistros):
	// Se crea un arreglo (vector) para cada tipo de dato: documento, nombres, saldo y activo. 
	// Cada arreglo tendrá la cantidad de elementos (registros) definida por el usuario en el subalgoritmo cantidadDeRegistros.
	Dimensionar documento(cantRegistros), nombres(cantRegistros), saldo(cantRegistros), activo(cantRegistros), regValidar(cantRegistros), regVal(cantRegistros);
	//Llama al subalgoritmo menuPrincipal, el cual muestra el menú principal del programa al usuario y gestiona las interacciones del usuario
	menuPrincipal(documento,nombres,saldo,activo,cantRegistros);
FinProceso








