using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AlmacenYuyitos
{
    public partial class administracion_informes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (cboinfo.Value.Equals("Seleccione")) {
                lblmensaje.Text = "Debe seleccionar un informe ";
            }else{
            	if(cboinfo.Value.Equals("Informe de ventas")){
            		Response.Redirect("WebInformeVentas.aspx");
                }else if (cboinfo.Value.Equals("Informe de clientes")){
                    Response.Redirect("WebInformeClientes.aspx");
                }else if (cboinfo.Value.Equals("Informe de Pagos de Fiados")){
                    Response.Redirect("WebInformeFiados.aspx");
                }else if (cboinfo.Value.Equals("Informe de productos")) {
                        Response.Redirect("WebInformeProducto.aspx");
                  }else if (cboinfo.Value.Equals("Informe de Pedidos")){
                          Response.Redirect("WebInformePedidos.aspx");
                        }else if(cboinfo.Value.Equals("Informe de proveedores")){
                                Response.Redirect("WebInformeProveedores.aspx");
                            }else if(cboinfo.Value.Equals("Informe de recepción producto")){
                                     Response.Redirect("WebInformeRecepcionProductos.aspx");
                                    }
            }
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }
    }
}