// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
    var userAgent = navigator.userAgent.toLowerCase(); 
    $.browser.chrome = /chrome/.test(navigator.userAgent.toLowerCase());
    if(!$.browser.chrome){
	    $(".scroll").click(function(event){
		    //prevent the default action for the click event
		    event.preventDefault();

		    //get the full url - like mysitecom/index.htm#home
		    var full_url = this.href;

		    //split the url by # and get the anchor target name - home in mysitecom/index.htm#home
		    var parts = full_url.split("#");
		    var trgt = parts[1];

		    //get the top offset of the target anchor
		    var target_offset = $("#"+trgt).offset();
		    var target_top = target_offset.top;

		    //goto that anchor by setting the body scroll top to anchor top
		    $('html, body').animate({scrollTop:target_top}, 500);
	    });
    }
});


$(function(){

});

function campus_universidades_autocomplete(universidad_id, campus_input_name, campus_input_id, tema){
	
	$(universidad_id).tokenInput("/universidades.json", {
		propertyToSearch: "nombre",
		tokenLimit: 1,
        hintText: 'Teclea el nombre',
        searchingText: 'Buscando...',
        noResultsText: 'No se encontraron resultados',
		theme: tema,
		preventDuplicates: true,
		prePopulate: $(universidad_id).data("pre"),
		onAdd: function(){			
			$("#campus .token-input-list-calmecac").remove();
			$("#" + campus_input_id).tokenInput("/universidades/" + $(universidad_id).val() + "/campus.json", {
				propertyToSearch: "nombre",
				tokenLimit: 1,
                hintText: 'Teclea el nombre',
                searchingText: 'Buscando...',
                noResultsText: 'No se encontraron resultados',
				theme: tema,
				preventDuplicates: true,
				onAdd: function(){
				    $("#curso_nombre").focus();
				}
			});

			$("#token-input-"+ campus_input_id).focus();

		},
		onDelete: function(){
			var label = "<label for=\"usuario_campus_id\">Campus</label><br />";
			$("#campus .token-input-list-facebook").remove();
			
			if (window.location.pathname == "/") {
				$("div#campus").html(
					label +
					"<input type=\"text\" size=\"30\" name=\""+ campus_input_name +"\" id=\""+ campus_input_id +"\" class=\"token_field\"/>");
			} else {
				$("div#campus").html(
					label +
					"<input type=\"text\" size=\"30\" name=\""+ campus_input_name +"\" id=\""+ campus_input_id +"\" class=\"token_field-calmecac\"/>");
			}
				

					return false;
				}
			});
			
			if($("#"+campus_input_id).data("url") != ""){
				$("#"+campus_input_id).tokenInput($("#"+campus_input_id).data("url"), {
					propertyToSearch: "nombre",
					tokenLimit: 1,
                    hintText: 'Introduce una Uni',
                    searchingText: 'Introduce una Uni',
                    noResultsText: 'No se encontraron resultados',
					theme: tema,
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
   $('div#flash_notice, div#flash_error, div#flash_alert').fadeOut();
}

function display_comments(id){
	$(".calificaciones_comentarios_" + id).slideToggle("slow");
}

$(function(){
	if(window.location.pathname == "/"){
		campus_universidades_autocomplete("#universidad_id","campus_id", "campus_id", '');
	}else{
		campus_universidades_autocomplete("#universidad_id","campus_id", "campus_id", 'calmecac');
	}
	
  // envia la forma de los inputs que tenga observe
  $("input[data-observe=true]").observe_field(0.5, function(){
    $("#loading, .loading").show();
    var form = $(this).closest("form");
		var url = form.attr("action");
		var method = form.attr("method");
		var data = form.serialize();
		history.replaceState(null, document.title, url + "?" + data);
		$.ajax({
		  url: url,
		  data: data,
		  contentType : 'application/x-www-form-urlencoded',
		  dataType : "script",
      success: function(){
  			$("#loading, .loading").hide();
      }
		});
  });


  //Autocomplete para universidades y campus en registro de usuario (http://localhost:3000/usuarios/sign_up)
	campus_universidades_autocomplete("#usuario_universidad_id","usuario[campus_id]", "usuario_campus_id", '');
	
	


  //Hide flash messages
	if($("div#flash_notice") || $("div#flash_error") || $("div#flash_alert")) {
		setTimeout(hide_flash_messages, 3000); 
	}

  //Autcomplete para cursos
	$("#profesor_cursos_tokens").tokenInput("/campus/" + $("#profesor_campus_id").val() + "/cursos.json", {
		propertyToSearch: "nombre",
		theme: '',
  		hintText: 'Introduce un curso',
      searchingText: 'Introduce un curso',
      noResultsText: 'No se encontraron resultados',
		preventDuplicates: true,
		prePopulate: $("#profesor_cursos_tokens").data("pre")
	});
	

  //Cargar tabs de cursos en la vista del profesor
  $('#tabs').tabs({
    create : function(){
      $('#tabs').tabs('select', location.hash);
    }
  });

  //Cargar funcion rate
	$("input.star").rating();
	
  // genera los tooltips
	$(".tooltip").live("mouseover", function(){
      $(".tooltip").tipTip();
  });
  
  $("div.social-links").load("/share_buttons?url="+encodeURIComponent(location));

});

