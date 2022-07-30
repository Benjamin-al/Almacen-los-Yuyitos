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
    public partial class login : System.Web.UI.Page
    {
        Coneccion con = new Coneccion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnenviar_Click(object sender, EventArgs e)
        {
            try
            {
                con.getConection();
                string sql = "SELECT username,cargo FROM users WHERE username=@username AND pass=@pass ";
                SqlCommand cmd = new SqlCommand(sql,con.getConection());
                cmd.Parameters.AddWithValue("@username", txtuser.Text);
                cmd.Parameters.AddWithValue("@pass", txtpass.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count == 1)
                {
                    if(dt.Rows[0][1].ToString()=="admin"){
                        Response.Redirect("admin.aspx");
                    }else if(dt.Rows[0][1].ToString()=="user"){
                        Response.Redirect("user.aspx");
                    }
                }
                else {
                    lblerror.Text = "Usuario o Contraseña Incorrecta";
                }
                con.getConection().Close();
            }
            catch (Exception ex)
            {
                lblerror.Text = " "+ex;
               
            }
        }
    }
}