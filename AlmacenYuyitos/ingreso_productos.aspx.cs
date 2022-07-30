using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using biblioteca_los_yuyitos;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;


namespace AlmacenYuyitos
{
    public partial class ingreso_productos : System.Web.UI.Page
    {
        Productos produc = new Productos();
        Coneccion con = new Coneccion();
        protected void Page_Load(object sender, EventArgs e)
        {
            ListarProducto();
        }

        public void LimpiarCampos()
        {
            txtcodproducto.Text = "";
            txtdescripcion.Text = "";
            txtprecioventa.Text = "";
            txtstock.Text = "";
            txtstockcritico.Text = "";
            txtcategoria.Text = "";
            txtprecio_comp.Text = "";
            txtcodprove.Text = "";
            txtfechavenci.Text = "";
            cbonomprove.Focus();
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                string descrip, catego, fecha_venci, nom_prove;
                int precio_vent, stock, stock_cri, precio_com, cod_prove;//valores que se envian por parametro
                int pv, sto, stoc, prec, c_pro;//valores de salida para convertir a entero
                string fecha = "0";

                nom_prove = cbonomprove.SelectedValue;
                fecha_venci = txtfechavenci.Text;
                int.TryParse(txtcodprove.Text, out c_pro);
                cod_prove = c_pro;
                descrip = txtdescripcion.Text;
                int.TryParse(txtprecio_comp.Text, out prec);
                precio_com = prec;
                int.TryParse(txtprecioventa.Text, out pv);
                precio_vent = pv;
                int.TryParse(txtstock.Text, out sto);
                stock = sto;
                int.TryParse(txtstockcritico.Text, out stoc);
                stock_cri = stoc;
                catego = txtcategoria.Text;

                if (cod_prove == 0 ||  txtdescripcion.Text == "" || precio_vent == 0 || stock == 0 || stock_cri == 0 || txtcategoria.Text == "")
                {
                    lblmensaje.Text = "Debe llenar los campos";
                }
                else
                {
                    if (txtfechavenci.Text == "")
                    {
                        if (produc.InsertarProductos(cod_prove, nom_prove, fecha, descrip, precio_com, precio_vent, stock, stock_cri, catego))
                        {
                            lblmensaje.Text = "Producto Registrado";
                        }
                        else
                        {
                            lblmensaje.Text = "Error Al Registrar";
                        }
                    }
                    else {
                        if (produc.InsertarProductos(cod_prove, nom_prove, fecha_venci, descrip, precio_com, precio_vent, stock, stock_cri, catego))
                        {
                            lblmensaje.Text = "Producto Registrado";
                        }
                        else
                        {
                            lblmensaje.Text = "Error Al Registrar";
                        }
                    }
                   
                    con.getConection().Close();
                    LimpiarCampos();
                    ListarProducto();
                }

            }
            catch (Exception ex)
            {
                lblmensaje.Text = "" + ex;
            }

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                string descrip, catego, fecha_venci;
                int precio_vent, stock, stock_cri, precio_compa;
                int pv, sto, stoc, prec, c_prod, cod_produc;
                string fecha = "0";

                int.TryParse(txtcodproducto.Text, out c_prod);
                cod_produc = c_prod;
                descrip = txtdescripcion.Text;
                fecha_venci = txtfechavenci.Text;
                int.TryParse(txtprecio_comp.Text, out prec);
                precio_compa = prec;
                int.TryParse(txtprecioventa.Text, out pv);
                precio_vent = pv;
                int.TryParse(txtstock.Text, out sto);
                stock = sto;
                int.TryParse(txtstockcritico.Text, out stoc);
                stock_cri = stoc;
                catego = txtcategoria.Text;

