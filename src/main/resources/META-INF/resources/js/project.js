
$(document).ready(function() {

  // spam protection for mails
  $('span.madress').each(function(i) {
      var text = $(this).text();
      var address = text.replace(" [at] ", "@");
      $(this).after('<a href="mailto:'+address+'">'+ address +'</a>')
      $(this).remove();
  });

  // activate empty search on start page
  $("#project-searchMainPage").submit(function (evt) {
    $(this).find(":input").filter(function () {
          return !this.value;
      }).attr("disabled", true);
    return true;
  });

  // open search bar
  $( ".js-search-toggler" ).click(function() {
    if ( $( ".search-bar" ).hasClass('open') ) {
      $( ".search-bar" ).removeClass('open');
    } else {
      $( ".search-bar" ).addClass('open');
      $( "#searchbar" ).focus();
    }
  });

  // replace placeholder USERNAME with username
  var userID = $("#currentUser strong").html();
  var newHref = 'https://reposis-test.gbv.de/PROJECT/servlets/solr/select?q=createdby:' + userID + '&fq=objectType:mods';
  $("a[href='https://reposis-test.gbv.de/PROJECT/servlets/solr/select?q=createdby:USERNAME']").attr('href', newHref);

});

$( document ).ajaxComplete(function() {
  // remove series and journal as option from publish/index.xml
  $("select#genre option[value='series']").remove();
  $("select#genre option[value='journal']").remove();
});