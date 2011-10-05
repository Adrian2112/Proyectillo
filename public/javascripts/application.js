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
			$("div#campus").slideDown(function(){
				if (was_created == false){
					$("#usuario_campus_id").tokenInput("/universidades/" + $("#usuario_universidad_id").val() + "/campus.json", {
						propertyToSearch: "nombre",
						tokenLimit: 1,
						theme: 'facebook',
						preventDuplicates: true
					});
					was_created = true;
				}
			});
		},
		onDelete: function(){
			$("#usuario_campus_id").tokenInput("clear");
			$("#token-input-usuario_universidad_id").focus();
			return false;
			//$("div#campus").slideUp(function(){
			//				$("div#campus").html(
			//					"<label for=\"usuario_campus_id\">Campus</label><br />"+
			//					"<input type=\"text\" size=\"30\" name=\"usuario[campus_id]\" id=\"usuario_campus_id\">");
			//				was_created = false;
			//			});
			
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