using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace biblioteca_los_yuyitos
{
    public class Recepcion_pedidos
    {
        public bool Insertar(int numOrden,string nombre_prove,string rubro,string descripcion,int cantidad,string estado){
            try
            {
                Coneccion cn = new Coneccion();
                string sql = "INSERT INTO recepcion_productos(nro_orden,nom_proveedor,rubro_proveedor,descripcion,cantidad,estado) VALUES('"+numOrden+"','"+nombre_prove+"','"+rubro+"','"+descripcion+"','"+cantidad+"','"+estado+"')";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
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
