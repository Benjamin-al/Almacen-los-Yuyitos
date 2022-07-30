using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using biblioteca_los_yuyitos;
using System.Data.Sql;
using System.Windows.Forms;
using System.Data;


namespace AlmacenYuyitos
{
    public partial class pago_fiados : System.Web.UI.Page
    {
        int Abonado;
        Coneccion cn = new Coneccion();
        PagoFiados pago = new PagoFiados();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void limpiarCampos()
        {
            TxtIdCliente.Focus();
            TxtNombre.Text = "";
            TxtApellido.Text = "";
            TxtRut.Text = "";
            TxtDeuda.Text = "";
            TxtEstado.Text = "";
            TxtPagar.Text = "";
        }

        protected void BtnBuscarRutCliente_Click(object sender, EventArgs e)
        {
            if (TxtRutCliente.Text == "")
            {
                lblMensajeId.Text = "Ingrese el rut de cliente para buscar";
                limpiarCampos();
                TxtIdCliente.Text = "";
            }
            else
            {
                string sql = "SELECT * FROM registro_clientes WHERE rut=@rut";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                cmd.Parameters.AddWithValue("@rut", TxtRutCliente.Text);
                SqlDataReader registro = cmd.ExecuteReader();
                if (registro.Read() == true)
                {
                    TxtIdCliente.Text = registro["id_cliente"].ToString();
                    lblMensajeId.Text = "ID cargado con exito";
                    TxtIdCliente.ReadOnly = true;
                }
                else
                {
                    lblMensajeId.Text = "El cliente no contiene registros de fiados";
                    limpiarCampos();
                    TxtIdCliente.Text = "";
                }
                cn.getConection().Close();


            }
        }

        protected void BtnBuscarIdCliente_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM registro_clientes WHERE id_cliente=@id_cliente";
            SqlCommand cmd = new SqlCommand(sql, cn.getConection());
            cmd.Parameters.AddWithValue("@id_cliente", TxtIdCliente.Text);
            SqlDataReader registro = cmd.ExecuteReader();

            if (TxtIdCliente.Text == "")
            {
                lblMensajeId.Text = "Ingrese el rut de cliente para buscar el ID";
                limpiarCampos();
            }
            else
            {
                if (registro.Read() == true)
                {
                    TxtNombre.Text = registro["nombre"].ToString();
                    TxtApellido.Text = registro["apellido"].ToString();
                    TxtRut.Text = registro["rut"].ToString();
                    TxtDeuda.Text = registro["total_a_pagar"].ToString();
                    TxtEstado.Text = registro["estado"].ToString();

                }
                else
                {
                    lblMensajeId.Text = "El cliente no contiene registros de fiados";
                    limpiarCampos();
                    TxtIdCliente.Text = "";
                    LblMensaje.Text = "";
                }
                cn.getConection().Close();

            }
        }

        protected void BtnPagar_Click(object sender, EventArgs e)
        {
            string pagar;
            pagar = TxtPagar.Text;
            if (TxtIdCliente.Text == "" || TxtRut.Text == "" || pagar == ""|| int.Parse(TxtPagar.Text) == 0)
            {
                LblMensaje.Text = "Debe llenar los campos";
            }
            else
            {
                if (int.Parse(TxtDeuda.Text) <= int.Parse(TxtPagar.Text))
                {
                    LblMensaje.Text = "El total a abonar es mayor a la deuda";
                }
                else
                {
                    Abonado = int.Parse(TxtDeuda.Text) - int.Parse(TxtPagar.Text);
                    string sql = "update registro_clientes set total_a_pagar=@total_a_pagar where id_cliente=@id_cliente";
                    SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                    cmd.Parameters.AddWithValue("@id_cliente", TxtIdCliente.Text);
                    cmd.Parameters.AddWithValue("@total_a_pagar", Abonado);
                    cmd.ExecuteNonQuery();

                    RegistrarPagoFiados();
                    LblMensaje.Text = "Monto abonado";
                    limpiarCampos();
                    TxtIdCliente.Text = "";
                    TxtIdCliente.ReadOnly = false;
                }
            }
        }

        protected void BtnPAgo_Click(object sender, EventArgs e)
        {
            RegistrarPagoFiados();
        }

        public void EliminarRegistroTablaRegistroCliente()
        {
            try
            {
                int id_cliente, id_c;
                int.TryParse(TxtIdCliente.Text, out id_c);
                id_cliente = id_c;
                if (id_cliente == 0)
                {
                    LblMensaje.Text = "Debe ingresar el id cliente a eliminar";
                }
                else
                {
                    pago.EliminarRegistroCliente(id_cliente);
                    TxtIdCliente.ReadOnly = false;
                }

            }
            catch (Exception ex)
            {

                LblMensaje.Text = "Error " + ex;
            }
        }



        public void RegistrarPagoFiados()
        {

            string pagar;
            pagar = TxtPagar.Text;

            int id_cliente, monto_abonado, DeudaPagada;
            int cli, abon, deu;
            string nom_cliente, apellido, rut, estado;

            int.TryParse(TxtIdCliente.Text, out cli);
            id_cliente = cli;
            nom_cliente = TxtNombre.Text;
            apellido = TxtApellido.Text;
            rut = TxtRut.Text;
            int.TryParse(TxtPagar.Text, out abon);
            monto_abonado = abon;
            int.TryParse(TxtDeuda.Text, out deu);
            DeudaPagada = deu;
            estado = TxtEstado.Text;

            if (TxtIdCliente.Text == "" || TxtRut.Text == "" || pagar == ""|| int.Parse(TxtPagar.Text) == 0)
            {
                LblMensaje.Text = "Debe llenar los campos";
            }
            else
            {
                if (int.Parse(TxtDeuda.Text) == int.Parse(TxtPagar.Text))
                {
                    pago.insertarPago(id_cliente, nom_cliente, apellido, rut, DeudaPagada, estado);
                    cn.getConection().Close();
                    EliminarRegistroTablaRegistroCliente();
                    limpiarCampos();
                    TxtIdCliente.Text = "";
                    LblMensaje.Text = "Se pago correctamente";
                    TxtIdCliente.ReadOnly = false;
                }
                else
                {
                    LblMensaje.Text = "El total a pagar debe ser igual a la deuda";
                }
            }
        }
    }
}