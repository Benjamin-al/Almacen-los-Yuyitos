<%@ Page Title="" Language="C#" MasterPageFile="~/masterUser.Master" AutoEventWireup="true" CodeBehind="ManuelAyudaUser.aspx.cs" Inherits="AlmacenYuyitos.ManuelAyudaUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="CssRegistroProveedores">  

        <div class="enlacesAyuda" >
           <h2 style="margin-left:30%; color: #000000">Manual De Ayuda</h2>  
           <h4 style="color: #000000">Generar Ventas</h4>
           <p style="color:#000000">1. Para poder Generar Una Venta Primero debe Buscar El Producto A Vender Por su Codigo</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Generar%20Ventas%201.PNG" style="width: 520px; height: 51px;" /></div>
               <p style="color:#000000">2. Luego que el producto a vender sea buscado se desplegaran los datos de dicho producto</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Generar%20Ventas%202.PNG" style="width: 654px; height: 174px;" /></div>
               <p style="color:#000000">3. Depues que los datos se Despliegen se debe colocar la cantidad a llevar y agregar el producto al carro</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Generar%20Ventas%203.PNG" style="height: 186px; width: 560px;" /></div>
               <p style="color:#000000">4. Luego de Agregar el producto al carro debe realisar la venta con el boton "Vender"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Generar%20Ventas%204.PNG" style="height: 161px; width: 655px" /></div>
               <h4 style="color: #000000">Registro Clientes</h4>
               <p style="color:#000000">Panel de registro</p>
               <p style="color:#000000; margin-left:1%">1. Para registrar un cliente debe dar clik al boton "Panel de registro"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Clientes%20panel%20registro%201.PNG" /></div>
               <p style="color:#000000; margin-left:1%">2. Para ingresar los datos del cliente debe llenar los campos y dar clik en "Registrar Cliente"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Clientes%20panel%20registro%202.PNG" /></div>
               <p style="color:#000000; margin-left:1%">3. Si el estado es Autorizado este desplejara otro formulario para poder realisar el fiado a ese cliente "</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Clientes%20panel%20registro%203.PNG" /></div>
               <p style="color:#000000; margin-left:1%">4. Para generar el fiado debe buscar el producto por su codigo y dar clik en "Buscar"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Clientes%20panel%20registro%204.PNG" /></div>
               <p style="color:#000000; margin-left:1%">5. luego de buscar el producto se debe ingresar la cantidad y dar clik al boton "Agregar Producto"</p>
               <div style="margin-left:10%"> <img src="Img%20Manual%20Ayuda/Registro%20Clientes%20panel%20registro%205.PNG" /></div>
               <p style="color:#000000; margin-left:1%">6. para poder registrar el fiado de los productos agregados al carro debe dar clik en "Generar Fiado"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Clientes%20panel%20registro%206.PNG" /></div>
               <p style="color:#000000">Panel de busqueda</p>
            <p style="color:#000000; margin-left:1%">1. Para buscar un cliente registrado debe dar clik en "panel de busqueda"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Clientes%20panel%20busqueda%201.PNG" /></div>
               <p style="color:#000000; margin-left:1%">2. Para registrar un fiado debe buscar al cliente ya registrado por su rut y dar clik en "Buscar Cliente"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Clientes%20panel%20busqueda%202.PNG" /></div>
                <p style="color:#000000; margin-left:1%">3. Para Modificar los datos del cliente debe ingresar el dato que desea modificar luego dar clik en "Modificar " en caso que no dese modificar debe dar clik en "Fiado de Producto"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Clientes%20panel%20busqueda%203.PNG" /></div>
               <p style="color:#000000; margin-left:1%">4. Para generar el fiado debe buscar el producto por su codigo y dar clik en "Buscar"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Clientes%20panel%20busqueda%204.PNG" /></div>
               <p style="color:#000000; margin-left:1%">5. luego de buscar el producto se debe ingresar la cantidad y dar clik al boton "Agregar Producto"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Clientes%20panel%20busqueda%205.PNG" /></div>
                <p style="color:#000000; margin-left:1%">6. para poder registrar el fiado de los productos agregados al carro debe dar clik en "Generar Fiado"</p>
                <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Clientes%20panel%20busqueda%206.PNG" /></div>
               <h4 style="color: #000000">Registro Pago Fiados</h4>
                <p style="color:#000000; margin-left:1%">1. Para revisar las deudas de un cliente debe ingresar el rut y dar clik en Buscar Rut</p>
                <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/pago%20fiados%201.PNG" /></div>
               <p style="color:#000000; margin-left:1%">2. Para registrar el abono o pago por el fiado se desplejara del cliente y debe dar clik en "Buscar Fiado"</p>
                <div style="margin-left:10%"> <img src="Img%20Manual%20Ayuda/pago%20fiados%202.PNG" /></div>
               <p style="color:#000000; margin-left:1%">3. Luego de Buscar el fiado este desplejara todos los datos de la deuda en el caso de realisar un abono debe ingresar el monto abonoada en el apartado "Monto a Pagar y dar clik en "Abonar"</p>
                <div style="margin-left:10%"> <img src="Img%20Manual%20Ayuda/pago%20fiados%203.PNG" /></div>
               <p style="color:#000000; margin-left:1%">4. En el caso de realizar el pago por toda la deuda debe ingresar el "Monto a pagar " el cual debe ser igual a la deuda y dar clik en "Pagao" </p>
                <div style="margin-left:10%"> <img src="Img%20Manual%20Ayuda/pago%20fiados%204.PNG" /></div>
        </div>
        <%--<table class="folumarioVentas">
            <div class="enlacesAyuda" >

                <div>
                    <a href="admin.aspx">
                        Generar Ventas</a>
                </div>

                <div>
                <a href="admin.aspx">
                    Administrar Boletas</a>
                </div>
                
                <div>    
                <a href="admin.aspx">
                    Registro Clientes</a>
                </div>

                <div>
                <a href="admin.aspx">
                    Registro Pago Fiados</a>
                </div>

                <div>
                <a href="admin.aspx">
                    Generar Pedidos</a>
                </div>

                <div>
                <a href="admin.aspx">
                   Registrar Proveedores</a>
                </div>

                <div>
                <a href="admin.aspx">
                   Recepcion Productos</a>
                </div>

                <div>
                <a href="admin.aspx">
                    Ingreso de Productos</a>
                </div>

                <div>
                <a href="admin.aspx">
                    Administracion de Informes</a>
                </div>
            </div>
        </table>  --%>
    </div>
</asp:Content>
