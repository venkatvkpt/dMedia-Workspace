/*Table search by using jQuery ver above 1.9.1
Rqruriments:
For <input> '#search' and For <table> '.table-search' 
Table must contain THEADER and TBODY

If Second search Requried Use this
Rqruriments:
For <input> '#search2' and For <table> '.table-search2' 
Table must contain THEADER and TBODY
*/

$(document).ready(function() {
    var activeSystemClass = $('.list-group-item.active');

    //something is entered in search form
    $('#search').keyup( function() {
       var that = this;
        // affect all table rows on in systems table
        var tableBody = $('.table-search tbody');
        var tableRowsClass = $('.table-search tbody tr');
        $('.search-sf').remove();
        tableRowsClass.each( function(i, val) {
        
            //Lower text for case insensitive
            var rowText = $(val).text().toLowerCase();
            var inputText = $(that).val().toLowerCase();
            if(inputText != '')
            {
                $('.search-query-sf').remove();
                tableBody.prepend('<tr class="search-query-sf"><td colspan="15"><strong>Searching for: "'
                    + $(that).val()
                    + '"</strong></td></tr>');
            }
            else
            {
                $('.search-query-sf').remove();
            }

            if( rowText.indexOf( inputText ) == -1 )
            {
                //hide rows
                tableRowsClass.eq(i).hide();
                
            }
            else
            {
                $('.search-sf').remove();
                tableRowsClass.eq(i).show();
            }
        });
        //all tr elements are hidden
        if(tableRowsClass.children(':visible').length == 0)
        {
            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="15">No entries found.</td></tr>');
        }
    });
    
    
   
    
});


 //something is entered in second search form
    $('#search2').keyup( function() {
       var that = this;
        // affect all table rows on in systems table
        var tableBody = $('.table-search2 tbody');
        var tableRowsClass = $('.table-search2 tbody tr');
        $('.search-sf2').remove();
        tableRowsClass.each( function(i, val) {
        
            //Lower text for case insensitive
            var rowText = $(val).text().toLowerCase();
            var inputText = $(that).val().toLowerCase();
            if(inputText != '')
            {
                $('.search-query-sf2').remove();
                tableBody.prepend('<tr class="search-query-sf2"><td colspan="15"><strong>Searching for: "'
                    + $(that).val()
                    + '"</strong></td></tr>');
            }
            else
            {
                $('.search-query-sf2').remove();
            }

            if( rowText.indexOf( inputText ) == -1 )
            {
                //hide rows
                tableRowsClass.eq(i).hide();
                
            }
            else
            {
                $('.search-sf2').remove();
                tableRowsClass.eq(i).show();
            }
        });
        //all tr elements are hidden
        if(tableRowsClass.children(':visible').length == 0)
        {
            tableBody.append('<tr class="search-sf2"><td class="text-muted" colspan="15">No entries found.</td></tr>');
        }
    });