<%@ Page Title="" Language="C#" MasterPageFile="~/masterAdmin.Master" AutoEventWireup="true" CodeBehind="ManualAyuda.aspx.cs" Inherits="AlmacenYuyitos.ManualAyuda" %>
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
               <h4 style="color: #000000">Administrar Boletas</h4>
               <p style="color:#000000">1. Para modificar la boleta primero debe realisar la busqueda de la boleta por su numero de boleta , para ello debe ingresar el numero de la boleta y dar clik en "Buscar"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Administrar%20boleta%201.PNG" /></div>
               <p style="color:#000000">2. Para Eliminar la boleta debe ingresar el numero de boleta al igual en el punto anteriror pero en este caso debe dar clik en "Eliminar"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Administrar%20boleta%201.PNG" /></div>
               <p style="color:#000000">3. Luego de aver realizado la busqueda de la boleta esta desplegara una lista con todos los productos asociados a la boleta</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Administrar%20boleta%202.PNG" /></div>
               <p style="color:#000000">4. para poder modificar o eliminar un producto  asociado a la boleta ya buscada debe ingresar el id o numero de venta del producto y dar clik en "Buscar"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Administrar%20boleta%203.PNG" /></div>
               <p style="color:#000000">5. para poder modificar el un producto de la boleta luego de haber buscado el producto por su id o numero de venta se desplegar un formulario con los datos del producto luego debera dar clik en "Modificar"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Administrar%20boleta%204.PNG" /></div>
               <p style="color:#000000">6. para eliminar un producto de la boleta debera ingresar el id o numero de venta y dar clik en "Eliminar"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Administrar%20boleta%203.PNG" /></div>
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
               <h4 style="color: #000000">Generar Pedidos</h4>
                <p style="color:#000000;">1. Para generar un pedido primero debe ingresar el nombre del proveedor y dar clik en "Buscar"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Generara%20pedidos%201.PNG" /> </div>
               <p style="color:#000000;">2. Luego que se realise la busqueda se desplejaran los datos del proveedor tras esto debe llenar los campos vacios con los datos del pedido luego dar clik en "Ingresar Pedido"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Generara%20pedidos%202.PNG" /></div>
               <h4 style="color: #000000">Registro Proveedores</h4>
               <p style="color:#000000;">1. Para registrar un proveedor debe ingresar los datos del proveedor y dar clik en "Registrar" </p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Proveedores%201.PNG" /></div>
                <p style="color:#000000;">2. para modificar los datos del proveedor debe primero colocar el nombre del proveedor y dar clik en "Buscar"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Proveedores%202.PNG" /></div>
                 <p style="color:#000000;">3.luego de realisar la busqueda y se despliejen los datos del proveedor debe llenar al campo con los datos que desea modificar y dar clik en "Modificar" </p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Proveedores%203.PNG" /></div>
                <p style="color:#000000;">4. Para eliminar el proveedor debe ingresar el codigo del proveedor y dar clik en "Eliminar"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/Registro%20Proveedores%204.PNG" /></div>
               <h4 style="color: #000000">Recepcionar Productos</h4>
                <p style="color:#000000;">1. Para recepcionar el Producto o Pedido registrado debe dar clik en "Pedidos" luego se desplejara el listado de todos los pedidos realizados </p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/recepcion%20productos%201.PNG" /></div>
                <p style="color:#000000;">2. Luego que se deplieje el listado de los pedidos debe ingresar el numero de orden del pedido y dar clik en "Buscar" </p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/recepcion%20productos%202.PNG" /></div>
                <p style="color:#000000;">3. Luego de realizar la busqueda se desplejaran los datos del pedido donde debera ingresar el estado si es que esta Aprobado o no luego debe dar clik en "Recepcionar Pedido" </p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/recepcion%20productos%203.PNG" /></div>
                <p style="color:#000000;">4. para verificar que el pedido se recepciono correctamente debe dar clik en "Pedidos Recepcionados" este desplejara un listado con todos los pedidos recepcionados </p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/recepcion%20productos%204.PNG" /></div>
               <h4 style="color: #000000">Ingreso de Productos</h4>
               <p style="color:#000000;">1. para registrar un producto primero debe ingresar el nombre del proveedor y dar clik en "Buscar" luego de buscar este desplejara los datos del proveedor </p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/registrar%20productos%201.PNG" /></div>
               <p style="color:#000000;">2. ahora debe colocar los datos del producto a registrar en el caso que el producto no tenga fecha de vencimineto este se ingresara como 0 despues de colocar los datos debe dar clik en "Registrar"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/registrar%20productos%202.PNG" /></div>
               <p style="color:#000000;">3. Para modificar producto debe ingresar el codigo del producto luego dar clik en "Buscar" </p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/registrar%20productos%203.PNG" /></div>
               <p style="color:#000000;">4. despues de buscar se desplejaran los datos del producto donde debera llenar el campo que desea modificar con los nuevos datos y dar clik a "Modificar" </p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/registrar%20productos%204.PNG" /></div>
                <p style="color:#000000;">5. Para Eliminar debe ingresar el codigo del producto y dar clik a "Eliminar"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/registrar%20productos%205.PNG" /></div>
               <h4 style="color: #000000">Administracion de informes</h4>
                <p style="color:#000000;">1. Para generar un informe debe seleccionar el tipo de infomr que desea y dar clik en "Desplegar"</p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/generar%20informe%201.PNG" /></div>
                <p style="color:#000000;">2. Luego de desplegar se podra visualisar los datos nesesarios para dicho informe </p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/generar%20informe%202.PNG" /></div>
                 <p style="color:#000000;">3. para poder filtar datos del informe debe ingresar el dato que desea visualisar y luego dar clik en "Filtrar" en el caso que dese visualisar todos los datos nueva mente debe dar clik en "Mostrar Todo" </p>
               <div style="margin-left:10%"><img src="Img%20Manual%20Ayuda/generar%20informe%203.PNG" /></div>
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
