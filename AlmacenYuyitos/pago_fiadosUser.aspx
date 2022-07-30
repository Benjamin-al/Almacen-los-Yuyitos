<%@ Page Title="" Language="C#" MasterPageFile="~/masterUser.Master" AutoEventWireup="true" CodeBehind="pago_fiadosUser.aspx.cs" Inherits="AlmacenYuyitos.pago_fiadosUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container" style="width: 100%; max-height: 465px; overflow-y: scroll; color: rgba(10, 42, 62,100);">
        <h2 class="text-center" style="color: rgba(10, 42, 62,100)">Revision de deuda</h2>
        <br />
        <div class="row">
            <div class="form-group">
                <div class="col-lg-6">
                    <label>Rut de Cliente</label>
                    <asp:TextBox ID="TxtRutCliente" runat="server"  CssClass="form-control form-control-sm" placeholder="11111111-X" MaxLength="10"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <label>Busqueda de rut</label>
                    <asp:Button CssClass="btn btn-md btn-block btn-warning" ID="BtnBuscarRutCliente" runat="server" Text="Buscar" OnClick="BtnBuscarRutCliente_Click" />                </div>
            </div>
        </div>
        <br />
         <asp:Label ID="lblMensajeId" Style="color: #a74500; font-size:18px;" runat="server" Text=""></asp:Label>

       
          <h2 class="text-center" style="color:rgba(10, 42, 62,100)">Pago de fiados</h2>
        <br />
        <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">
                   <label>Id de Cliente</label> 
                     <asp:TextBox ID="TxtIdCliente" runat="server" CssClass="form-control form-control-sm" ReadOnly="false"></asp:TextBox>
                </div>
                <div class=" col-lg-6">
                    <label>Buscar por ID cliente</label> 
                    <asp:Button CssClass="btn btn-md btn-block btn-warning" ID="BtnBuscarIdCliente" runat="server" Text="Buscar" OnClick="BtnBuscarIdCliente_Click"  />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">
                   <label>Nombre</label> 
                     <asp:TextBox ID="TxtNombre" runat="server" ReadOnly="true" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                <div class=" col-lg-6">
                    <label>Apellido </label> 
                    <asp:TextBox ID="TxtApellido" runat="server" ReadOnly="true" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">
                   <label>Rut</label> 
                    <asp:TextBox ID="TxtRut" runat="server" ReadOnly="true" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                <div class=" col-lg-6">
                    <label>Deuda</label> 
                    <asp:TextBox ID="TxtDeuda" runat="server" ReadOnly="true" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">
                   <label> Estado</label> 
                      <asp:TextBox ID="TxtEstado" runat="server" ReadOnly="true" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                <div class=" col-lg-6">
                    <label> Monto a pagar</label> 
                     <asp:TextBox ID="TxtPagar" runat="server" CssClass="form-control form-control-sm" TextMode="Number" placeholder="Numeral"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />
        <div class="form-group">
            <asp:Label ID="LblMensaje" runat="server" Text="" Style="color: #a74500; font-size:18px;"></asp:Label>
        </div>
        <br />
        <div class="row">
            <div class="form-group">
                <div class="col-lg-6">
                    <asp:Button ID="BtnPagar" CssClass="btn btn-md btn-block btn-info"  runat="server" Text="Abonar" OnClick="BtnPagar_Click"  OnClientClick="return confirm('Confirmar Abono');"/>
                </div>
                <div class="col-lg-6">
                     <asp:Button ID="BtnPAgo" CssClass="btn btn-md btn-block btn-success"  runat="server" Text="Pago"   OnClick="BtnPAgo_Click" OnClientClick="return confirm('Confirmar Pago');"/>

                </div>
            </div>
        </div>
        <br />

    </div>
</asp:Content>
