$(function() {

  function getURLParameters(url){
    var result = {};
    var searchIndex = url.indexOf("?");
    if (searchIndex == -1 ) return result;
    var sPageURL = url.substring(searchIndex +1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
      var sParameterName = sURLVariables[i].split('=');
      result[sParameterName[0]] = sParameterName[1];
    }
    return result;
  }

  var sort_param;

  $(document).on("click", "#results th a, #results .pagination a", function() {
    $.getScript(this.href);
    sort_param = getURLParameters(this.href)['q%5Bs%5D'];
    return false;
  });

  $("#results_search input").keyup(function() {
    $.get($("#results_search").attr("action"), $("#results_search").serialize().concat('&q%5Bs%5D=').concat(sort_param), null, "script");
    return false;
  });

  $('#results_search select').change(function () {
    $.get($("#results_search").attr("action"), $("#results_search").serialize().concat('&q%5Bs%5D=').concat(sort_param), null, "script");
    return false;
  });

  $(document).ready(function() {
    $('#buttonId').hide();
  });

});
