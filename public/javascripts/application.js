// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var was_created = false;

$(function(){
	
	$("#usuario_universidad_id").tokenInput("/universidades.json", {
		propertyToSearch: "nombre",
		tokenLimit: 1,
		theme: 'facebook',
		preventDuplicates: true,
		onAdd: function(){
			$("#campus").slideDown();
				if(was_created == false){
					$("#usuario_campus_id").tokenInput("/universidades/" + $("#usuario_universidad_id").val() + "/campus.json", {
						propertyToSearch: "nombre",
						tokenLimit: 1,
						theme: 'facebook',
						preventDuplicates: true
					});
					was_created = true;
				}
				
				
		},
		onDelete: function(){
			$("#token-input-usuario_universidad_id").focus();
			$("#campus .token-input-list-facebook").remove();
				
			    $("div#campus").html(
	   					"<label for=\"usuario_campus_id\">Campus</label><br />"+
	   				    "<input type=\"text\" size=\"30\" name=\"usuario[campus_id]\" id=\"usuario_campus_id\" class=\"token_field\"/>");
	   				was_created = false;
			    
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
	
});