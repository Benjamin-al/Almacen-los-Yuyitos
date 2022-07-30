using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data.Sql;
using biblioteca_los_yuyitos;
using System.Data;
using Microsoft.Reporting.WebForms;

namespace AlmacenYuyitos
{
    public partial class WebInformeProducto : System.Web.UI.Page
    {
        Coneccion cn = new Coneccion();
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nom_prov;
            nom_prov = txtnomprove.Text;

            try
            {
                string sql = "SELECT * FROM Productos WHERE  nombre_proveedor = @nom_prove";
                SqlDataAdapter da = new SqlDataAdapter(sql, cn.getConection());
                DataTable dt = new DataTable();
                da.SelectCommand.Parameters.AddWithValue("@nom_prove", nom_prov);

                da.Fill(dt);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportDataSource rp = new ReportDataSource("InformeProductos", dt);
                ReportViewer1.LocalReport.DataSources.Add(rp);
                ReportViewer1.LocalReport.Refresh();
            }catch(Exception ex){
            }
        }

        protected void btnmostartodo_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebInformeProducto.aspx");
        }
    }
}