using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data.SqlTypes;
using biblioteca_los_yuyitos;
using System.Data;
using Microsoft.Reporting.WebForms;

namespace AlmacenYuyitos
{
    public partial class WebInformePedidos : System.Web.UI.Page
    {
        Coneccion cn = new Coneccion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            string nom_prov;
            nom_prov = txtnom_prove.Text;
            try
            {
                string sql = "SELECT * FROM Registro_de_pedidos WHERE  nom_proveedor = @nom_prove";
                SqlDataAdapter da = new SqlDataAdapter(sql, cn.getConection());
                DataTable dt = new DataTable();
                da.SelectCommand.Parameters.AddWithValue("@nom_prove", nom_prov);

                da.Fill(dt);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportDataSource rp = new ReportDataSource("InforPedidos", dt);
                ReportViewer1.LocalReport.DataSources.Add(rp);
                ReportViewer1.LocalReport.Refresh();
                txtnom_prove.Text = "";
            }
            catch (Exception ex) { 
            }
            
        }

        protected void btnmostrartodo_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebInformePedidos.aspx");
        }


    }
}