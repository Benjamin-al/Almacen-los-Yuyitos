<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="ventas.aspx.cs" Inherits="AlmacenYuyitos.ventauser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container" style="width: 100%; max-height: 465px; overflow-y: scroll; color:rgba(10, 42, 62,100);">
<h2 class="text-center" style="color:rgba(10, 42, 62,100)">Registrar Venta</h2>
      <div class="row">
         <div class="form-group">
             <div class=" col-lg-2">    
                  <label>N° Boltea</label>
                 <asp:TextBox ID="txtnboleta" runat="server" Enabled="False" CssClass="form-control form-control-sm"></asp:TextBox><br>
             </div>           
         </div>
     </div>  
     <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">                  
                   <label>Codigo de Producto</label> 
                    <asp:DropDownList ID="CboCodProducto"  CssClass="form-control form-control-sm" runat="server" ReadOnly="true" DataSourceID="SqlBusquedaCodpro" DataTextField="cod_producto" DataValueField="cod_producto">
                            <asp:ListItem>Selecione..</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlBusquedaCodpro" runat="server" ConnectionString="<%$ ConnectionStrings:YUYITOSConnectionString %>" SelectCommand="SELECT [cod_producto] FROM [Productos]"></asp:SqlDataSource>

                </div>
                <div class=" col-lg-6">
                    <label>Buscar Información por codigo producto</label> 
                    <asp:Button ID="Button1" runat="server" Text="Buscar"  CssClass="btn btn-md btn-block btn-warning" OnClick="Buscar_Click"  />
                </div>
            </div>
        </div>
        <br />
         <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">
                   <label>Descripcion</label> 
                   <asp:TextBox ID="txtDescripcionProdVenta" runat="server" ReadOnly ="true" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                <div class=" col-lg-6">
                    <label>Precio</label> 
                    <asp:TextBox ID="txtPrecioVenta"  runat="server" ReadOnly ="true" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">
                    <label>Stock</label>
                    <asp:TextBox ID="txtStock" runat="server" ReadOnly="true" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                <div class=" col-lg-6">
                    <label>Cantidad</label>
                    <asp:TextBox ID="txtcantidad" runat="server" CssClass="form-control form-control-sm" TextMode="Number" placeholder="Numeral"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />       
        <div class="form-group">
	        <asp:Label ID="lblmensaje" Style="color: #a74500; font-size:18px;" runat="server" Text=""></asp:Label>
        </div>
        <div class="form-group">
             <asp:Button ID="Button2" runat="server" Text="Agregar" CssClass="btn btn-md btn-block btn-info" OnClick="VentaTemp_Click" />
        </div>
        <div class="form-group">
            <asp:Button id="BtnVender" Style="display: none;" runat="server" Text="Vender" CssClass="btn btn-md btn-block btn-success" OnClick="BtnVender_Click" OnClientClick="return confirm('Confirmar Compra');"/>

        </div>
        <br />

    <div class="container" style="width: 100%; max-height: 200px; overflow-y: scroll;">
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GrVentaTemp" CssClass="table table-responsive" runat="server" AutoGenerateColumns="False" DataKeyNames="id_ventas" DataSourceID="SqTablaTempV"  BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Size="X-Small" OnDataBound="GrVentaTemp_DataBound" ShowFooter="True" AllowPaging="True" PageSize="6" BackColor="#CCCCCC">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="id_ventas" HeaderText="id_ventas" InsertVisible="False" ReadOnly="True" SortExpression="id_ventas" />
                        <asp:BoundField DataField="cod_producto" HeaderText="cod_producto" SortExpression="cod_producto" />
                        <asp:BoundField DataField="descripcion_producto" HeaderText="descripcion_producto" SortExpression="descripcion_producto" />
                        <asp:BoundField DataField="precio_venta" HeaderText="precio_venta" SortExpression="precio_venta" />
                        <asp:BoundField DataField="stock" HeaderText="stock" SortExpression="stock" />
                        <asp:BoundField DataField="cantidad" HeaderText="cantidad" SortExpression="cantidad" />
                        <asp:BoundField DataField="fecha_venta" HeaderText="fecha_venta" SortExpression="fecha_venta" />
                        <asp:BoundField DataField="Expr1" HeaderText="Sub Total" ReadOnly="True" SortExpression="Expr1" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#2a2a2a" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqTablaTempV" runat="server" ConnectionString="<%$ ConnectionStrings:YUYITOSConnectionString %>" DeleteCommand="DELETE FROM [detalle_de_factura] WHERE [id_ventas] = @id_ventas" SelectCommand="SELECT id_ventas, cod_producto, descripcion_producto, precio_venta, stock, cantidad, fecha_venta, precio_venta * cantidad AS Expr1 FROM detalle_de_factura">
                    <DeleteParameters>
                        <asp:Parameter Name="id_ventas" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
    <br />    
</div>     
</asp:Content>
