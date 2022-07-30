<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="administracion_informes.aspx.cs" Inherits="AlmacenYuyitos.administracion_informes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container" style="width: 100%; max-height: 465px;" color: rgba(10, 42, 62,100);>
        <h2 class="text-center" style="color: rgba(10, 42, 62,100)">Administración de informes</h2>
        <br />
        <div class="row">

            <div class="form-group">
                <div class=" col-lg-3">
                    <label style="font-size:14px">Selección de informe</label>
                </div>
                <div class=" col-lg-6">
                    <select id="cboinfo" runat="server" Class="form-control form-control-sm">
                        <option>Seleccione</option>
                        <option>Informe de ventas</option>
                        <option>Informe de clientes</option>
                        <option>Informe de Pagos de Fiados</option>
                        <option>Informe de Pedidos</option>
                        <option>Informe de proveedores</option>
                        <option>Informe de recepción producto</option>
                        <option>Informe de productos</option>
                    </select>
                </div>
                <div class=" col-lg-2">
                    <asp:Button class="CssBotonInforme" ID="Button2" runat="server" Text="Desplegar" OnClick="Button2_Click" />
                </div>
            </div>
        </div>
        <br />
        <div class="form-group">
            <asp:Label ID="lblmensaje" Style="color: #a74500; font-size: 14px;" runat="server" Text=""></asp:Label>

        </div>
    </div>
</asp:Content>
