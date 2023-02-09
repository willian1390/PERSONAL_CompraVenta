<?php
    /* TODO: Inicio de Session */
    session_start();
    class Conectar{
        protected $dbh;

        protected function Conexion(){
            try{
                /* TODO: Cadena de Conexion */
                $conectar = $this->dbh=new PDO("sqlsrv:Server=.\SQLEXPRESS;Database=CompraVenta","sa","Admin1");
                return $conectar;
            }catch (Exception $e){
                /* TODO: En caso de error mostrar mensaje */
                print "Error Conexion BD: ". $e->getMessage() . "\n";
                die();
            }
        }

        public static function ruta(){
            /* TODO: Ruta de acceso del Proyecto (Validar su puerto y nombre de carpeta por el suyo) */
            return "http://localhost:90/PERSONAL_CompraVenta/";
        }
    }
?>