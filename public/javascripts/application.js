// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
	
	$("#usuario_universidad_id").tokenInput("/universidades.json", {
		propertyToSearch: "nombre",
		tokenLimit: 1,
		theme: 'facebook',
		preventDuplicates: true,
		onAdd: function(){
			$("#usuario_campus_id").tokenInput("/campus_universidades/"+ $("#usuario_universidad_id").val() +".json", {
				propertyToSearch: "nombre",
				tokenLimit: 1,
				theme: 'facebook',
				preventDuplicates: true
			});
		}
	});

	
	

});