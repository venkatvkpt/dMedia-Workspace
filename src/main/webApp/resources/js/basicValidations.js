
//basicValidations.js not allowing unnecessary things.use class attribute in html as this names
//only-numbers , decimal-numbers , only-letters 


//This is for allow only numbers
$('.only-numbers,.mobilenumber,.age').keyup(function(e){
   if (/\D/g.test(this.value)){
     // Filter non-digits from input value.
     this.value = this.value.replace(/\D/g, '');
    }
});


//This is for allow decimal number (like 10.9 ,numbers with dot)
$(".decimal-numbers").keydown(function (event) {
    if (event.shiftKey == true) {
       event.preventDefault();
     }
    if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) || event.keyCode == 8 || 
    	event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46 || event.keyCode == 190) {
    } else {
       event.preventDefault();
    }
	if($(this).val().indexOf('.') !== -1 && event.keyCode == 190)
       event.preventDefault();
});


//Allows Alphabetics (letters) only
$(".only-letters,only-alphabetics").on("input", function(){
    var regexp = /[^a-zA-Z]/g;
    if($(this).val().match(regexp)){
      $(this).val( $(this).val().replace(regexp,'') );
    }
});

