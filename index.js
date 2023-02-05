console.log("prueba");
$(document).ready(function () {
  $.POST("/controller/empresa.php?op=combo", { com_id: 1 }, function (data) {
    $("#emp_id").html(data);
  });
});
