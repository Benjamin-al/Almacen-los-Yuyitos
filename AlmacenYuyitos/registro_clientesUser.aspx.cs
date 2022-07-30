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
    public partial class registro_clienteUser : System.Web.UI.Page
    {
        Cliente cli = new Cliente();
        DetalleVentaTemp Det = new DetalleVentaTemp();
        Coneccion cn = new Coneccion();

        protected void Page_Load(object sender, EventArgs e)
        {
            //limpiarTabla();

        }

        public void BloquearLecturaDetextBox2()
        {
            Txtnombreb.ReadOnly = true;
            Txtapellidob.ReadOnly = true;
            txtrut.ReadOnly = true;
            cbogenerob.Enabled = false;
            Txttelefonob.ReadOnly = true;
            cboestadob.Enabled = false;
        }

        public void BloquearLecturaDetextBox()
        {
            txtnombre.ReadOnly = true;
            txtapellido.ReadOnly = true;
            txtrut.ReadOnly = true;
            cboGenero.Enabled = false;
            txttelefono.ReadOnly = true;
            cboEstado.Enabled = false;
        }

        public void LimpiarCampos()
        {
            txtnombre.Text = "";
            Txtnombreb.Text = "";
            txttelefono.Text = "";
            Txttelefonob.Text = "";
            txtapellido.Text = "";
            Txtapellidob.Text = "";
            txtIdcli.Text = "";
            txtrut.Text = "";
            lblMensaje.Text = "";
            LblMensajeActualizar.Text = "";
            lblmensajeerror.Text = "";
            LblmensajeFiado.Text = "";
            LblMensajeFiado2.Text = "";
            cboProducto.Focus();
            txtdescripcion.Text = "";
            txtStock.Text = "";
            txtcantidad.Text = "";
            txtprecioventa.Text = "";
        }

        public void LimpiarCampoProducto()
        {
            cboProducto.Focus();
            txtdescripcion.Text = "";
            txtStock.Text = "";
            txtcantidad.Text = "";
            txtprecioventa.Text = "";
        }

        public void DesbloquearCampos()
        {
            txtnombre.ReadOnly = false;
            txtapellido.ReadOnly = false;
            txtrut.ReadOnly = false;
            cboGenero.Enabled = true;
            txttelefono.ReadOnly = false;
            cboEstado.Enabled = true;
            Txtnombreb.ReadOnly = false;
            Txtapellidob.ReadOnly = false;
            txtrut.ReadOnly = false;
            cbogenerob.Enabled = true;
            Txttelefonob.ReadOnly = false;
            cboestadob.Enabled = true;
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM Productos WHERE cod_producto=@cod_producto";
            SqlCommand cmd = new SqlCommand(sql, cn.getConection());
            cmd.Parameters.AddWithValue("@cod_producto", cboProducto.Text);
            SqlDataReader registro = cmd.ExecuteReader();
            while (registro.Read() == true)
            {
                cboProducto.Text = registro["cod_producto"].ToString();
                txtdescripcion.Text = registro["descripcion"].ToString();
                txtprecioventa.Text = registro["precio_venta"].ToString();
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
                codPro = int.Parse(cboProducto.Text);
                des = txtdescripcion.Text;
                int.TryParse(txtprecioventa.Text, out pv);
                precio = pv;
                stock = s - c;
                cant = c;
                fecha_venta = "" + DateTime.Now;

                if (cant == 0 || s == 0)
                {
                    lblmensajeerror.Text = "Cantidad / stock insuficiente";
                }
                else
                {
                    if (Det.InsertarProductoTemp(codPro, des, precio, stock, cant, fecha_venta))
                    {

                        lblMensaje.Text = "Producto Agregado";
                        ListarProducto();
                        BtnGenerarFiado.Enabled = true;
                        BtnGenerarFiado2.Enabled = true;
                        LimpiarCampoProducto();
                    }
                    else
                    {
                        lblMensaje.Text = "Error Al Agregar";
                        LimpiarCampoProducto();
                    }
                    lblmensajeerror.Text = "";
                }
            }
            catch (Exception ex)
            {

                lblMensaje.Text = "El Error Producido Es: " + ex;
                LimpiarCampos();
            }
        }

        private void calculateSum()
        {

            int rowCount = GrTablaVentaFiado.Rows.Count;

            if (rowCount == 0)
            {
                GrTablaVentaFiado.Visible = false;
            }
            else
            {
                GrTablaVentaFiado.Visible = true;
                Int64 grandtotal = 0;
                foreach (GridViewRow row in GrTablaVentaFiado.Rows)
                {

                    grandtotal = grandtotal + Convert.ToInt64(row.Cells[8].Text);
                }
                GrTablaVentaFiado.FooterRow.Cells[7].Text = "Total a pagar";
                GrTablaVentaFiado.FooterRow.Cells[8].Text = grandtotal.ToString();
            }
        }

        public void ListarProducto()
        {
            GrTablaVentaFiado.DataBind();
        }

        private void limpiarTabla()
        {
            string sql = "delete from detalle_de_factura";
            SqlCommand cmd = new SqlCommand(sql, cn.getConection());
            cmd.ExecuteNonQuery();
        }

        protected void GrTablaVenta_DataBound(object sender, EventArgs e)
        {
            calculateSum();
        }

        public void TRegistrovisible()
        {
            PRegisroCliente.Style["Display"] = "normal";
        }

        public void TProductoVisible()
        {
            PRegistroDeProducto.Style["Display"] = "normal";

        }

        public void OcultarPanelRegistro()
        {
            PRegisroCliente.Style["Display"] = "none";
            PRegistroDeProducto.Style["Display"] = "none";
            PBtnVender.Style["Display"] = "none";
        }



        protected void BtnRegistroVisible_Click(object sender, EventArgs e)
        {
            limpiarTabla();
            ListarProducto();
            LimpiarCampos();
            DesbloquearCampos();
            PClientePorBusqueda.Style["Display"] = "none";
            panelDeBusqueda.Style["Display"] = "none";
            PRegistroDeProducto.Style["Display"] = "none";
            TRegistrovisible();
            cboGenero.Enabled = true;
            cboEstado.Enabled = true;
            PBtnVender.Style["Display"] = "normal";
            PBtnVender2.Style["Display"] = "none";
        }

        protected void BtnBusquedaVisible_Click(object sender, EventArgs e)
        {
            limpiarTabla();
            ListarProducto();
            LimpiarCampos();
            DesbloquearCampos();
            OcultarPanelRegistro();
            panelDeBusqueda.Style["display"] = "normal";
            PBtnVender2.Style["Display"] = "normal";
            PBtnVender.Style["Display"] = "none";
        }

        protected void BtnRegistro_Click(object sender, EventArgs e)
        {
            try
            {

                string nombre, apellido, rut, genero, telefono, estado;


                nombre = txtnombre.Text;
                apellido = txtapellido.Text;
                rut = txtrut.Text;
                genero = cboGenero.Text;
                telefono = txttelefono.Text;
                estado = cboEstado.Text;
                if (nombre.Equals("") || apellido.Equals("") || rut.Equals("") || telefono.Equals(""))
                {
                    lblMensaje.Text = "Error Al Registrar, campos vacios";
                }
                else
                {
                    if (!cli.ExisteCliente(rut))
                    {

                        if (cli.InsertarCliente(nombre, apellido, rut, genero, telefono, estado))
                        {
                            lblMensaje.Text = "Cliente registrado";
                            if (estado == "Desautorizado")
                            {

                                PRegistroDeProducto.Style["Display"] = "none";
                            }
                            else
                            {
                                CboBuscarRut.DataBind(); //Aplicar en los demas cbos
                                BloquearLecturaDetextBox();
                                TProductoVisible();
                                lblMensaje.Text = "Puede registrar productos para fiar";
                            }
                        }
                        else
                        {
                            lblMensaje.Text = "Error Al Registrar, rut duplicado";
                        }

                    }
                    else
                    {//en caso contrario este ya exciste y no se agregaria 
                        lblMensaje.Text = "El cliente ya existe , realize la compra desde busqueda de cliente";
                    }
                    cn.getConection().Close();
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error producido: " + ex;
            }
        }


        protected void BtnOcultarRegistro1(object sender, EventArgs e)
        {
            limpiarTabla();
            ListarProducto();
            OcultarPanelRegistro();
            LimpiarCampos();
        }

        protected void BtnOcultarBusqueda1(object sender, EventArgs e)
        {
            limpiarTabla();
            ListarProducto();
            LimpiarCampos();
            PClientePorBusqueda.Style["display"] = "none";
            panelDeBusqueda.Style["display"] = "none";
            PRegistroDeProducto.Style["display"] = "none";
            PBtnVender.Style["Display"] = "none";
            PBtnVender2.Style["Display"] = "none";
        }

        protected void BtnBuscarRut_Click(object sender, EventArgs e)
        {
            PClientePorBusqueda.Style["display"] = "normal";
            string sql = "SELECT * FROM clientes WHERE rut=@rut";
            SqlCommand cmd = new SqlCommand(sql, cn.getConection());
            cmd.Parameters.AddWithValue("@rut", CboBuscarRut.Text);
            SqlDataReader cli = cmd.ExecuteReader();
            while (cli.Read() == true)
            {
                txtIdcli.Text = cli["id_cliente"].ToString();
                Txtnombreb.Text = cli["nombre"].ToString();
                Txtapellidob.Text = cli["apellido"].ToString();
                cbogenerob.Text = cli["genero"].ToString();
                Txttelefonob.Text = cli["telefono"].ToString();
                cboestadob.Text = cli["estado"].ToString();
            }
            cn.getConection().Close();

        }


        protected void BtnGenerarFiado_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime today = DateTime.Now;
                DateTime answer = today.AddDays(90);
                string nombre, apellido, rut, genero, telefono, fecha_de_fiado, fecha_de_pago, estado;
                nombre = txtnombre.Text;
                apellido = txtapellido.Text;
                rut = txtrut.Text;
                genero = cboGenero.Text;
                telefono = txttelefono.Text;
                estado = cboEstado.Text;
                fecha_de_fiado = "" + DateTime.Now;
                fecha_de_pago = "" + answer; // Agregar suma de 3 meses

                string sql = "INSERT INTO registro_clientes (nombre, apellido, rut, genero,telefono,fecha_de_fiado,fecha_de_pago, cod_producto,descripcion_producto,precio_venta,stock,cantidad, total_a_pagar,estado)" +
                        " VALUES (@nombre,@apellido,@rut,@genero,@telefono,@fecha_de_fiado,@fecha_de_pago,@cod_producto,@descripcion_producto,@precio_venta,@stock,@cantidad,@total_a_pagar,@estado)";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());

                foreach (GridViewRow row in GrTablaVentaFiado.Rows)
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@nombre", nombre);
                    cmd.Parameters.AddWithValue("@apellido", apellido);
                    cmd.Parameters.AddWithValue("@rut", rut);
                    cmd.Parameters.AddWithValue("@genero", genero);
                    cmd.Parameters.AddWithValue("@telefono", telefono);
                    cmd.Parameters.AddWithValue("@fecha_de_fiado", fecha_de_fiado);
                    cmd.Parameters.AddWithValue("@fecha_de_pago", fecha_de_pago);
                    cmd.Parameters.AddWithValue("@cod_producto", Convert.ToInt32(row.Cells[2].Text));
                    cmd.Parameters.AddWithValue("@descripcion_producto", Convert.ToString(row.Cells[3].Text));
                    cmd.Parameters.AddWithValue("@precio_venta", Convert.ToInt32(row.Cells[4].Text));
                    cmd.Parameters.AddWithValue("@stock", Convert.ToInt32(row.Cells[5].Text));
                    cmd.Parameters.AddWithValue("@cantidad", Convert.ToInt32(row.Cells[6].Text));
                    cmd.Parameters.AddWithValue("@total_a_pagar", Convert.ToString(row.Cells[8].Text));
                    cmd.Parameters.AddWithValue("@estado", estado);
                    int s = Convert.ToInt32(row.Cells[5].Text);
                    Det.ActualizarStock(Convert.ToInt32(row.Cells[2].Text), s);
                    cmd.ExecuteNonQuery();
                }
                limpiarTabla();
                cboProducto.Focus();
                GrTablaVentaFiado.DataBind();//F5 de tabla, para volver a cargar la tabla
                LblmensajeFiado.Text = "Registro de fiado Completo";
                lblMensaje.Text = "";
                lblmensajeerror.Text = "";
                DesbloquearCampos();
                PRegisroCliente.Style["Display"] = "none";
                PRegistroDeProducto.Style["Display"] = "none";
                PBtnVender.Style["Display"] = "none";
                BtnGenerarFiado.Enabled = false;
                BtnGenerarFiado2.Enabled = false;
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error producido: " + ex;
            }
        }

        protected void BtnPanelDeproductos_Click(object sender, EventArgs e)
        {

            string estado;
            estado = cboestadob.Text;


            if (estado == "Desautorizado")
            {
                LblMensajeActualizar.Text = "Estado desautorizado";
                PRegistroDeProducto.Style["Display"] = "none";
            }
            else
            {
                BloquearLecturaDetextBox2();
                BloquearLecturaDetextBox();
                PRegistroDeProducto.Style["Display"] = "normal";
                LblMensajeActualizar.Text = "Puede registrar productos para fiar";
            }
        }


        protected void BtnModificar_Click(object sender, EventArgs e)
        {

            try
            {
                string nom, ape, ru, gen, tel, est;
                int id_cli;

                id_cli = int.Parse(txtIdcli.Text);
                nom = Txtnombreb.Text;
                ape = Txtapellidob.Text;
                ru = CboBuscarRut.Text;
                gen = cboGenero.Text;
                tel = Txttelefonob.Text;
                est = cboestadob.Text;


                if (cli.ActualizarCliente(id_cli, nom, ape, ru, gen, tel, est))
                {
                    LblMensajeActualizar.Text = "Cliente Actualizado";
                }
                else
                {
                    LblMensajeActualizar.Text = "Error Al Actualizar";
                }
                cn.getConection().Close();

            }
            catch (Exception ex)
            {
                lblMensaje.Text = "" + ex;
            }
        }

        protected void BtnGenerarFiado2_Click(object sender, EventArgs e)
        {
            try
            {

                DateTime today = DateTime.Now;
                DateTime answer = today.AddDays(90);
                string nombre, apellido, rut, genero, telefono, fecha_de_fiado, fecha_de_pago, estado;



                nombre = Txtnombreb.Text;
                apellido = Txtapellidob.Text;
                rut = CboBuscarRut.Text;
                genero = cbogenerob.Text;
                telefono = Txttelefonob.Text;
                estado = cboestadob.Text;
                fecha_de_fiado = "" + DateTime.Now;
                fecha_de_pago = "" + answer; // Agregar suma de 3 meses

                string sql = "INSERT INTO registro_clientes (nombre, apellido, rut, genero,telefono,fecha_de_fiado,fecha_de_pago, cod_producto,descripcion_producto,precio_venta,stock,cantidad, total_a_pagar,estado)" +
                        " VALUES (@nombre,@apellido,@rut,@genero,@telefono,@fecha_de_fiado,@fecha_de_pago,@cod_producto,@descripcion_producto,@precio_venta,@stock,@cantidad,@total_a_pagar,@estado)";
                SqlCommand cmd = new SqlCommand(sql, cn.getConection());

                foreach (GridViewRow row in GrTablaVentaFiado.Rows)
                {

                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@nombre", nombre);
                    cmd.Parameters.AddWithValue("@apellido", apellido);
                    cmd.Parameters.AddWithValue("@rut", rut);
                    cmd.Parameters.AddWithValue("@genero", genero);
                    cmd.Parameters.AddWithValue("@telefono", telefono);
                    cmd.Parameters.AddWithValue("@fecha_de_fiado", fecha_de_fiado);
                    cmd.Parameters.AddWithValue("@fecha_de_pago", fecha_de_pago);
                    cmd.Parameters.AddWithValue("@cod_producto", Convert.ToInt32(row.Cells[2].Text));
                    cmd.Parameters.AddWithValue("@descripcion_producto", Convert.ToString(row.Cells[3].Text));
                    cmd.Parameters.AddWithValue("@precio_venta", Convert.ToInt32(row.Cells[4].Text));
                    cmd.Parameters.AddWithValue("@stock", Convert.ToInt32(row.Cells[5].Text));
                    cmd.Parameters.AddWithValue("@cantidad", Convert.ToInt32(row.Cells[6].Text));
                    cmd.Parameters.AddWithValue("@total_a_pagar", Convert.ToString(row.Cells[8].Text));
                    cmd.Parameters.AddWithValue("@estado", estado);
                    int s = Convert.ToInt32(row.Cells[5].Text);
                    Det.ActualizarStock(Convert.ToInt32(row.Cells[2].Text), s);
                    cmd.ExecuteNonQuery();


                }

                limpiarTabla();
                GrTablaVentaFiado.DataBind();
                panelDeBusqueda.Style["display"] = "none";
                PClientePorBusqueda.Style["display"] = "none";
                PRegistroDeProducto.Style["display"] = "none";
                PBtnVender2.Style["Display"] = "none";
                BtnGenerarFiado.Enabled = false;
                BtnGenerarFiado2.Enabled = false;
                //F5 de tabla, para volver a cargar la tabla
                //LblMensajeFiado2.Text = "Registro de fiado Completo";
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error producido: " + ex;
            }
        }
        
    }
}