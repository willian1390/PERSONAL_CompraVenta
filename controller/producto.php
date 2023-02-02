<?php
/* TODO: LLAMANDO CLASE */
  require_once("../config/conexion.php");
  require_once("../models/Producto.php");

/* TODO: Inicializando clase */
  $producto = new Producto();

  switch ($_GET["op"]) {
   /*  TODO: Guardar y editar, guardar cuando el id este vacio y actualizar cuando se envie el id */
    case 'guardaryeditar':
      if (empty ($_POST["prod_id"])) {
        $producto->insert_producto(
          $_POST["suc_id"], 
          $_POST["cat_id"],
          $_POST["prod_nom"],
          $_POST["prod_descrip"],
          $_POST["und_id"],
          $_POST["mon_id"],
          $_POST["prod_pcompra"],
          $_POST["prod_pventa"],
          $_POST["prod_stock"],
          $_POST["prod_fechaven"],
          $_POST["prod_img"]
        );
      }else{
        $producto->update_producto(
          $_POST["prod_id"],
          $_POST["suc_id"], 
          $_POST["cat_id"],
          $_POST["prod_nom"],
          $_POST["prod_descrip"],
          $_POST["und_id"],
          $_POST["mon_id"],
          $_POST["prod_pcompra"],
          $_POST["prod_pventa"],
          $_POST["prod_stock"],
          $_POST["prod_fechaven"],
          $_POST["prod_img"]);
      }
      break;
    
    /* TODO: Listado de registros formato JSON para datatable JS*/
    case "listar":
      $datos = $producto->get_producto_x_suc_id($_POST["suc_id"]);
      $data=Array();
      foreach($datos as $row){
        $sub_array = array();
        $sub_array = $row["prod_nom"];
        $sub_array = $row["prod_descrip"];
        $sub_array = $row["prod_pcompra"];
        $sub_array = $row["prod_pventa"];
        $sub_array = $row["prod_stock"];
        $sub_array = $row["prod_fechaven"];
        $sub_array = $row["prod_img"];
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
      $datos=$producto->get_producto_x_prod_id($_POST["prod_id"]);
      if(is_array($datos)==true and count($datos)>0){
        foreach($datos as $row){
          $output["prod_id"] = $row['prod_id'];
          $output["cat_id"] = $row['cat_id'];
          $output["prod_nom"] = $row['prod_nom'];
          $output["prod_descrip"] = $row['prod_descrip'];
          $output["prod_pcompra"] = $row['prod_pcompra'];
          $output["prod_stock"] = $row['prod_stock'];
          $output["prod_fechaven"] = $row['prod_fechaven'];
          $output["prod_img"] = $row['prod_img'];

        }
        echo json_encode($output);
      }
      break;

    /* TODO: Cambiar estado a 0  del registro*/
    case "eliminar":
      $producto->delete_producto($_POST["prod_id"]);
      break;
      
  }
?>