<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="WebInformeVentas.aspx.cs" Inherits="AlmacenYuyitos.WebInformeVentas" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container" style="width: 100%; max-height: 665px;">
        <h2 class="text-center" style="color:rgba(10, 42, 62,100)"></h2>
         <div class="row">
            <div class="form-group">
                <div class=" col-lg-9">            
                    <asp:TextBox ID="txtnboleta" runat="server" CssClass="form-control form-control-sm" placeholder="Descripción Producto" ></asp:TextBox>
                </div>
                <div class=" col-lg-1">
                    <asp:Button class="CssBotonInforme" ID="btnbuscarfecha" runat="server" Text="Filtar" OnClick="btnbuscarfecha_Click" />
                </div>
                <div class=" col-lg-2">
                     <asp:Button class="CssBotonInforme" ID="btnmostrartodo" runat="server" Text="Mostrar Todo" OnClick="btnmostrartodo_Click"  />
                </div>
            </div>
        </div>
        <br />

     <div  style="background-color:#d0cbcb; margin-right:7.1%; width: 820px;">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="817px">
        <LocalReport ReportEmbeddedResource="AlmacenYuyitos.InformeVenta.rdlc" ReportPath="InformeVenta.rdlc">
             <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    </div>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AlmacenYuyitos.YUYITOSDataSetTableAdapters.sp_listar_ventasTableAdapter"></asp:ObjectDataSource>
   
</asp:Content>
