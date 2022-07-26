using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;

namespace biblioteca_los_yuyitos
{
    public class DetalleVentaTemp
    {
        Coneccion cn = new Coneccion();//instanciamos la clase coneccion para poder insertar
        SqlCommand cmd = new SqlCommand();
        public bool InsertarProductoTemp(int cod_producto, string descripcion_producto,
           int precio_venta, int stock, int cantidad, string fecha_venta)
        {
            //resivimos los datos que insertaremos por parametro


            try
            {
                string sql = "sp_Detalle_venta_Tem";//declaramos una variable para llamar al procedimiento almacenado
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());//enviamos la variable que creamos y la coneccion que la traera la intancia
                cmd.CommandType = CommandType.StoredProcedure;//mensionamos que utilisaremos un storeprocedure

                //llamamos  los valores del procedimiento al macenado y le damos las variables que llegaran por parametro
                cmd.Parameters.AddWithValue("@cod_producto", cod_producto);
                cmd.Parameters.AddWithValue("@descripcion_producto", descripcion_producto);
                cmd.Parameters.AddWithValue("@precio_venta", precio_venta);
                cmd.Parameters.AddWithValue("@stock", stock);
                cmd.Parameters.AddWithValue("@cantidad", cantidad);
                cmd.Parameters.AddWithValue("@fecha_venta", fecha_venta);


                //ejecutamos la operacion
                cmd.ExecuteNonQuery();
                return true;//en el caso que todo salga bien este retornara true
            }
            catch (Exception)
            {
                return false;//caso contrario retornara false

            }
        }

        public bool ActualizarStock(int cod_produc,int stock) {
            try
            {
                string sql = "update Productos set stock='" + stock +"' where cod_producto='" + cod_produc + "'";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@cod_produc", cod_produc);
                cmd.Parameters.AddWithValue("@stock", stock);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
