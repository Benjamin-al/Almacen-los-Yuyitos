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
    
    public class Productos
    {
        Coneccion cn = new Coneccion();
        public bool InsertarProductos(int cod_prove,string nom_prove, string fecha_venci, string descrip, int precio_compra, int precio_vent, int stock, int stock_cri, string catego)
        {
        
            try
            {
                string sql = "sp_registro_productos";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@cod_proveedor", cod_prove);
                cmd.Parameters.AddWithValue("@nombre_proveedor", nom_prove);
                cmd.Parameters.AddWithValue("@fecha_vencimiento", fecha_venci);
                cmd.Parameters.AddWithValue("@descripcio", descrip);
                cmd.Parameters.AddWithValue("@precio_com", precio_compra);
                cmd.Parameters.AddWithValue("@precio_venta", precio_vent);
                cmd.Parameters.AddWithValue("@stock", stock);
                cmd.Parameters.AddWithValue("@stock_critico", stock_cri);
                cmd.Parameters.AddWithValue("@categoria", catego);

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public bool ActualizarProducto(int cod_produc,string fecha_venci,string descrip, int precio_compra,int precio_vent, int stock, int stock_cri, string catego)
        {
            try
            {
                string sql = "sp_actualizar_productos";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@cod_producto", cod_produc);
                cmd.Parameters.AddWithValue("@fecha_venci", fecha_venci);
                cmd.Parameters.AddWithValue("@descrip", descrip);
                cmd.Parameters.AddWithValue("@precio_com", precio_compra);
                cmd.Parameters.AddWithValue("@precio_venta", precio_vent);
                cmd.Parameters.AddWithValue("@stock", stock);
                cmd.Parameters.AddWithValue("@stock_critico", stock_cri);
                cmd.Parameters.AddWithValue("@categoria", catego);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public bool EliminarProducto(int cod_producto) {
            try
            {
                string sql = "sp_eliminar_producto";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@cod_producto", cod_producto);
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
