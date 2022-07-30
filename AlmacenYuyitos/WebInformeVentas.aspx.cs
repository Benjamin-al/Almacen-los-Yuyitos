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
using Microsoft.Reporting.WebForms;

namespace AlmacenYuyitos
{
    public partial class WebInformeVentas : System.Web.UI.Page
    {
        Coneccion cn = new Coneccion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnbuscarfecha_Click(object sender, EventArgs e)
        {
            string d;
            d = txtnboleta.Text;
            try
            {
                string sql = "SELECT * FROM registro_ventas WHERE descripcion_producto = @descrip";
                SqlDataAdapter da = new SqlDataAdapter(sql, cn.getConection());
                DataTable dt = new DataTable();
                da.SelectCommand.Parameters.AddWithValue("@descrip", d);

                da.Fill(dt);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportDataSource rp = new ReportDataSource("DataSet1", dt);
                ReportViewer1.LocalReport.DataSources.Add(rp);
                ReportViewer1.LocalReport.Refresh();
                txtnboleta.Text = "";
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnmostrartodo_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebInformeVentas.aspx");
        }

      
    }
}