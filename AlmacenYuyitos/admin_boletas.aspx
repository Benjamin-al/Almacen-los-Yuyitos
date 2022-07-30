<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="admin_boletas.aspx.cs" Inherits="AlmacenYuyitos.admin_boletas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container" style="width: 100%; max-height: 465px; overflow-y: scroll; color: rgba(10, 42, 62,100);">
        <h2 class="text-center" style="color: rgba(10, 42, 62,100)">Administración de boletas</h2>
        <br />
        <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">
                    <asp:TextBox ID="txtnuemeroboleta" runat="server" CssClass="form-control form-control-sm" placeholder="Numero Boleta"></asp:TextBox>
                </div>
                <div class=" col-lg-3">
                    <asp:Button ID="btnbuscar" runat="server" Text="Buscar" CssClass="btn btn-md btn-block btn-warning" OnClick="btnbuscar_Click" />
                </div>
                <div class=" col-lg-3">
                    <asp:Button Class="CssBoton" ID="btneliminar" CssClass="btn btn-md btn-block btn-danger" runat="server" Text="Eliminar" OnClick="btneliminar_Click" />
                </div>
            </div>
        </div>
        <br />
        <div class="form-group">
            <asp:Label ID="lblmensaje" Style="color: #a74500; font-size: 18px;" runat="server" Text=""></asp:Label>
        </div>        
        <div class="panel panel-default" id="PanelVentasR" runat="server" style="display: none">
            <div class="panel-body" style="background:#808080">
                <h2 class="text-center" style="color: rgba(10, 42, 62,100)">Información de boleta</h2>
                 <div class="col-md-12">
                    <asp:GridView ID="grboletabuscada" CssClass="table table-responsive" runat="server" Font-Size="X-Small" PageSize="6" ShowFooter="True" BackColor="#cccccc">
                          <FooterStyle BackColor="White" ForeColor="#333333" />
                          <HeaderStyle BackColor="#2a2a2a" Font-Bold="True" ForeColor="White" />
                          <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                          <RowStyle BackColor="White" ForeColor="#333333" />
                          <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                          <SortedAscendingCellStyle BackColor="#F7F7F7" />
                          <SortedAscendingHeaderStyle BackColor="#487575" />
                          <SortedDescendingCellStyle BackColor="#E5E5E5" />
                          <SortedDescendingHeaderStyle BackColor="#275353" />
                      </asp:GridView>
                   </div>
                <br/>
                
                <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">
                    <asp:TextBox ID="txtidventa" runat="server" CssClass="form-control form-control-sm" placeholder="Id Venta"></asp:TextBox>
                </div>
                <div class=" col-lg-3">
                    <asp:Button ID="btnbuscaridventa" runat="server" Text="Buscar" CssClass="btn btn-md btn-block btn-warning" OnClick="btnbuscaridventa_Click"  />
                </div>
                <div class=" col-lg-3"> 
                     <asp:Button ID="btnmodificaridventa" runat="server" CssClass="btn btn-md btn-block btn-info" Text="Modificar" OnClick="btnmodificaridventa_Click1"  />
                </div>
            </div>
        </div>
                <br />
                  <div class="row">
                    <div class="form-group">
                        <div class=" col-lg-6"></div>
                         <div class=" col-lg-6">
                              <asp:Button Class="CssBoton" ID="btneliminaridventa" CssClass="btn btn-md btn-block btn-danger" runat="server" Text="Eliminar" OnClick="btneliminaridventa_Click"  />
                         </div>
                        </div>
                      </div>
                <br />
                <div class="row">
                <div class="form-group">
                    <div class=" col-lg-6">
                        <label>Numero de venta</label>
                        <asp:TextBox ID="txtnumventa" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class=" col-lg-6">
                        <label>Cod Producto</label>
                        <asp:TextBox ID="txtcodproduc" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                </div>
            </div>
            <br />
                <div class="row">
                    <div class="form-group">
                        <div class=" col-lg-6">
                            <label>Descripción</label>
                            <asp:TextBox ID="txtdescripcion" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                        <div class=" col-lg-6">
                            <label>Precio Venta</label>
                            <asp:TextBox ID="txtprecioventa" runat="server" CssClass="form-control form-control-sm" TextMode="Number" placeholder="Numeral"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <br />
           <div class="row">
                    <div class="form-group">
                        <div class=" col-lg-6">
                            <label>Stock</label>
                            <asp:TextBox ID="txtstock" runat="server" CssClass="form-control form-control-sm" TextMode="Number" placeholder="Numeral"></asp:TextBox>
                        </div>
                        <div class=" col-lg-6">
                            <label>Cantidad</label>
                             <asp:TextBox ID="txtcantidad" runat="server" CssClass="form-control form-control-sm" TextMode="Number" placeholder="Numeral"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="form-group">
                        <div class=" col-lg-6">
                            <label>Fecha Venta</label>
                            <asp:TextBox ID="txtfecha" runat="server"   CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                        <div class=" col-lg-6">
                            <label>Total</label>
                             <asp:TextBox ID="txttotal" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <div class="form-group">
                     <asp:Button ID="btnOcultar2" runat="server" CssClass="btn btn-md btn-block btn-primary" Text="Ocultar" OnClick="btnOcultar2_Click"  />
                </div>
            </div>          
        </div> 
          <br />
            <div id="PanelTabla"  runat="server">
                <div class="container" style="width: 100%; max-height: 350px; overflow-y: scroll;">
                    <div class="row">
                        <div class="col-md-12">
                            <asp:GridView ID="gridBoletas" CssClass="table table-responsive" runat="server" Font-Size="X-Small" PageSize="6" ShowFooter="True" BackColor="#cccccc">
                                <FooterStyle BackColor="White" ForeColor="#333333" />
                                <HeaderStyle BackColor="#2a2a2a" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="White" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#487575" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#275353" />
                            </asp:GridView>
                        </div>
                     </div>
                  </div>
            </div>
</div>
</asp:Content>
