<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="ingreso_productos.aspx.cs" Inherits="AlmacenYuyitos.ingreso_productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container" style="width: 100%; max-height: 465px; overflow-y: scroll; color: rgba(10, 42, 62,100);">
        <h2 class="text-center" style="color: rgba(10, 42, 62,100)">Ingreso de Productos</h2>
        <br />
        <div class="row">
            <div class="form-group">
                <div class="col-lg-6">

                    <asp:DropDownList ID="cbonomprove" runat="server" CssClass="form-control form-control-sm" DataSourceID="SqlBusquedaDeProdIngreso" DataTextField="nombre_proveedor" DataValueField="nombre_proveedor"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlBusquedaDeProdIngreso" runat="server" ConnectionString="<%$ ConnectionStrings:YUYITOSConnectionString %>" SelectCommand="SELECT [nombre_proveedor] FROM [registro_proveedores]"></asp:SqlDataSource>
                </div>
                <div class="col-lg-6">
                    <asp:Button ID="btnBuscarProve" CssClass="btn btn-md btn-block btn-warning" runat="server" Text="Buscar codigo por nombre" OnClick="btnBuscarProve_Click" />
                </div>
            </div>
            <br />
            <br />
        </div>

        <div class="row">
            <div class="form-group">
                <div class="col-lg-6">
                    <label>Codigo de Proveedor</label>
                    <asp:TextBox CssClass="form-control form-group-sm" ID="txtcodprove" runat="server" Enabled="False"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <label>Fecha de vencimineto</label>
                    <asp:TextBox ID="txtfechavenci" CssClass="form-control form-control-sm" TextMode="Date" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="form-group">
                <div class="col-lg-6">
                    <label>Descripcion</label>
                    <asp:TextBox ID="txtdescripcion" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <label>Precio Compra</label>
                    <asp:TextBox ID="txtprecio_comp" runat="server" CssClass="form-control form-control-sm" TextMode="Number" placeHolder="Numeral"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="form-group">
                <div class="col-lg-6">
                    <label>Precio Venta</label>
                    <asp:TextBox ID="txtprecioventa" runat="server" TextMode="Number" CssClass="form-control form-control-sm" placeHolder="Numeral"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <label>Stock</label>
                    <asp:TextBox ID="txtstock" runat="server" TextMode="Number" CssClass="form-control form-control-sm" placeHolder="Numeral"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="form-group">
                <div class="col-lg-6">
                    <label>Stock Critico</label>
                    <asp:TextBox ID="txtstockcritico" runat="server" TextMode="Number" CssClass="form-control form-control-sm" placeHolder="Numeral"></asp:TextBox>
                </div>
                <div class="col-lg-6">
                    <label>Categoria</label>
                    <asp:TextBox ID="txtcategoria" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />

        <div class="form-group">
            <asp:Label ID="lblmensaje" Style="color: #a74500; font-size: 18px;" runat="server" Text=""></asp:Label>
            <asp:Button ID="btnRegistrar" CssClass="btn btn-md btn-block btn-success" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
        </div>

        <div class="row">
            <div class="form-group">
                <div class="col-lg-6">
                    <asp:TextBox ID="txtcodproducto" runat="server" CssClass="form-control form-control-sm" placeholder="Codigo de producto"></asp:TextBox>
                </div>
                <div class="col-lg-3">
                    <asp:Button CssClass="btn btn-md btn-block btn-warning" ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click1" />
                </div>
                <div class="col-lg-3">
                    <asp:Button CssClass="btn btn-md btn-block btn-info" ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
                </div>
            </div>
            <br />
            <br />
        </div>
        <div class="form-group">
            <asp:Button CssClass="btn btn-md btn-block btn-danger" ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
        </div>
        <br />
        <br />
        <div class="container" style="width: 100%; max-height: 200px; overflow-y: scroll;">
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="grProductos" CssClass="table table-responsive" BackColor="#cccccc" runat="server"  BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Size="X-Small" PageSize="6" ShowFooter="True">
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#2a2a2a" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>  
</asp:Content>
