<?php
/* TODO: LLAMANDO CLASE */
  require_once("../config/conexion.php");
  require_once("../models/Usuario.php");

/* TODO: Inicializando clase */
  $usuario = new Usuario();

  switch ($_GET["op"]) {
   /*  TODO: Guardar y editar, guardar cuando el id este vacio y actualizar cuando se envie el id */
    case 'guardaryeditar':
      if (empty ($_POST["usu_id"])) {
        $usuario->insert_usuario(
          $_POST["suc_id"], 
          $_POST["rol_id"],
          $_POST["usu_nom"],
          $_POST["usu_correo"],
          $_POST["usu_ape"],
          $_POST["usu_dpi"],
          $_POST["usu_tel"],
          $_POST["usu_pass"]);
      }else{
        $usuario->update_usuario(
          $_POST["usu_id"],
          $_POST["suc_id"], 
          $_POST["rol_id"],
          $_POST["usu_nom"],
          $_POST["usu_correo"],
          $_POST["usu_ape"],
          $_POST["usu_dpi"],
          $_POST["usu_tel"],
          $_POST["usu_pass"]);
      }
      break;
    
    /* TODO: Listado de registros formato JSON para datatable JS*/
    case "listar":
      $datos = $usuario->get_usuario_x_suc_id($_POST["suc_id"]);
      $data=Array();
      foreach($datos as $row){
        $sub_array = array();
        $sub_array = $row["rol_id"];
        $sub_array = $row["usu_nom"];
        $sub_array = $row["usu_correo"];
        $sub_array = $row["usu_ape"];
        $sub_array = $row["usu_dpi"];
        $sub_array = $row["usu_tel"];
        $sub_array = $row["usu_pass"];


        $sub_array = "Editar";
        $sub_array = "Eliminar";
        $data[] = $sub_array;
      }

      $results = array(
        "sEcho=>1",
        "iTotalDisplayRecords"=>count($data),
        "aaData"=>$data);
      echo json_encode($results);
        break;

      /* TODO: Mostrar informacion y ver registro segun su id */
    case "mostrar":
      $datos=$usuario->get_usuario_x_usu_id($_POST["usu_id"]);
      if(is_array($datos)==true and count($datos)>0){
        foreach($datos as $row){
          $output["usu_id"] = $row['usu_id'];
          $output["suc_id"] = $row['suc_id'];
          $output["rol_id"] = $row['rol_id'];
          $output["usu_nom"] = $row['usu_nom'];
          $output["usu_correo"] = $row['usu_correo'];
          $output["usu_ape"] = $row['usu_ape'];
          $output["usu_dpi"] = $row['usu_dpi'];
          $output["usu_tel"] = $row['usu_tel'];
          $output["usu_pass"] = $row['usu_pass'];
        }
        echo json_encode($output);
      }
      break;

    /* TODO: Cambiar estado a 0  del registro*/
    case "eliminar":
      $usuario->delete_usuario($_POST["usu_id"]);
      break;
      
  }
?>