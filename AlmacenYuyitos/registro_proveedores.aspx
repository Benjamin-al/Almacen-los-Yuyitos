<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="registro_proveedores.aspx.cs" Inherits="AlmacenYuyitos.registro_proveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="width: 100%; max-height: 465px; overflow-y: scroll; color: rgba(10, 42, 62,100);">
        <h2 class="text-center" style="color:rgba(10, 42, 62,100)">Registro de proveedor</h2>
        <br />
        <div class="row">
            <div class="form-group">
                <div class="col-lg-6">
                    <label>Nombre proveedor</label>
                    <asp:TextBox ID="txtnombreProveed" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <label>Telefono</label>
                    <asp:TextBox ID="txttelefon" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
        </div>
        <br />
        <div class="row">
            <div class="form-group">
                <div class="col-lg-6">
                    <label>E-mail</label>
                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control form-control-sm" TextMode="Email" placeholder="Text@example.com"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <label>Comuna</label>
                    <select id="cboComuna" runat="server" class="form-control form-control-sm">
                        <option value="" disabled selected>Seleccionar</option>
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
            </div>
            <br />
            <br />
        </div>
        <br />
         <div class="row">
            <div class="form-group">
                <div class="col-lg-6">
                    <label>Dirección</label>
                    <asp:TextBox ID="txtdireccion" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <label>Rubro</label>
                    <asp:TextBox ID="txtrubro" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
          <br />
        <div class="form-group">
            <asp:Label ID="lblmensaje" Style="color: #a74500; font-size:18px;" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnRegistrar" CssClass="btn btn-md btn-block btn-success" runat="server" Text="Registrar" OnClick="btnRegistrar_Click"/>
        </div>
    
        <div class="row">
            <div class="form-group">
                <div class="col-lg-6">
                    <asp:TextBox ID="txtnomprove" CssClass="form-control form-control-sm" runat="server" placeholder="Nombre de proveedor"></asp:TextBox>
                </div>
                <div class="col-lg-3">
                    <asp:Button CssClass="btn btn-md btn-block btn-warning" ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click1" />
                </div>
                 <div class="col-lg-3">
                    <asp:Button CssClass="btn btn-md btn-block btn-info" ID="btnmodificar" runat="server" Text="Modificar"  OnClick="btnmodificar_Click" />
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="form-group">
                <div class=" col-lg-6">
                    <asp:TextBox ID="txtproveeliminar" CssClass="form-control form-control-sm" runat="server" placeholder="Codigo de proveedor"></asp:TextBox>

                </div>
                <div class=" col-lg-6">
                    <asp:Button CssClass="btn btn-md btn-block btn-danger" ID="btneliminar" runat="server" Text="Eliminar" OnClick="btneliminar_Click" />

                </div>
            </div>
        </div>
        <br />
        <div class="container" style="width: 100%; max-height: 200px; overflow-y: scroll;">
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="gdProveedores" CssClass="table table-responsive" BackColor="#cccccc" runat="server" Font-Size="X-Small" PageSize="6" ShowFooter="True">
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
