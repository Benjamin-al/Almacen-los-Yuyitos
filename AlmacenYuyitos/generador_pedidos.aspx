<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="generador_pedidos.aspx.cs" Inherits="AlmacenYuyitos.generador_pedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="width: 100%; max-height: 465px; overflow-y: scroll;color: rgba(10, 42, 62,100);">
       <h2 class="text-center" style="color:rgba(10, 42, 62,100)">Pedidos a proveedores</h2>
       <br />
       <div class="row">
           <div class="form-group">
               <div class=" col-lg-6">
                    <asp:TextBox ID="txtnombreprov" runat="server" CssClass="form-control form-control-sm" placeholder="Nombre Proveedor"></asp:TextBox>
               </div>
               <div class=" col-lg-6">
                    <asp:Button  ID="btnBuscar" runat="server" CssClass="btn btn-md btn-block btn-warning"  Text="Buscar" OnClick="btnBuscar_Click" />
               </div>
           </div>
       </div>
       <br />
       <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">
                      <label>Codigo Proveedor</label> 
                       <asp:TextBox ID="txtcodprov" runat="server"  CssClass="form-control form-control-sm" Enabled="False"></asp:TextBox>
                </div>
                <div class=" col-lg-6">
                  <label>Rubro</label> 
                    <asp:TextBox ID="txtrubro" runat="server" CssClass="form-control form-control-sm" Enabled="False" ></asp:TextBox>
                </div>
            </div>
        </div>
        <br />
       <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">
                   <label>Descripción</label> 
                    <asp:TextBox ID="txtdescripcion" runat="server"  CssClass="form-control form-control-sm" TextMode="MultiLine" ></asp:TextBox>
                </div>
                <div class=" col-lg-6">
                    <label>Cantidad</label> 
                    <asp:TextBox ID="txtcantidad" runat="server"  CssClass="form-control form-control-sm" TextMode="Number" placeholder="Numeral"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />
         <div class="form-group">
             <asp:Label ID="lblmensaje" Style="color: #a74500; font-size: 18px;" runat="server" Text=""></asp:Label>
             <asp:Button Class="CssBoton" ID="btnRegistrar" runat="server" CssClass="btn btn-md btn-block btn-success" Text="Ingresar Pedido" OnClick="btnRegistrar_Click" />
         </div>
         <div class="container" style="width: 100%; max-height: 200px; overflow-y: scroll;">
             <div class="row">
                 <div class="col-md-12">
                     <asp:GridView ID="gdPedidos" CssClass="table table-responsive" BackColor="#cccccc" runat="server" Font-Size="X-Small"  PageSize="6" ShowFooter="True">
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
</asp:Content>
