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
    public class Cliente
    {

        public bool InsertarCliente(string nombre, string apellido,
          string rut, string genero, string telefono, string estado)
        {

            Coneccion cn = new Coneccion();
            try
            {
                string sql = "sp_insertar_cliente";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@nombre", nombre);
                cmd.Parameters.AddWithValue("@apellido", apellido);
                cmd.Parameters.AddWithValue("@rut", rut);
                cmd.Parameters.AddWithValue("@genero", genero);
                cmd.Parameters.AddWithValue("@telefono", telefono);
                cmd.Parameters.AddWithValue("@estado", estado);

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;

            }
        }

        public bool ActualizarCliente(int id_cli, string nom, string ape, string ru, string gen, string tel, string est)
        {
            Coneccion cn = new Coneccion();
            try
            {
                string sql = "sp_Actualizar_cliente";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_cliente", id_cli);
                cmd.Parameters.AddWithValue("@nombre", nom);
                cmd.Parameters.AddWithValue("@apellido", ape);
                cmd.Parameters.AddWithValue("@rut", ru);
                cmd.Parameters.AddWithValue("@genero", gen);
                cmd.Parameters.AddWithValue("@telefono", tel);
                cmd.Parameters.AddWithValue("@estado", est);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }
        public bool ExisteCliente(string rutCliente)
        {
            Coneccion cn = new Coneccion();
            //trae la cantidad de registros que esten en la base de datos 
            //cuando el nombre del proveedor sea igual al que llega por parametro
            string sql = "SELECT COUNT(*) FROM clientes WHERE rut=@rut";
            SqlCommand cmd = new SqlCommand(sql, cn.getConection());//traemos la consulta y la coneccion
            cmd.Parameters.AddWithValue("@rut", rutCliente);//agregamos el campo que vendra por parametro

            int count = Convert.ToInt32(cmd.ExecuteScalar());//traemos la cantidad de registros

            //si la cantidad es 0 esto quiere desir que no hay ningun dato con el mismo nombre
            if (count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

    }
}
