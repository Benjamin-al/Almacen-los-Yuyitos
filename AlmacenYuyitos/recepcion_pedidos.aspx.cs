using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using biblioteca_los_yuyitos;
using System.Data;
namespace AlmacenYuyitos
{
    public partial class recepcion_pedidos : System.Web.UI.Page
    {
        Coneccion cn = new Coneccion();
        Recepcion_pedidos repedi = new Recepcion_pedidos();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM Registro_de_pedidos WHERE nro_orden=@numorde";
            SqlCommand cmd = new SqlCommand(sql, cn.getConection());
            cmd.Parameters.AddWithValue("@numorde", txtnumOrden.Text);
            SqlDataReader registro = cmd.ExecuteReader();
            while (registro.Read() == true)
            {
                txtnomprove.Text = registro["nom_proveedor"].ToString();
                txtrubro.Text = registro["rubro_proveedor"].ToString();
                txtdescrip.Text = registro["descripcion"].ToString();
                txtcant.Text = registro["cantidad"].ToString();
            }
            cn.getConection().Close();
        }

        public void LimpiarCampos()
        {
            txtnumOrden.Text = "";
            txtnomprove.Text = "";
            txtrubro.Text = "";
            txtdescrip.Text = "";
            txtcant.Text = "";
            txtnumOrden.Focus();
        }

        protected void btnRecepcionar_Click(object sender, EventArgs e)
        {
            try
            {
                string nombre, rubro, descrip, estado;
                int cantidad, num_orden, c, n;

                int.TryParse(txtnumOrden.Text, out n);
                num_orden = n;
                nombre = txtnomprove.Text;
                rubro = txtrubro.Text;
                descrip = txtdescrip.Text;
                int.TryParse(txtcant.Text, out c);
                cantidad = c;
                estado = cboestado.Value;

                if (num_orden == 0 || txtnomprove.Text == "" || txtrubro.Text == "" || txtdescrip.Text == "" || cantidad == 0)
                {
                    lblmensaje.Text = "debe llenar los campos";
                }
                else
                {
                    if (repedi.Insertar(num_orden, nombre, rubro, descrip, cantidad, estado))
                    {
                        lblmensaje.Text = "Pedido Recepcionado";
                    }
                    else
                    {
                        lblmensaje.Text = "Erro de Ingreso";
                    }
                }
                LimpiarCampos();



            }
            catch (Exception ex)
            {
                lblmensaje.Text = "Error Al Recepcionar Pedido" + ex;
            }
        }

        protected void btnlistaPedidos_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM Registro_de_pedidos";
            SqlDataAdapter da = new SqlDataAdapter(sql, cn.getConection());
            DataTable dt = new DataTable();
            da.Fill(dt);
            this.gridElementos.DataSource = (dt);
            gridElementos.DataBind();
            lblmensajetabla.Text = "Pedidos";
            lblmensaje.Text = "";
        }

        protected void btnListaRecepcion_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM recepcion_productos";
            SqlDataAdapter da = new SqlDataAdapter(sql, cn.getConection());
            DataTable dt = new DataTable();
            da.Fill(dt);
            this.gridElementos.DataSource = (dt);
            gridElementos.DataBind();
            lblmensajetabla.Text = "Recepcion Productos";
            lblmensaje.Text = "";
        }

        protected void gridElementos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}