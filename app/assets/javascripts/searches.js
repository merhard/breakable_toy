$(function() {
  $(document).on("click", "#results th a, #results .pagination a", function() {
    $.getScript(this.href);
    return false;
  });

  $("#results_search input").keyup(function() {
    $.get($("#results_search").attr("action"), $("#results_search").serialize(), null, "script");
    return false;
  });

  $('#results_search select').change(function () {
    $.get($("#results_search").attr("action"), $("#results_search").serialize(), null, "script");
    return false;
  });
});
