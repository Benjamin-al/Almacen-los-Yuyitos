<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="WebInformeRecepcionProductos.aspx.cs" Inherits="AlmacenYuyitos.WebInformeRecepcionProductos" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="width: 100%; max-height: 465px; overflow-y: scroll;color: rgba(10, 42, 62,100);">
        <h2 class="text-center" style="color:rgba(10, 42, 62,100)"></h2>
         <div class="row">
            <div class="form-group">
                <div class=" col-lg-7">
                    <label>Estado</label>
                    </div>
                <div class=" col-lg-7">
                    <select id="cboPedido" runat="server" Class="form-control form-control-sm" >
                        <option>Seleccionar</option>
                        <option>Aprobado</option>
                        <option>Denegado</option>
                    </select>
                </div>
                <div class=" col-lg-1">
                    <asp:Button class="CssBotonInforme" ID="Button1" runat="server" Text="Filtar" OnClick="Button1_Click" />
                </div>
                <div class=" col-lg-2">
                     <asp:Button class="CssBotonInforme" ID="btnmostrartodo" runat="server" Text="Mostrar Todo" OnClick="btnmostrartodo_Click" />
                </div>
            </div>
        </div>
        <br />

    <div style="background-color: #d0cbcb; margin-right: -3.5%;" >
         <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
        <LocalReport ReportEmbeddedResource="AlmacenYuyitos.InformeRecepcionProductos.rdlc" ReportPath="InformeRecepcionProductos.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="InformeRecepcionProductos" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AlmacenYuyitos.YUYITOSDataSetTableAdapters.sp_listar_recepcion_pedidosTableAdapter"></asp:ObjectDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 </div>
</asp:Content>
