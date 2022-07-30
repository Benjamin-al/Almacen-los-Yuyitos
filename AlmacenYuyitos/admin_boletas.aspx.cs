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
    public partial class admin_boletas : System.Web.UI.Page
    {
        Coneccion cn = new Coneccion();
        AdministrarBoletas adminb = new AdministrarBoletas();
        protected void Page_Load(object sender, EventArgs e)
        {

            listar_boleta();
            txtnumventa.Enabled = false;
            txtcodproduc.Enabled = false;
            txtprecioventa.Enabled = false;
            txtstock.Enabled = false;
            txtfecha.Enabled = false;
        }

        public void Tvisible()
        {
            PanelVentasR.Style["Display"] = "normal";
        }

        //nuevo
        public void TInvisible()
        {
            PanelVentasR.Style["Display"] = "none";
            lblmensaje.Text = "";
        }

      
        //fin de nuevo
        public void limpiarCampos()
        {
            txtnumventa.Text = "";
            txtcodproduc.Text = "";
            txtdescripcion.Text = "";
            txtstock.Text = "";
            txtcantidad.Text = "";
            txtfecha.Text = "";
            txttotal.Text = "";
            txtprecioventa.Text = "";
        }

        //funcion listar todas las boletas
        public void listar_boleta()
        {
           string sql = "SELECT id_ventas ,cod_producto,numero_boleta,descripcion_producto,precio_venta,cantidad,fecha_venta,total_a_pagar FROM registro_ventas";
           SqlDataAdapter da = new SqlDataAdapter(sql, cn.getConection());
           DataTable dt = new DataTable();
           da.Fill(dt);
           this.gridBoletas.DataSource = (dt);
           gridBoletas.DataBind();
        }
        //fin boton

        //boton listar boletas buscadas por su numero 
        public void listarBoletaPorNumeroBoleta() {
            try
            {
                Tvisible();
                string sql = "select * from registro_ventas  where numero_boleta = '" + txtnuemeroboleta.Text + "'";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                grboletabuscada.DataSource = dt;
                ActualizarGrid();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        //fin boton

        //boton eliminar boleta por numero de boleta 
        protected void btneliminar_Click(object sender, EventArgs e)
        {
            try
            {
                string nboleta; 
                nboleta = txtnuemeroboleta.Text; //cambiar en original
                if (nboleta == "")
                {
                    lblmensaje.Text = "Debe ingresar el numero de la venta antes de Eliminar";
                }
                else
                {

                    if (adminb.EliminarBoleta(nboleta))
                    {
                        lblmensaje.Text = "Boleta Eliminada";
                  
                    }
                    else
                    {
                        lblmensaje.Text = "Error Al Eliminar";
                    }
                    ActualizarGrid();
                    limpiarCampos();
                    listar_boleta();
                    
                }
            }
            catch (Exception ex)
            {

                lblmensaje.Text = "El Error Producido Es: " + ex;
            }
        }
        //fin boton

        public void ActualizarGrid()
        {
            grboletabuscada.DataBind();

        }
        protected void btnbuscar_Click(object sender, EventArgs e)
        {
        
            try
            {
                Tvisible();
                listarBoletaPorNumeroBoleta();
                ActualizarGrid();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnOcultar2_Click(object sender, EventArgs e)
        {
            TInvisible();
        }

        protected void btnbuscaridventa_Click(object sender, EventArgs e)
        {
            //Tvisible();
            string sql = "SELECT * FROM registro_ventas WHERE id_ventas=@idventa";
            SqlCommand cmd = new SqlCommand(sql, cn.getConection());
            cmd.Parameters.AddWithValue("@idventa", txtidventa.Text);
            SqlDataReader registro = cmd.ExecuteReader();
            if (registro.Read() == true)
            {
                txtnumventa.Text = registro["id_ventas"].ToString();
                txtcodproduc.Text = registro["cod_producto"].ToString();
                txtdescripcion.Text = registro["descripcion_producto"].ToString();
                txtprecioventa.Text = registro["precio_venta"].ToString();
                txtstock.Text = registro["stock"].ToString();
                txtcantidad.Text = registro["cantidad"].ToString();
                txtfecha.Text = registro["fecha_venta"].ToString();
                txttotal.Text = registro["total_a_pagar"].ToString();
                lblmensaje.Text = "";
            }
            else
            {
                lblmensaje.Text = "Boleta no encontrada";
            }

            cn.getConection().Close();
        }

        protected void btnmodificaridventa_Click1(object sender, EventArgs e)
        {

            try
            {
                Tvisible();
                //creamos variables
                string descripcion, fecha;
                int id_venta, cod_producto, precio_venta, stock, cantidad, total_pagar;
                int id_v, cod_p, precio_v, sto, cant, tot;

                //asociamos las variables con los campos de textos
                int.TryParse(txtnumventa.Text, out id_v);
                id_venta = id_v;
                int.TryParse(txtcodproduc.Text, out cod_p);
                cod_producto = cod_p;
                descripcion = txtdescripcion.Text;
                int.TryParse(txtprecioventa.Text, out precio_v);
                precio_venta = precio_v;
                int.TryParse(txtstock.Text, out sto);
                stock = sto;
                int.TryParse(txtcantidad.Text, out cant);
                cantidad = cant;
                fecha = txtfecha.Text;
                int.TryParse(txttotal.Text, out tot);
                total_pagar = tot;

                if (txtdescripcion.Text == "" || cant == 0 || total_pagar == 0)
                {
                    lblmensaje.Text = "Debe ingresar el numero de la compra antes de Modificar";
                }
                else
                {
                    //llamamos al metodo insertar y validamos que se cumpla correcatamente
                    if (adminb.ActualizarBoleta(id_venta, cod_p, descripcion, precio_venta, stock, cant, fecha, total_pagar))
                    {
                        lblmensaje.Text = "Boleta Actualizado";
                    
                    }
                    else
                    {
                        lblmensaje.Text = "Error Al Actualizar";
                    }
                    ActualizarGrid();
                    limpiarCampos();//limpiamos los campos despues que re realisa el registro
                    listar_boleta();
                    listarBoletaPorNumeroBoleta();
                }

            }
            catch (Exception ex)
            {

                lblmensaje.Text = "El Error Producido Es: " + ex;
            }
        }

        protected void btneliminaridventa_Click(object sender, EventArgs e)
        {
            try
            {
                //Tvisible();
                int id_v, id_venta;
                int.TryParse(txtidventa.Text, out id_v); //cambiar en original
                id_venta = id_v;
                if (id_venta == 0)
                {
                    lblmensaje.Text = "Debe ingresar el numero de la venta antes de Eliminar";
                }
                else
                {

                    if (adminb.EliminarProducto(id_venta))
                    {
                        lblmensaje.Text = "Boleta Eliminada";
                    }
                    else
                    {
                        lblmensaje.Text = "Error Al Eliminar";
                    }
                    ActualizarGrid();
                    limpiarCampos();
                    listar_boleta();
                    listarBoletaPorNumeroBoleta();
                }
            }
            catch (Exception ex)
            {

                lblmensaje.Text = "El Error Producido Es: " + ex;
            }

        }


    }
}