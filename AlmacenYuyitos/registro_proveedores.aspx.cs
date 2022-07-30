using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;
using biblioteca_los_yuyitos;
using System.Windows.Forms;

namespace AlmacenYuyitos
{
    public partial class registro_proveedores : System.Web.UI.Page
    {
        Proveedores provee = new Proveedores();
        Coneccion cn = new Coneccion();
        protected void Page_Load(object sender, EventArgs e)
        {
            ListarProveedor();
        }

        public void LimpiarCampos()
        {
            txtnombreProveed.Text = "";
            txttelefon.Text = "";
            txtemail.Text = "";
            cboComuna.Value = "Seleccionar";
            txtdireccion.Text = "";
            txtrubro.Text = "";
            txtnombreProveed.Focus();
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {

            try
            {
                //creamos variables
                string nom, tel, email, comuna, direc, rubro;

                //asociamos las variables con los campos de textos
                nom = txtnombreProveed.Text;
                tel = txttelefon.Text;
                email = txtemail.Text;
                comuna = cboComuna.Value;
                direc = txtdireccion.Text;
                rubro = txtrubro.Text;

                if (txtnombreProveed.Text == "" || txttelefon.Text == "" || txtemail.Text == "" || cboComuna.Value == "Seleccionar" || txtdireccion.Text == "" || txtrubro.Text == "")
                {
                    lblmensaje.Text = "debe llenar los campos";
                }
                else
                {
                    //si el dato inresado no es igual al que esta en la base de datos 
                    //este se ingresa
                    if (!provee.Existeproveedor(nom))
                    {
                        //llamamos al metodo insertar y validamos que se cumpla correcatamente
                        if (provee.InsertarProveedor(nom, tel, email, comuna, direc, rubro))
                        {
                            lblmensaje.Text = "Proveedor Registrado";
                        }
                        else
                        {
                            lblmensaje.Text = "Error Al Registrar";
                        }
                    }
                    else
                    {//en caso contrario este ya exciste y no se agregaria 
                        lblmensaje.Text = "El Proveedor ya existe";
                    }

                    LimpiarCampos();//limpiamos los campos despues que re realisa el registro
                    ListarProveedor();
                }
            }
            catch (Exception ex)
            {

                lblmensaje.Text = "El Error Producido Es: " + ex;
            }

        }


        public void ListarProveedor()
        {
            string sql = "SELECT *  FROM registro_proveedores";
            SqlDataAdapter da = new SqlDataAdapter(sql, cn.getConection());
            DataTable dt = new DataTable();
            da.Fill(dt);
            this.gdProveedores.DataSource = (dt);
            gdProveedores.DataBind();

        }

        protected void btnmodificar_Click(object sender, EventArgs e)
        {
            try
            {
                //creamos variables
                string nom, tel, email, comuna, direc, rubro, nom_prove;

                //asociamos las variables con los campos de textos
                nom_prove = txtnomprove.Text;
                nom = txtnombreProveed.Text;
                tel = txttelefon.Text;
                email = txtemail.Text;
                comuna = cboComuna.Value;
                direc = txtdireccion.Text;
                rubro = txtrubro.Text;

                if (txtnombreProveed.Text == "" || txttelefon.Text == "" || cboComuna.Value == "Seleccionar" || txtdireccion.Text == "" || txtrubro.Text == "")
                {
                    lblmensaje.Text = "Debe ingresar nombre proveedor antes de Modificar";
                }
                else
                {
                    //llamamos al metodo insertar y validamos que se cumpla correcatamente
                    if (provee.ActualizarProve(nom_prove, nom, tel, email, comuna, direc, rubro))
                    {
                        lblmensaje.Text = "Proveedor Actualizado";
                    }
                    else
                    {
                        lblmensaje.Text = "Error Al Actualizar";
                    }
                    LimpiarCampos();//limpiamos los campos despues que re realisa el registro
                    ListarProveedor();
                }

            }
            catch (Exception ex)
            {

                lblmensaje.Text = "El Error Producido Es: " + ex;
            }
        }

        protected void btneliminar_Click(object sender, EventArgs e)
        {
            try
            {
                int v, cod_provee;
                int.TryParse(txtproveeliminar.Text, out v);
                cod_provee = v;
                if (cod_provee == 0)
                {
                    lblmensaje.Text = "Debe ingresar el codigo del Proveedor antes de Eliminar";
                }
                else
                {
                    if (provee.EliminaraProve(cod_provee))
                    {
                        lblmensaje.Text = "Proveedor Eliminado";
                    }
                    else
                    {
                        lblmensaje.Text = "Error Al Eliminar";
                    }
                    LimpiarCampos();
                    ListarProveedor();
                }



            }
            catch (Exception ex)
            {

                lblmensaje.Text = "El Error Producido Es: " + ex;
            }


        }

        protected void btnBuscar_Click1(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM registro_proveedores WHERE nombre_proveedor=@nomprove";
            SqlCommand cmd = new SqlCommand(sql, cn.getConection());
            cmd.Parameters.AddWithValue("@nomprove", txtnomprove.Text);
            SqlDataReader registro = cmd.ExecuteReader();
            while (registro.Read() == true)
            {
                txtnombreProveed.Text = registro["nombre_proveedor"].ToString();
                txttelefon.Text = registro["telefono"].ToString();
                txtemail.Text = registro["email"].ToString();
                cboComuna.Value = registro["comuna"].ToString();
                txtdireccion.Text = registro["direccion"].ToString();
                txtrubro.Text = registro["rubro"].ToString();
            }
            cn.getConection().Close();
        }


    }
}