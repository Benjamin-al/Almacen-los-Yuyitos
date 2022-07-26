using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using System.Data.Sql;
using biblioteca_los_yuyitos;
using System.Data;

namespace biblioteca_los_yuyitos
{
    public class PagoFiados
    {
        Coneccion cn = new Coneccion();
    
        public bool insertarPago(int id_cliente,string nom_cliente,string apellido,string rut,int deuda_pagada,string estado) {
            try {
                string sql = "sp_registrar_pago_fiado";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_cliente", id_cliente);
                cmd.Parameters.AddWithValue("@nombre_cliente", nom_cliente);
                cmd.Parameters.AddWithValue("@apellido_cliente", apellido);
                cmd.Parameters.AddWithValue("@rut", rut);
                cmd.Parameters.AddWithValue("@deuda_pagada", deuda_pagada);
                cmd.Parameters.AddWithValue("@estado", estado);

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ) {
                return false;
            }
        }

        public bool EliminarRegistroCliente(int id_cliente)
        {
            try
            {
                string sql = "delete  FROM registro_clientes WHERE id_cliente=@id_cliente";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@id_cliente", id_cliente);
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
