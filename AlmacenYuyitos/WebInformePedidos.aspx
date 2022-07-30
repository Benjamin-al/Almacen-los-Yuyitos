<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="WebInformePedidos.aspx.cs" Inherits="AlmacenYuyitos.WebInformePedidos" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="container" style="width: 100%; max-height: 465px; overflow-y: scroll;color: rgba(10, 42, 62,100);">
        <h2 class="text-center" style="color:rgba(10, 42, 62,100)">Informe Pedidos</h2>
         <div class="row">
            <div class="form-group">
                <div class=" col-lg-9">            
                    <asp:TextBox ID="txtnom_prove" runat="server" CssClass="form-control form-control-sm" placeholder="Nombre Proveedor"></asp:TextBox>
                </div>
                <div class=" col-lg-1">
                    <asp:Button class="CssBotonInforme" ID="btnbuscar" runat="server" Text="Filtar" OnClick="btnbuscar_Click" />
                </div>
                <div class=" col-lg-2">
                     <asp:Button class="CssBotonInforme" ID="btnmostrartodo" runat="server" Text="Mostrar Todo" OnClick="btnmostrartodo_Click"/>
                </div>
            </div>
        </div>
        <br />

    <div style="background-color:#d0cbcb; ">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="441px" Width="100%">
            <LocalReport ReportEmbeddedResource="AlmacenYuyitos.InformePedidos.rdlc" ReportPath="InformePedidos.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource Name="InforPedidos" DataSourceId="ObjectDataSource1"></rsweb:ReportDataSource>
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource runat="server" SelectMethod="GetData" TypeName="AlmacenYuyitos.YUYITOSDataSetTableAdapters.sp_listar_pedidosTableAdapter" ID="ObjectDataSource1" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
    </div>
    </div>
</asp:Content>
