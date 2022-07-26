using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
namespace biblioteca_los_yuyitos
{
    public class AdministrarBoletas
    {
        Coneccion cn = new Coneccion();
        public bool EliminarBoleta(string n_boleta) {
            try
            {
                string sql = "delete from registro_ventas where numero_boleta=@nboleta";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@nboleta", n_boleta);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public bool EliminarProducto(int id_venta) {
            try
            {
                string sql = "delete from registro_ventas where id_ventas=@id_vent";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@id_vent", id_venta);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public bool ActualizarBoleta(int id_venta,int cod_produc,string descripcion,int precio_venta,int stock,int cantidad,string fecha_venta,int total) {
            try
            {
                string sql = "sp_actualizar_boleta";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_venta", id_venta);
                cmd.Parameters.AddWithValue("@cod_producto", cod_produc);
                cmd.Parameters.AddWithValue("@descripcion", descripcion);
                cmd.Parameters.AddWithValue("@precio_venta", precio_venta);
                cmd.Parameters.AddWithValue("@stock", stock);
                cmd.Parameters.AddWithValue("@cantidad", cantidad);
                cmd.Parameters.AddWithValue("@fecha_venta", fecha_venta);
                cmd.Parameters.AddWithValue("@total_a_pagar", total);
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
