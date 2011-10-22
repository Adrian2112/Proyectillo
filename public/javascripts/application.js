// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function campus_universidades_autocomplete(universidad_id, campus_input_name, campus_input_id){

	$(universidad_id).tokenInput("/universidades.json", {
		propertyToSearch: "nombre",
		tokenLimit: 1,
		theme: 'facebook',
		preventDuplicates: true,
		onAdd: function(){
			
			$("#campus").slideDown();
			
			$("#" + campus_input_id).tokenInput("/universidades/" + $(universidad_id).val() + "/campus.json", {
				propertyToSearch: "nombre",
				tokenLimit: 1,
				theme: 'facebook',
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
				},

				onResult: function(results){
					if (results.length <= 0){
						$("#nueva_universidad_link").show("slow",function(){
							//$(this).css("float", "right");
						});
					}else{
						$("#nueva_universidad_link").slideUp(function(){

						});
						return results;
					}

				}

			});
}

function load_more(pageNo, param_q, busca) {
	pageNo = parseInt(pageNo);
  var url = '/universidades/page/';
  $.get(url + pageNo + "?" + param_q + "=" + busca );
}

//Filtro en tiempo real de la pagina root (http://localhost:3000/)
$(function(){
	campus_universidades_autocomplete("#universidad_id","campus_id", "campus_id");
	$("#curso_nombre, #profesor_nombre").bind("textchange", function(){
		$.get("/.js", {
	                            curso_nombre: $("#curso_nombre").val(),
	                            campus_id: $("#campus_id").val(),
								profesor_nombre: $("#profesor_nombre").val()
	  });
	});


//Filtro en tiempo real de profesores (http://localhost:3000/profesores)
	$("#profesor_q").bind("textchange", function(){
		$.get("/profesores.js", {profesor_q: $("#profesor_q").val()});
	});


//Filtro en tiempo real de universidades e implementacion "endless page" (http://localhost:3000/universidades)	
	$("#universidad_q").bind("textchange", function(){
		$.get("/universidades.js", {universidad_q: $("#universidad_q").val()});
	});

	$('#loadingDiv').hide()  // hide it initially
	   .ajaxStart(function() {
	       $(this).show();
	   })
	   .ajaxStop(function() {
	       $(this).hide();
	   });


//Autocomplete para universidades y campus en registro de usuario (http://localhost:3000/usuarios/sign_up)
	campus_universidades_autocomplete("#usuario_universidad_id","usuario[campus_id]", "usuario_campus_id");

});

