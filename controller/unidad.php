<?php
/* TODO: LLAMANDO CLASE */
  require_once("../config/conexion.php");
  require_once("../models/Unidad.php");

/* TODO: Inicializando clase */
  $unidad = new Unidad();

  switch ($_GET["op"]) {
   /*  TODO: Guardar y editar, guardar cuando el id este vacio y actualizar cuando se envie el id */
    case 'guardaryeditar':
      if (empty ($_POST["und_id"])) {
        $unidad->insert_unidad($_POST["suc_id"], $_POST["und_nom"]);
      }else{
        $unidad->update_unidad($_POST["und_id"],$_POST["suc_id"], $_POST["und_nom"]);
      }
      break;
    
    /* TODO: Listado de registros formato JSON para datatable JS*/
    case "listar":
      $datos = $unidad->get_unidad_x_suc_id($_POST["suc_id"]);
      $data=Array();
      foreach($datos as $row){
        $sub_array = array();
        $sub_array = $row["und_nom"];
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
      $datos=$unidad->get_unidad_x_und_id($_POST["und_id"]);
      if(is_array($datos)==true and count($datos)>0){
        foreach($datos as $row){
          $output["und_id"] = $row['und_id'];
          $output["und_id"] = $row['und_id'];
          $output["und_nom"] = $row['und_nom'];
        }
        echo json_encode($output);
      }
      break;

    /* TODO: Cambiar estado a 0  del registro*/
    case "eliminar":
      $unidad->delete_unidad($_POST["und_id"]);
      break;
      
  }
?>