                if (cod_produc == 0 || txtdescripcion.Text == "" || precio_compa == 0 || precio_vent == 0 || stock == 0 || stock_cri == 0 || txtcategoria.Text == "")
                {
                    lblmensaje.Text = "Debe buscar El Producto antes de Modificar";
                }
                else
                {
                    if (txtfechavenci.Text == "")
                    {
                        if (produc.ActualizarProducto(cod_produc, fecha, descrip, precio_compa, precio_vent, stock, stock_cri, catego))
                        {
                            lblmensaje.Text = "Producto Actualizado";
                        }
                        else
                        {
                            lblmensaje.Text = "Error Al Actualizar";
                        }
                    }
                    else
                    {
                        if (produc.ActualizarProducto(cod_produc, fecha_venci, descrip, precio_compa, precio_vent, stock, stock_cri, catego))
                        {
                            lblmensaje.Text = "Producto Actualizado";
                        }
                        else
                        {
                            lblmensaje.Text = "Error Al Actualizar";
                        }
                    }
                    con.getConection().Close();
                    LimpiarCampos();
                    ListarProducto();
                    cbonomprove.Enabled = true;
                    btnRegistrar.Enabled = true;
                }

            }
            catch (Exception ex)
            {
                lblmensaje.Text = "" + ex;
            }

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                int cod_produc, cod_prod;
                int.TryParse(txtcodproducto.Text, out cod_prod); //cambio en original
                cod_produc = cod_prod;

                if (cod_produc == 0)
                {
                    lblmensaje.Text = "Debe ingresar el producto que desea Eliminar";
                }
                else
                {
                    if (produc.EliminarProducto(cod_produc))
                    {
                        lblmensaje.Text = "Producto Eliminado";
                    }
                    else
                    {
                        lblmensaje.Text = "Error Al Eliminar";
                    }
                    LimpiarCampos();
                    ListarProducto();
                }

            }
            catch (Exception ex)
            {

                lblmensaje.Text = "Error " + ex;
            }

        }

        protected void btnBuscar_Click1(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM Productos WHERE cod_producto=@cod_producto";
            SqlCommand cmd = new SqlCommand(sql, con.getConection());
            cmd.Parameters.AddWithValue("@cod_producto", txtcodproducto.Text);
            SqlDataReader registro = cmd.ExecuteReader();
            while (registro.Read() == true)
            {
                cbonomprove.Text = registro["nombre_proveedor"].ToString();
                txtcodprove.Text = registro["cod_proveedor"].ToString();
                txtfechavenci.Text = registro["fecha_vencimiento"].ToString();
                txtdescripcion.Text = registro["descripcion"].ToString();
                txtprecio_comp.Text = registro["precio_compra"].ToString();
                txtprecioventa.Text = registro["precio_venta"].ToString();
                txtstock.Text = registro["stock"].ToString();
                txtstockcritico.Text = registro["stock_critico"].ToString();
                txtcategoria.Text = registro["categoria"].ToString();
                cbonomprove.Enabled = false;
                btnRegistrar.Enabled = false;
            }
            con.getConection().Close();
            lblmensaje.Text = "";
        }

        public void ListarProducto()
        {
            string sql = "SELECT cod_producto,nombre_proveedor,fecha_vencimiento,descripcion,precio_compra,precio_venta,stock,stock_critico,categoria FROM Productos";
            SqlDataAdapter da = new SqlDataAdapter(sql, con.getConection());
            DataTable dt = new DataTable();
            da.Fill(dt);
            this.grProductos.DataSource = (dt);
            grProductos.DataBind();

        }

        protected void btnBuscarProve_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM registro_proveedores WHERE nombre_proveedor=@nom_prove";
            SqlCommand cmd = new SqlCommand(sql, con.getConection());
            cmd.Parameters.AddWithValue("@nom_prove", cbonomprove.SelectedValue);
            SqlDataReader registro = cmd.ExecuteReader();
            while (registro.Read() == true)
            {
                txtcodprove.Text = registro["cod_proveedor"].ToString();
            }
            con.getConection().Close();
        }

      

        
    }
}