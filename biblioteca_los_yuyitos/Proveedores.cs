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
    public class Proveedores
    {
        Coneccion cn = new Coneccion();//instanciamos la clase coneccion para poder insertar

        //este metodo realisara la funcion de registrar lso datos del proveedor mediante un storeprocedure
        public bool InsertarProveedor(string nombre,string telefono,string email,string comuna,string direccion,string rubro){
            //resivimos los datos que insertaremos por parametro

            try 
	        {	        
                string sql = "sp_insertar_proveedor";//declaramos una variable para llamar al procedimiento almacenado
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());//enviamos la variable que creamos y la coneccion que la traera la intancia
                cmd.CommandType = CommandType.StoredProcedure;//mensionamos que utilisaremos un storeprocedure

                //llamamos  los valores del procedimiento al macenado y le damos las variables que llegaran por parametro
                cmd.Parameters.AddWithValue("@nombre", nombre);
                cmd.Parameters.AddWithValue("@telefono", telefono);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@comuna", comuna);
                cmd.Parameters.AddWithValue("@direccion", direccion);
                cmd.Parameters.AddWithValue("@rubro", rubro);

                //ejecutamos la operacion
                cmd.ExecuteNonQuery();
                return true;//en el caso que todo salga bien este retornara true
	        }
	        catch (Exception)
	        {
                return false;//caso contrario retornara false
    
	        }            
        }

        public bool ActualizarProve(string nom_prove, string nombre, string telefono, string email, string comuna, string direccion, string rubro)
        {
            try
            {
                string sql = "UPDATE registro_proveedores SET nombre_proveedor='" + nombre + "', telefono='" + telefono + "' , email='" + email + "' , comuna='" + comuna + "' , direccion='" + direccion + "' , rubro='" + rubro + "' WHERE nombre_proveedor='" + nom_prove + "' ";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@nombre_proveedor", nombre);
                cmd.Parameters.AddWithValue("@telefono", telefono);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@comuna", comuna);
                cmd.Parameters.AddWithValue("@direccion", direccion);
                cmd.Parameters.AddWithValue("@rubro", rubro);
                cmd.Parameters.AddWithValue("@cod_prove", nom_prove);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool EliminaraProve(int cod_prove){
            try
            {
                string sql = "sp_Eliminar_Proveedor";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@cod_prove", cod_prove);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public bool Existeproveedor(string nombreProve) {

        	//trae la cantidad de registros que esten en la base de datos 
        	//cuando el nombre del proveedor sea igual al que llega por parametro
            string sql = "SELECT COUNT(*) FROM registro_proveedores WHERE nombre_proveedor=@nombrep";
            SqlCommand cmd = new SqlCommand(sql, cn.getConection());//traemos la consulta y la coneccion
            cmd.Parameters.AddWithValue("@nombrep", nombreProve);//agregamos el campo que vendra por parametro
            
            int count = Convert.ToInt32(cmd.ExecuteScalar());//traemos la cantidad de registros

            //si la cantidad es 0 esto quiere desir que no hay ningun dato con el mismo nombre
            if (count == 0)
            {
                return false;
            }
            else {
                return true;
            }
        }

    }
}
