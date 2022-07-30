<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="WebInformeClientes.aspx.cs" Inherits="AlmacenYuyitos.WebInformeClientes" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <div class="container" style="width: 100%; max-height: 465px";>
        <h2 class="text-center" style="color:rgba(10, 42, 62,100)"></h2>
         <div class="row">
            <div class="form-group">
                <div class=" col-lg-9">            
                    <asp:TextBox ID="txtrut" runat="server" CssClass="form-control form-control-sm" placeholder="Rut"></asp:TextBox>
                </div>
                <div class=" col-lg-1">
                    <asp:Button class="CssBotonInforme" ID="btnbuscarrut" runat="server" Text="Filtar" OnClick="btnbuscarrut_Click"/>
                </div>
                <div class=" col-lg-2">
                     <asp:Button class="CssBotonInforme" ID="btnmostrartodo" runat="server" Text="Mostrar Todo" OnClick="btnmostrartodo_Click" />
                </div>
            </div>
        </div>
        <br />

        <div  style="background-color:#d0cbcb; margin-right:7.1%; width: 820px;">
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" style="margin-right: 225px" Width="815px">
                <LocalReport ReportEmbeddedResource="AlmacenYuyitos.InformeClientes.rdlc" ReportPath="InformeClientes.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="Inforcliente" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
        </div>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AlmacenYuyitos.YUYITOSDataSetTableAdapters.sp_listar_clientesTableAdapter"></asp:ObjectDataSource>


</asp:Content>

