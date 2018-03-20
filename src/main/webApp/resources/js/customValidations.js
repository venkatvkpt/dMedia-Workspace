$(document).ready(function(){	
    $("select").change(function(){
        $('#valid-msg').hide(); 
    });
});

$('#customValidations').validate({
	ignore: [],
    rules: {
	      email_id: {
	        email: true,
	        required: true,
	      },
	      service_name: {
	        required: true
	      },
	      mobile_number: {
	        number: true,
	        required: true,
	        phoneUS: true,
	        minlength: 10,
	        maxlength: 10
	      }
    },
	messages: {
   		SelectName: { valueNotEquals: "Please select an item!" }
  }  

});

	/*its mainly used for SELECT tag requried value*/
	function customValidations(){		
		if($('.valid-requried')){
			var select=$('.valid-requried').val();
			$('#valid-msg').hide();			
			$( ".valid-requried" ).after( "<span class='error' id='valid-msg'></span>" );		
			if (select === "S" ||  select=="S" || select=="" || select==="" ){
				$('#valid-msg').html("<span style='color:red'> Please select an option.</span>");
				return false;
			}else{
				$('#valid-msg').hide();
				return true;
			}							
		}	
	}
	