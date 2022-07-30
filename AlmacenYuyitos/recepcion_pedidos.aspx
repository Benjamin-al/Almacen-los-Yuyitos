<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="recepcion_pedidos.aspx.cs" Inherits="AlmacenYuyitos.recepcion_pedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="width: 100%; max-height: 465px; overflow-y: scroll;color: rgba(10, 42, 62,100);">
           <h2 class="text-center" style="color:rgba(10, 42, 62,100)">Recepción de productos</h2>
        <br />
        <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">              
                    <asp:TextBox ID="txtnumOrden" runat="server" placeholder="Numero de orden" CssClass="form-control form-control-sm"></asp:TextBox> 
                </div>
                <div class=" col-lg-6"> 
                     <asp:Button  ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-md btn-block btn-warning" OnClick="btnBuscar_Click"  />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">
                   <label>Nombre Proveedor</label> 
                    <asp:TextBox ID="txtnomprove" runat="server" CssClass="form-control form-control-sm" Enabled="False"></asp:TextBox>
                </div>
                <div class=" col-lg-6">
                    <label>Rubro</label> 
                    <asp:TextBox ID="txtrubro" runat="server" CssClass="form-control form-control-sm" Enabled="False"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">
                   <label>Descripción</label> 
                    <asp:TextBox ID="txtdescrip" runat="server" CssClass="form-control form-control-sm" Enabled="False"></asp:TextBox>
                </div>
                <div class=" col-lg-6">
                    <label>Cantidad</label> 
                    <asp:TextBox ID="txtcant" runat="server" Enabled="False" CssClass="form-control form-control-sm" TextMode="Number" placeholder="Numeral"></asp:TextBox> 
                </div>
            </div>
        </div>
        <br />
        <div class="form-group">
	         <label>Estado</label>
             <select id="cboestado" runat="server" class="form-control form-control-sm" >
                 <option value="" disabled selected style="display:none">Seleccionar</option>
                    <option style="color:#4cff00;">Aprobado</option>
                    <option style="color:#bd3333;">Denegado</option>
              </select>
        </div>
        <br />
         <div class="form-group">
              <asp:Label ID="lblmensaje" Style="color: #a74500; font-size:18px;" runat="server" Text=""></asp:Label>
	       <asp:Button CssClass="btn btn-md btn-block btn-success" ID="btnRecepcionar" runat="server" Text="Recepcionar Pedido" OnClick="btnRecepcionar_Click" />     
        </div>
        <div class="form-group">
	         <asp:Label ID="lblmensajetabla" Style="color: #a74500; font-size:18px;" runat="server" Text=""></asp:Label>

        </div>

        <div class="row">
            <div class="form-group">
                <div class="col-lg-6">
                    <asp:Button CssClass="btn btn-md btn-block btn-primary" ID="btnlistaPedidos" runat="server" Text="Pedidos" OnClick="btnlistaPedidos_Click"  />
                </div>
                <div class="col-lg-6">
                     <asp:Button CssClass="btn btn-md btn-block btn-primary" ID="btnListaRecepcion" runat="server" Text="Pedidos Recepcionados" OnClick="btnListaRecepcion_Click"/>
                </div>          
            </div>
        </div>
        <br />
      <div class="container" style="width: 100%; max-height: 200px; overflow-y: scroll;">
          <div class="row">
              <div class="col-md-12">
                  <asp:GridView ID="gridElementos" runat="server" CssClass="table table-responsive" BackColor="#cccccc" OnSelectedIndexChanged="gridElementos_SelectedIndexChanged" Font-Size="X-Small" PageSize="6" ShowFooter="True">
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
