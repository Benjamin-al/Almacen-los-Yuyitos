using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace biblioteca_los_yuyitos
{
    public class Pedidos
    {
        Coneccion cn = new Coneccion();
        public bool InsertarPedido(int cod_prove,string nom , string rubro,string fecha,string descrip,int cant){
            try
            {
  
                string sql = "sp_registro_pedidos";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@cod_prove", cod_prove);
                cmd.Parameters.AddWithValue("@nom_prove", nom);
                cmd.Parameters.AddWithValue("@rubro_prove",rubro);
                cmd.Parameters.AddWithValue("@fecha",fecha);
                cmd.Parameters.AddWithValue("@descripcion",descrip);
                cmd.Parameters.AddWithValue("@cantidad",cant);
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
