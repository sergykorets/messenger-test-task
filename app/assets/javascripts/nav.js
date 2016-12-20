$(document).ready(
    function() {
      setInterval(function() {
        $('#refresh').load('/application/refresh_nav');
    }, 60000);
});