using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using biblioteca_los_yuyitos;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;
namespace AlmacenYuyitos
{
    public partial class generador_pedidos : System.Web.UI.Page
    {
        Coneccion cn = new Coneccion();
        Pedidos pedi = new Pedidos();
        protected void Page_Load(object sender, EventArgs e)
        {
            ListarPedidos();
        }
        public void LimpiarCampos()
        {
            txtnombreprov.Text = "";
            txtcodprov.Text = "";
            txtrubro.Text = "";
            txtdescripcion.Text = "";
            txtcantidad.Text = "";
            txtnombreprov.Focus();
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                string nombre, rubro, descrip;
                int cant, cod_prove;
                int ca, c_prove;
                DateTime fecha;

                nombre = txtnombreprov.Text;
                rubro = txtrubro.Text;
                fecha = DateTime.Now;
                string f = fecha.ToShortDateString();
                descrip = txtdescripcion.Text;
                int.TryParse(txtcantidad.Text,out ca);
                cant = ca;
                int.TryParse(txtcodprov.Text,out c_prove);
                cod_prove = c_prove;


                if(txtdescripcion.Text=="" || txtcantidad.Text==""){
                    lblmensaje.Text = "Debe llenar los campos";
                }else{
                    if (pedi.InsertarPedido(cod_prove, nombre, rubro, f, descrip, cant))
                    {
                        lblmensaje.Text = "Pedido Registrado";
                    }
                    else
                    {
                        lblmensaje.Text = "Error Al Registrar Pedido";
                    }
                }
                ListarPedidos();
                LimpiarCampos();
                cn.getConection().Close();

            }
            catch (Exception ex)
            {
                lblmensaje.Text = "Error Al Ingresar" + ex;
            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM registro_proveedores WHERE nombre_proveedor=@nom_prove";
            SqlCommand cmd = new SqlCommand(sql,cn.getConection());
            cmd.Parameters.AddWithValue("@nom_prove", txtnombreprov.Text);
            SqlDataReader registro = cmd.ExecuteReader();
            while(registro.Read()==true) {
                txtcodprov.Text = registro["cod_proveedor"].ToString();
                txtrubro.Text = registro["rubro"].ToString();
            }
            cn.getConection().Close();
        }

        public void ListarPedidos()
        {
            string sql = "SELECT * FROM Registro_de_pedidos";
            SqlDataAdapter da = new SqlDataAdapter(sql, cn.getConection());
            DataTable dt = new DataTable();
            da.Fill(dt);
            this.gdPedidos.DataSource = (dt);
            gdPedidos.DataBind();

        }

    }
}