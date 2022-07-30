<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="WebInformeProveedores.aspx.cs" Inherits="AlmacenYuyitos.WebInformeProveedores" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   <div class="container" style="width: 100%; max-height: 465px; overflow-y: scroll;color: rgba(10, 42, 62,100);">
        <h2 class="text-center" style="color:rgba(10, 42, 62,100)"></h2>
         <div class="row">
            <div class="form-group">
                <div class=" col-lg-1">
                    <label>Comuna</label>
                    </div>
                 <div class="col-lg-5">
                    <select id="cboComuna" runat="server" class="form-control form-control-sm">
                        <option>Colina</option>
                        <option>Lampa</option>
                        <option>Till Till</option>
                        <option>Pirque</option>
                        <option>Puente Alto</option>
                        <option>San Jose de Maipo</option>
                        <option>Buin</option>
                        <option>Calera de Tango</option>
                        <option>Paine</option>
                        <option>San Bernando</option>
                        <option>Alhue</option>
                        <option>Curacavi</option>
                        <option>Maria Pinto</option>
                        <option>Melipilla</option>
                        <option>San Pedro</option>
                        <option>Cerrilos</option>
                        <option>Cerro Navia</option>
                        <option>Cochali</option>
                        <option>El Bosque</option>
                        <option>Estacion Central</option>
                        <option>Huechuraba</option>
                        <option>Independecia</option>
                        <option>La Granja</option>
                        <option>La Florida</option>
                        <option>La Pintana</option>
                        <option>La Reina</option>
                        <option>Las Condes</option>
                        <option>Lo Barnechea</option>
                        <option>Lo Espejo</option>
                        <option>Lo Prado</option>
                        <option>Macul</option>
                        <option>Maipu</option>
                        <option>Ñuñoa</option>
                        <option>Pedro Aguirre Cerda</option>
                        <option>Peñalolen</option>
                        <option>Providencia</option>
                        <option>Pudahuel</option>
                        <option>Quilicura</option>
                        <option>Quinta Normal</option>
                        <option>Recoleta</option>
                        <option>Renca</option>
                        <option>San Miguel</option>
                        <option>San Joaquin</option>
                        <option>San Ramon</option>
                        <option>Santiago</option>
                        <option>Vitacura</option>
                        <option>El Monte</option>
                        <option>Isla de Maipo</option>
                        <option>Padre Hurtado</option>
                        <option>Peñaflor</option>
                        <option>Talagante</option>
                    </select>
                </div>
                <div class=" col-lg-1">
                    <asp:Button class="CssBotonInforme"  runat="server" Text="Filtar" OnClick="Unnamed1_Click" />
                </div>
                <div class=" col-lg-2">
                     <asp:Button class="CssBotonInforme" ID="btnmostartodo" runat="server" Text="Mostrar Todo" OnClick="btnmostartodo_Click" />
                </div>
            </div>
        </div>
        <br />
 


    <div style="background-color:#d0cbcb; margin-right:-10%">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" style="margin-right: 0px" Width="100%">
        <LocalReport ReportEmbeddedResource="AlmacenYuyitos.InformeProveedores.rdlc" ReportPath="InformeProveedores.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="InformeProveedores" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    </div>
    
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="AlmacenYuyitos.YUYITOSDataSetTableAdapters.sp_listar_proveedoresTableAdapter" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
</div>

</asp:Content>
