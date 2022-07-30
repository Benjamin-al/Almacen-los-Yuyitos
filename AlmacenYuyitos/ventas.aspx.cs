using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using biblioteca_los_yuyitos;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace AlmacenYuyitos
{
    public partial class ventauser : System.Web.UI.Page
    {
        RegistroVenta RegVenta = new RegistroVenta();
        DetalleVentaTemp Det = new DetalleVentaTemp();
        Coneccion cn = new Coneccion();


        protected void Page_Load(object sender, EventArgs e)
        {
            txtnboleta.Text = RegVenta.nBoleta();
        }

        public void LimpiarCampos()
        {

            CboCodProducto.Focus();
            txtDescripcionProdVenta.Text = "";
            txtStock.Text = "";
            txtcantidad.Text = "";
            txtPrecioVenta.Text = "";
        }

        protected void Buscar_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM Productos WHERE cod_producto=@cod_producto";
            SqlCommand cmd = new SqlCommand(sql, cn.getConection());
            cmd.Parameters.AddWithValue("@cod_producto", CboCodProducto.Text);
            SqlDataReader registro = cmd.ExecuteReader();
            while (registro.Read() == true)
            {
                CboCodProducto.Text = registro["cod_producto"].ToString();
                txtDescripcionProdVenta.Text = registro["descripcion"].ToString();
                txtPrecioVenta.Text = registro["precio_venta"].ToString();
                txtStock.Text = registro["stock"].ToString();
            }
            cn.getConection().Close();
        }

        protected void VentaTemp_Click(object sender, EventArgs e)
        {

            try
            {

                string des, fecha_venta;
                int codPro, stock, cant, precio;
                int c, pv, s;

                int.TryParse(txtStock.Text, out s);
                int.TryParse(txtcantidad.Text, out c);
                codPro = int.Parse(CboCodProducto.Text);
                des = txtDescripcionProdVenta.Text;
                int.TryParse(txtPrecioVenta.Text, out pv);
                precio = pv;
                stock = s - c;
                cant = c;
                fecha_venta = "" + DateTime.Now;

                if (cant == 0|| s <= 0)
                {
                    lblmensaje.Text = "Ingrese Cantidad / Stock insuficiente";
                }
                else
                {
                    if (Det.InsertarProductoTemp(codPro, des, precio, stock, cant, fecha_venta))
                    {
                        LimpiarCampos();
                        ListarProducto();
                        lblmensaje.Text = "";
                        BtnVender.Style["Display"] = "normal";
                    }
                    else
                    {
                        lblmensaje.Text = "Error Al Agregar";
                        LimpiarCampos();
                    }
                }
            }
            catch (Exception ex)
            {

                lblmensaje.Text = "El Error Producido Es: " + ex;
                LimpiarCampos();
            }
        }

        public void ListarProducto()
        {
            GrVentaTemp.DataBind();

        }

      

        protected void BtnVender_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = "INSERT INTO registro_ventas (cod_producto,numero_boleta,descripcion_producto,precio_venta,stock,cantidad, fecha_venta,total_a_pagar)" +
                        " VALUES (@cod_producto,@num_boleta,@descripcion_producto,@precio_venta,@stock,@cantidad,@fecha_venta,@total_a_pagar)";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());
                string nboleta = txtnboleta.Text;
                
                foreach (GridViewRow row in GrVentaTemp.Rows)
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@cod_producto", Convert.ToInt32(row.Cells[2].Text));
                    cmd.Parameters.AddWithValue("@num_boleta", nboleta);
                    cmd.Parameters.AddWithValue("@descripcion_producto", Convert.ToString(row.Cells[3].Text));
                    cmd.Parameters.AddWithValue("@precio_venta", Convert.ToInt32(row.Cells[4].Text));
                    cmd.Parameters.AddWithValue("@stock", Convert.ToInt32(row.Cells[5].Text));
                    cmd.Parameters.AddWithValue("@cantidad", Convert.ToInt32(row.Cells[6].Text));
                    cmd.Parameters.AddWithValue("@fecha_venta", Convert.ToString(row.Cells[7].Text));
                    cmd.Parameters.AddWithValue("@total_a_pagar", Convert.ToString(row.Cells[8].Text));
                    int s = Convert.ToInt32(row.Cells[5].Text);
                    int codp=Convert.ToInt32(row.Cells[2].Text);
                    Det.ActualizarStock(codp, s);
                    cmd.ExecuteNonQuery();
                }
                limpiarTabla();
                ListarProducto();
                BtnVender.Style["Display"] = "none";
            }
            catch (Exception ex)
            {

                lblmensaje.Text = "El Error Producido Es: " + ex;
                LimpiarCampos();

            }
        }

        private void calculateSum()
        {

            int rowCount = GrVentaTemp.Rows.Count;

            if (rowCount == 0)
            {
                GrVentaTemp.Visible = false;
            }
            else
            {
                GrVentaTemp.Visible = true;
                Int64 grandtotal = 0;
                foreach (GridViewRow row in GrVentaTemp.Rows)
                {

                    grandtotal = grandtotal + Convert.ToInt64(row.Cells[8].Text);
                }
                GrVentaTemp.FooterRow.Cells[7].Text = "Total a pagar";
                GrVentaTemp.FooterRow.Cells[8].Text = grandtotal.ToString();
            }
        }

        private void limpiarTabla()
        {
            string sql = "delete from detalle_de_factura";
            SqlCommand cmd = new SqlCommand(sql, cn.getConection());
            cmd.ExecuteNonQuery();
        }


        protected void GrVentaTemp_DataBound(object sender, EventArgs e)
        {
            calculateSum();
        }

    }
}