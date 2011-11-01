// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery.fn.reset = function () {
  $(this).each (function() { this.reset(); });
}

function campus_universidades_autocomplete(universidad_id, campus_input_name, campus_input_id){
	
	$(universidad_id).tokenInput("/universidades.json", {
		propertyToSearch: "nombre",
		tokenLimit: 1,
		//theme: 'facebook',
		preventDuplicates: true,
		prePopulate: $(universidad_id).data("pre"),
		onAdd: function(){			
			$("#campus .token-input-list").remove();
			$("#" + campus_input_id).tokenInput("/universidades/" + $(universidad_id).val() + "/campus.json", {
				propertyToSearch: "nombre",
				tokenLimit: 1,
				//theme: 'facebook',
				preventDuplicates: true
			});

			$("#token-input-"+ campus_input_id).focus();

		},
		onDelete: function(){
			$("#campus .token-input-list-facebook").remove();
				$("div#campus").html(
					"<label for=\"usuario_campus_id\">Campus</label><br />"+
					"<input type=\"text\" size=\"30\" name=\""+ campus_input_name +"\" id=\""+ campus_input_id +"\" class=\"token_field\"/>");

					return false;
				}
			});
			
			if($("#"+campus_input_id).data("url") != ""){
				$("#"+campus_input_id).tokenInput($("#"+campus_input_id).data("url"), {
					propertyToSearch: "nombre",
					tokenLimit: 1,
					//theme: 'facebook',
					preventDuplicates: true,
					prePopulate: $("#"+campus_input_id).data("pre")
				});
			}
}

/*
	page_num = numero de la pagina que se mostrara
	params = hashmap del tipo { parametro que lee servidor : id html para sacar la informacion }
	url = la url a donde se mandara hara el request
*/
function load_more(page_num, params, url) {
	$("#loading").show();
	pageNo = parseInt(page_num);
	var params_enviar = new Object();
	
	// crea un los parametros con la informacion de los ids de html
	$.each( params, function(k, v){
	   params_enviar[k] = $("#"+v).val();
	 });
	
  $.get(url, params_enviar, function(){
		$("#loading").hide();
		}
	);
}

function cargar_curso_profesor(profesor_id, curso_id){
	var url = '/curso_profesor/' + profesor_id + "/" + curso_id + ".js";
	$("#loading").show();
	$.get(url).complete(function(){
		$("#curso_profesor_" + curso_id + "_" + profesor_id).fadeIn("slow");
		$("#loading").hide();
	});
}

function hide_flash_messages() {
   $('div#flash_notice, div#flash_error').fadeOut();
}

//Filtro en tiempo real de la pagina root (http://localhost:3000/)
$(function(){
	campus_universidades_autocomplete("#universidad_id","campus_id", "campus_id");
	
	$("#curso_nombre, #profesor_nombre").observe_field(0.5, function(){
		history.replaceState(null, document.title,
										$("#busqueda_general").attr("action") + "?" + $("#busqueda_general").serialize());
		$.get("/.js", {
	                            curso_nombre: $("#curso_nombre").val(),
	                            campus_id: $("#campus_id").val(),
								profesor_nombre: $("#profesor_nombre").val()
	  });
	});


//Filtro en tiempo real de profesores (http://localhost:3000/profesores)
	$("#profesor_q").observe_field(0.5, function(){
		$("#loading, .loading").show();
		$.get("/profesores.js", { profesor_q: $("#profesor_q").val() }, function(){
			$("#loading, .loading").hide();
		});
	});


//Filtro en tiempo real de universidades e implementacion "endless page" (http://localhost:3000/universidades)	
	$("#universidad_q").observe_field(0.5, function(){
		$("#loading").show();
		$.get("/universidades.js", { universidad_q: $("#universidad_q").val() }, function(){
			$("#loading").hide();
		});
	});


//Autocomplete para universidades y campus en registro de usuario (http://localhost:3000/usuarios/sign_up)
	campus_universidades_autocomplete("#usuario_universidad_id","usuario[campus_id]", "usuario_campus_id");


//Hide flash messages
	if($("div#flash_notice") && $("div#flash_error")) {
		setTimeout(hide_flash_messages, 3000); 
	}

//Autcomplete para cursos
	$("#profesor_cursos_tokens").tokenInput("/campus/" + $("#profesor_campus_id").val() + "/cursos.json", {
		propertyToSearch: "nombre",
		theme: 'facebook',
		preventDuplicates: true,
		prePopulate: $("#profesor_cursos_tokens").data("pre")
	});
	
});
