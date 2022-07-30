using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;
using biblioteca_los_yuyitos;
using Microsoft.Reporting.WebForms;

namespace AlmacenYuyitos
{
    public partial class WebInformeProveedores : System.Web.UI.Page
    {
        Coneccion cn = new Coneccion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            string comuna;
            comuna = cboComuna.Value;

            try
            {
                string sql = "SELECT * FROM registro_proveedores WHERE comuna = @comu";
                SqlDataAdapter da = new SqlDataAdapter(sql, cn.getConection());
                DataTable dt = new DataTable();
                da.SelectCommand.Parameters.AddWithValue("@comu", comuna);

                da.Fill(dt);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportDataSource rp = new ReportDataSource("InformeProveedores", dt);
                ReportViewer1.LocalReport.DataSources.Add(rp);
                ReportViewer1.LocalReport.Refresh();
            }
            catch (Exception ex) { 
            }
        }

        protected void btnmostartodo_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebInformeProveedores.aspx");
        }
    }
}