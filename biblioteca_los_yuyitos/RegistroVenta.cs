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
    public class RegistroVenta
    {
        private int cod_producto;

        public int CodProducto
        {
            get { return cod_producto; }
            set { cod_producto = value; }
        }

        private string descripcion_producto;

        public string DescripcionProducto
        {
            get { return descripcion_producto; }
            set { descripcion_producto = value; }
        }

        private int precio_venta;

        public int PrecioVenta
        {
            get { return precio_venta; }
            set { precio_venta = value; }
        }

        private int stock;

        public int Stock
        {
            get { return stock; }
            set { stock = value; }
        }

        private int cantidad;

        public int Cantidad
        {
            get { return cantidad; }
            set { cantidad = value; }
        }

        private string fecha_venta;

        public string FechaVenta
        {
            get { return fecha_venta; }
            set { fecha_venta = value; }
        }


        private int total_a_pagar;

        public int TotalAPagar
        {
            get { return total_a_pagar; }
            set { total_a_pagar = value; }
        }

        private string n_boleta;

        public string NBoleta
        {
            get { return n_boleta; }
            set { n_boleta = value; }
        }
        
        
        Coneccion cn = new Coneccion();//instanciamos la clase coneccion para poder insertar
        public bool InsertarRegistroVenta(int CodProducto, string DescripcionProducto,
            int PrecioVenta, int Stock, int Cantidad, string FechaVenta, int TotalAPagar)
        {
            //resivimos los datos que insertaremos por parametro


            try
            {
                string sql = "sp_Registrar_venta";//declaramos una variable para llamar al procedimiento almacenado
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());//enviamos la variable que creamos y la coneccion que la traera la intancia
                cmd.CommandType = CommandType.StoredProcedure;//mensionamos que utilisaremos un storeprocedure

                //llamamos  los valores del procedimiento al macenado y le damos las variables que llegaran por parametro
                cmd.Parameters.AddWithValue("@cod_producto", CodProducto);
                cmd.Parameters.AddWithValue("@descripcion_producto", DescripcionProducto);
                cmd.Parameters.AddWithValue("@precio_venta", PrecioVenta);
                cmd.Parameters.AddWithValue("@stock", Stock);
                cmd.Parameters.AddWithValue("@cantidad", Cantidad);
                cmd.Parameters.AddWithValue("@fecha_venta", FechaVenta);
                cmd.Parameters.AddWithValue("@total_a_pagar", TotalAPagar);


                //ejecutamos la operacion
                cmd.ExecuteNonQuery();
                return true;//en el caso que todo salga bien este retornara true
            }
            catch (Exception)
            {
                return false;//caso contrario retornara false

            }
        }

        public string nBoleta()
        {
            string sql = "select count(id_ventas) from registro_ventas";
            SqlCommand cmd = new SqlCommand(sql, cn.getConection());
            int nboleta;
            nboleta = Convert.ToInt32(cmd.ExecuteScalar());
            nboleta = nboleta + 1;
            return "" + nboleta;
        }
    }
}
