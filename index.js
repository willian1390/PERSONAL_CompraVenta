$(document).ready(function () {
  var com_id = getUrlParameter("c");
  console.log(com_id);

  $("#emp_id").select2();
  $("#suc_id").select2();

  $.post(
    "controller/empresa.php?op=combo",
    { com_id: com_id },
    function (data) {
      console.log(data);
      $("#emp_id").html(data);
    }
  );

  $("#emp_id").change(function () {
    $("#emp_id").each(function () {
      emp_id = $(this).val();
      console.log(emp_id);

      $.post(
        "controller/sucursal.php?op=combo",
        { emp_id: emp_id },
        function (data) {
          console.log(data);
          $("#suc_id").html(data);
        }
      );
    });
  });
});

/* TODO: Obtener parametro de URL */
var getUrlParameter = function getUrlParameter(sParam) {
  var sPageURL = decodeURIComponent(window.location.search.substring(1)),
    sURLVariables = sPageURL.split("&"),
    sParameterName,
    i;

  for (i = 0; i < sURLVariables.length; i++) {
    sParameterName = sURLVariables[i].split("=");

    if (sParameterName[0] === sParam) {
      return sParameterName[1] === undefined ? true : sParameterName[1];
    }
  }
};
/* console.log("prueba"); */
