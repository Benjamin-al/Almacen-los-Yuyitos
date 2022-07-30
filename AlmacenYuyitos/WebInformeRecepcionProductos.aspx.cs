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
    public partial class WebInformeRecepcionProductos : System.Web.UI.Page
    {
        Coneccion cn = new Coneccion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string estado;
            estado=cboPedido.Value;

            if (cboPedido.Value == "Denegado" || cboPedido.Value == "Aprobado")
            {
                string sql = "SELECT * FROM recepcion_productos WHERE estado = @esta";
                SqlDataAdapter da = new SqlDataAdapter(sql, cn.getConection());
                DataTable dt = new DataTable();
                da.SelectCommand.Parameters.AddWithValue("@esta", estado);

                da.Fill(dt);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportDataSource rp = new ReportDataSource("InformeRecepcionProductos", dt);
                ReportViewer1.LocalReport.DataSources.Add(rp);
                ReportViewer1.LocalReport.Refresh();
            }
            else {
                Response.Redirect("WebInformeRecepcionProductos.aspx");
            }
           
        }

        protected void btnmostrartodo_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebInformeRecepcionProductos.aspx");
        }
    }
}