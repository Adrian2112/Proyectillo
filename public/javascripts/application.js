// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function campus_autocomplete(universidad_id){
	$("#profesor_campus_id").tokenInput("/universidades/" + universidad_id + "/campus.json", {
		propertyToSearch: "nombre",
		tokenLimit: 1,
		theme: 'facebook',
		preventDuplicates: true
	});
}

function campus_universidades_autoomplete(universidad_id, campus_input_name, campus_input_id){

	$("#usuario_universidad_id, #universidad_id").tokenInput("/universidades.json", {
		propertyToSearch: "nombre",
		tokenLimit: 1,
		theme: 'facebook',
		preventDuplicates: true,
		onAdd: function(){
			
			$("#campus").slideDown();
			
			$("#usuario_campus_id, #campus_id").tokenInput("/universidades/" + $(universidad_id).val() + "/campus.json", {
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
