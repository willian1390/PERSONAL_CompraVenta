<?php
/* TODO: LLAMANDO CLASE */
  require_once("../config/conexion.php");
  require_once("../models/Moneda.php");

/* TODO: Inicializando clase */
  $moneda = new Moneda();

  switch ($_GET["op"]) {
   /*  TODO: Guardar y editar, guardar cuando el id este vacio y actualizar cuando se envie el id */
    case 'guardaryeditar':
      if (empty ($_POST["mon_id"])) {
        $moneda->insert_moneda($_POST["suc_id"], $_POST["mon_nom"]);
      }else{
        $moneda->update_moneda($_POST["mon_id"],$_POST["suc_id"], $_POST["mon_nom"]);
      }
      break;
    
    /* TODO: Listado de registros formato JSON para datatable JS*/
    case "listar":
      $datos = $moneda->get_moneda_x_suc_id($_POST["suc_id"]);
      $data=Array();
      foreach($datos as $row){
        $sub_array = array();
        $sub_array = $row["mon_nom"];
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
      $datos=$moneda->get_moneda_x_mon_id($_POST["mon_id"]);
      if(is_array($datos)==true and count($datos)>0){
        foreach($datos as $row){
          $output["mon_id"] = $row['mon_id'];
          $output["mon_id"] = $row['mon_id'];
          $output["mon_nom"] = $row['mon_nom'];
        }
        echo json_encode($output);
      }
      break;

    /* TODO: Cambiar estado a 0  del registro*/
    case "eliminar":
      $moneda->delete_moneda($_POST["mon_id"]);
      break;
      
  }
?>