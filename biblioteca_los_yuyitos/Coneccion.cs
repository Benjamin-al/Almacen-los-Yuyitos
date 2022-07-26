using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

namespace biblioteca_los_yuyitos
{
    public class Coneccion
    {
        public SqlConnection getConection() {
            try
            {
                string cadena = @"Data Source=BENJA-PC\BENJAMIN;Initial Catalog=YUYITOS;Integrated Security=True";
                SqlConnection cn= new SqlConnection(cadena);
                cn.Open();
                return cn;
            }
            catch (Exception)
            {
                
                return null;
            }
        }
    }
}
