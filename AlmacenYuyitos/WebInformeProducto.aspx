<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="WebInformeProducto.aspx.cs" Inherits="AlmacenYuyitos.WebInformeProducto" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <div class="container" style="width: 100%; max-height: 465px; overflow-y: scroll;color: rgba(10, 42, 62,100);">
        <h2 class="text-center" style="color: rgba(10, 42, 62,100)"></h2>
        <div class="row">
            <div class="form-group">
                <div class=" col-lg-9">
                    <asp:TextBox ID="txtnomprove" runat="server" CssClass="form-control form-control-sm" placeholder="Nombre Proveedor"></asp:TextBox>
                </div>
                <div class=" col-lg-1">
                    <asp:Button class="CssBotonInforme" ID="Button1" runat="server" Text="Filtar" OnClick="Button1_Click" />
                </div>
                <div class=" col-lg-2">
                    <asp:Button class="CssBotonInforme" ID="btnmostartodo" runat="server" Text="Mostrar Todo" OnClick="btnmostartodo_Click" />
                </div>
            </div>
        </div>
        <br />
  

    <div style="background-color: #d0cbcb; margin-right: -25%">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="978px" AsyncRendering="False" InteractivityPostBackMode="AlwaysSynchronous" ShowPrintButton="False">
            <LocalReport ReportEmbeddedResource="AlmacenYuyitos.IformeProductos.rdlc" ReportPath="IformeProductos.rdlc">
                <DataSources>

                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="InformeProductos" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        </div>
      </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="AlmacenYuyitos.YUYITOSDataSetTableAdapters.sp_listar_productosTableAdapter" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>

    </asp:Content>
