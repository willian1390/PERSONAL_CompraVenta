$(document).ready(function () {
  $("#emp_id").select2();
  $("#suc_id").select2();

  $.post("controller/empresa.php?op=combo", { com_id: 1 }, function (data) {
    console.log(data);
    $("#emp_id").html(data);
  });
});

console.log("prueba");
