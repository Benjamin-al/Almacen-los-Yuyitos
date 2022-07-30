using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using biblioteca_los_yuyitos;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Reporting.WebForms;

namespace AlmacenYuyitos
{
    public partial class WebInformeFiados : System.Web.UI.Page
    {
        Coneccion cn = new Coneccion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnbuscarrut_Click(object sender, EventArgs e)
        {
            string rut;
            rut = txtrut.Text;
            try
            {
                string sql = "SELECT * FROM registro_pagos_fiados WHERE rut = @rut";
                SqlDataAdapter da = new SqlDataAdapter(sql, cn.getConection());
                DataTable dt = new DataTable();
                da.SelectCommand.Parameters.AddWithValue("@rut", rut);

                da.Fill(dt);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportDataSource rp = new ReportDataSource("InforFiados", dt);
                ReportViewer1.LocalReport.DataSources.Add(rp);
                ReportViewer1.LocalReport.Refresh();
                txtrut.Text = "";
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnmostrartodo_Click(object sender, EventArgs e)
        {
            Response.Redirect("WebInformeFiados.aspx");
        }
    }
}