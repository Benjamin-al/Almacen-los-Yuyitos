<%@ Page Title="" Language="C#" MasterPageFile="~/masterUser.Master" AutoEventWireup="true" CodeBehind="registro_clientesUser.aspx.cs" Inherits="AlmacenYuyitos.registro_clienteUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container" style="width: 100%; max-height: 465px; overflow-y: scroll; color: rgba(10, 42, 62,100);">
        <h2 class="text-center" style="color:rgba(10, 42, 62,100)">Registro de Cliente y fiado</h2>
        <br/>
        <div class="panel panel-body" style="background: #cdcf9c">
            <div class="row">
                <div class="form-group">
                    <div class=" col-lg-4">
                        <label>Registro de cliente</label>
                    </div>
                    <div class="col-lg-4">
                        <asp:Button ID="BtnRegistroVisible" runat="server" Text="Panel de registro" OnClick="BtnRegistroVisible_Click" CssClass="btn btn-md btn-block btn-info" />
                    </div>
                    <div class="col-lg-4">
                        <asp:Button ID="BtnOcultarRegistro" runat="server" Text="Ocultar Panel" OnClick="BtnOcultarRegistro1" CssClass="btn btn-md btn-block btn-primary" />
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="form-group">
                    <div class="col-lg-4">
                        <label>Busqueda de cliente existente</label>
                    </div>
                    <div class="col-lg-4">
                        <asp:Button ID="BtnBusquedaVisible" runat="server" Text="Panel de busqueda" OnClick="BtnBusquedaVisible_Click" CssClass="btn btn-md btn-block btn-info" />
                    </div>
                    <div class="col-lg-4">
                        <asp:Button ID="BtnOcultarBusqueda" runat="server" Text="Ocultar Panel" OnClick="BtnOcultarBusqueda1" CssClass="btn btn-md btn-block btn-primary" />
                    </div>
                </div>
            </div>
        </div>
        <%---------------buscar cliente------------------%>

        <div id="panelDeBusqueda" runat="server" style="display:none">
            <h2 class="text-center" style="color:rgba(10, 42, 62,100)">Busqueda de cliente</h2>
            <div class="row">
                <div class="form-group">
                    <div class="col-lg-6">
                        <label>Rut</label>
                        <asp:DropDownList ID="CboBuscarRut" CssClass="form-control form-control-sm" runat="server" DataSourceID="SqlDBuscarPorRutRCli" DataTextField="rut" DataValueField="rut">
                              </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDBuscarPorRutRCli" runat="server" ConnectionString="<%$ ConnectionStrings:YUYITOSConnectionString %>" SelectCommand="SELECT [rut] FROM [clientes]"></asp:SqlDataSource>
                    </div>
                    <div class="col-lg-6">
                        <label>Buscar por rut</label>
                        <asp:Button ID="BtnBuscarPorRut" runat="server" Text="Buscar Cliente" OnClick="BtnBuscarRut_Click" CssClass="btn btn-md btn-block btn-warning" />
                    </div>
                </div>
            </div>
            <br />
            <div id="PClientePorBusqueda" runat="server" style="display: none">
                <div class="row">
                    <div class="form-group">
                        <div class=" col-lg-6">
                            <label>Nombre</label>
                            <asp:TextBox ID="Txtnombreb" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                        <div class=" col-lg-6">
                            <label>Telefono</label>
                            <asp:TextBox ID="Txttelefonob" runat="server" MaxLength="12" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="form-group">
                        <div class=" col-lg-6">
                            <label>Apellido</label>
                            <asp:TextBox ID="Txtapellidob" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                        <div class=" col-lg-6">
                            <label>Genero</label>
                            <asp:DropDownList ID="cbogenerob" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem>Masculino</asp:ListItem>
                                <asp:ListItem>Femenino</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="form-group">
                        <div class=" col-lg-6">
                            <label>Estado</label>
                            <asp:DropDownList ID="cboestadob" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem>Autorizado</asp:ListItem>
                                <asp:ListItem>Desautorizado</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class=" col-lg-6">
                            <label>Id cliente</label>
                            <asp:TextBox ID="txtIdcli" runat="server" ReadOnly="true" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <br />
                <div class="form-group">
                    <asp:Label ID="LblMensajeActualizar" Style="color: #a74500; font-size: 18px;" runat="server" Text=""></asp:Label>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class=" col-lg-6">
                            <asp:Button ID="BtnModificar" runat="server" Text="Modificar" OnClick="BtnModificar_Click" CssClass="btn btn-md btn-block btn-info" />
                        </div>
                        <div class=" col-lg-6">
                            <asp:Button ID="BtnPanelDeproductos" runat="server" Text="Fiado de Producto" OnClick="BtnPanelDeproductos_Click" CssClass="btn btn-md btn-block btn-success" />
                        </div>
                    </div>
                </div>
                <br />
            </div>

        </div>
        <%---Fin de buscar---%>

        <%----tabla registro cliente----%>
        <div id="PRegisroCliente" runat="server" style="display: none">
            <h2 class="text-center" style="color: rgba(10, 42, 62,100)">Registro de cliente</h2>
            <div class="row">
                <div class="form-group">
                    <div class=" col-lg-6">
                        <label>Nombre</label>
                        <asp:TextBox ID="txtnombre" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class=" col-lg-6">
                        <label>Telefono</label>
                        <asp:TextBox ID="txttelefono" runat="server" MaxLength="12" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="form-group">
                    <div class=" col-lg-6">
                        <label>Apellido</label>
                        <asp:TextBox ID="txtapellido" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class=" col-lg-6">
                        <label>Rut</label>
                        <asp:TextBox ID="txtrut" runat="server" placeholder="11111111-x" MaxLength="10" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="form-group">
                    <div class=" col-lg-6">
                        <label>Genero</label>
                        <asp:DropDownList ID="cboGenero" runat="server" CssClass="form-control form-control-sm" >
                            <asp:ListItem>Masculino</asp:ListItem>
                            <asp:ListItem>Femenino</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class=" col-lg-6">
                        <label>Estado</label>
                        <asp:DropDownList ID="cboEstado" runat="server" CssClass="form-control form-control-sm" >
                            <asp:ListItem>Autorizado</asp:ListItem>
                            <asp:ListItem>Desautorizado</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <br />
            <div class="form-group">
                <asp:Label ID="lblMensaje" Style="color: #a74500; font-size: 18px;" runat="server" Text=""></asp:Label>
            </div>
            <div class="form-group">
                <asp:Button ID="BtnRegistro" runat="server" Text="Registrar cliente" CssClass="btn btn-md btn-block btn-info" OnClick="BtnRegistro_Click" />
            </div>       
        </div>
          <div id="PRegistroDeProducto" runat="server" style="display: none">
                <div class="row">
                    <div class="form-group">
                        <div class=" col-lg-6">
                            <label>Codigo de Producto</label>
                            <asp:DropDownList CssClass="form-control form-control-sm" ID="cboProducto" runat="server" DataSourceID="SqlBuscarCodProd" DataTextField="cod_producto" DataValueField="cod_producto">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlBuscarCodProd" runat="server" ConnectionString="<%$ ConnectionStrings:YUYITOSConnectionString %>" SelectCommand="SELECT [cod_producto] FROM [Productos]"></asp:SqlDataSource>
                        </div>
                        <div class=" col-lg-6">
                            <label>Buscar por codigo</label>
                            <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" CssClass="btn btn-md btn-block btn-warning" OnClick="BtnBuscar_Click" />
                        </div>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="form-group">
                        <div class=" col-lg-6">
                            <label>Descripción</label>
                            <asp:TextBox ID="txtdescripcion" CssClass="form-control form-control-sm" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class=" col-lg-6">
                            <label>Stock</label>
                            <asp:TextBox ID="txtStock" CssClass="form-control form-control-sm" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="form-group">
                        <div class=" col-lg-6">
                            <label>Precio Venta</label>
                            <asp:TextBox ID="txtprecioventa" CssClass="form-control form-control-sm" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class=" col-lg-6">
                            <label>Cantidad</label>
                            <asp:TextBox ID="txtcantidad" CssClass="form-control form-control-sm" runat="server" TextMode="Number" placeholder="Numeral"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <br />
                <div class="form-group">
                    <asp:Label ID="lblmensajeerror" Style="color: #a74500; font-size: 18px;" runat="server" Text=""></asp:Label>
                </div>
                <div class="form-group">
                    <asp:Button ID="Button2" runat="server" Text="Agregar Producto" CssClass="btn btn-md btn-block btn-primary" OnClick="VentaTemp_Click" />
                </div>
              <div class="container" style="width: 100%; max-height: 200px; overflow-y: scroll;">
                  <div class="row">
                      <div class="col-md-12">
                          <asp:GridView ID="GrTablaVentaFiado" CssClass="table table-responsive" runat="server" AutoGenerateColumns="False"   DataKeyNames="id_ventas" DataSourceID="SqlVentaRCliente" Font-Size="X-Small" OnDataBound="GrTablaVenta_DataBound" ShowFooter="True" AllowPaging="True" PageSize="5" BackColor="#CCCCCC">

                              <Columns>
                                  <asp:CommandField ShowDeleteButton="True" />
                                  <asp:BoundField DataField="id_ventas" HeaderText="id_ventas" InsertVisible="False" ReadOnly="True" SortExpression="id_ventas" />
                                  <asp:BoundField DataField="cod_producto" HeaderText="cod_producto" SortExpression="cod_producto" />
                                  <asp:BoundField DataField="descripcion_producto" HeaderText="descripcion_producto" SortExpression="descripcion_producto" />
                                  <asp:BoundField DataField="precio_venta" HeaderText="precio_venta" SortExpression="precio_venta" />
                                  <asp:BoundField DataField="stock" HeaderText="stock" SortExpression="stock" />
                                  <asp:BoundField DataField="cantidad" HeaderText="cantidad" SortExpression="cantidad" />
                                  <asp:BoundField DataField="fecha_venta" HeaderText="fecha_venta" SortExpression="fecha_venta" />
                                  <asp:BoundField DataField="Expr1" HeaderText="Expr1" ReadOnly="True" SortExpression="Expr1" />
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
                          <asp:SqlDataSource ID="SqlVentaRCliente" runat="server" ConnectionString="<%$ ConnectionStrings:YUYITOSConnectionString %>" DeleteCommand="DELETE FROM [detalle_de_factura] WHERE [id_ventas] = @id_ventas" SelectCommand="SELECT id_ventas, cod_producto, descripcion_producto, precio_venta, stock, cantidad, fecha_venta, precio_venta * cantidad AS Expr1 FROM detalle_de_factura">
                              <DeleteParameters>
                                  <asp:Parameter Name="id_ventas" />
                              </DeleteParameters>
                          </asp:SqlDataSource>
                      </div>
                  </div>
              </div>

            </div>
            <div id="PBtnVender" runat="server" style="display: none">
            <div class="form-group">
                <asp:Label ID="LblmensajeFiado" Style="color: #a74500; font-size: 18px;" runat="server" Text=""></asp:Label>
            </div>
            <div class="form-group">
                <asp:Button ID="BtnGenerarFiado" Enabled="false"  runat="server" Text="Generar fiado" CssClass="btn btn-md btn-block btn-success" OnClick="BtnGenerarFiado_Click" OnClientClick="return confirm('Confirmar Fiado');"   />
            </div>
        </div>
          <div id="PBtnVender2" runat="server" style="display: none">
            <div class="form-group">
                <asp:Label ID="LblMensajeFiado2" Style="color: #a74500; font-size: 18px;" runat="server" Text=""></asp:Label>
            </div>
            <div class="form-group">
                <asp:Button ID="BtnGenerarFiado2" Enabled="false" runat="server" Text="Generar fiado" CssClass="btn btn-md btn-block btn-success" OnClick="BtnGenerarFiado2_Click" OnClientClick="return confirm('Confirmar Fiado');" />
            </div>
        </div>   
   </div>    
</asp:Content>
