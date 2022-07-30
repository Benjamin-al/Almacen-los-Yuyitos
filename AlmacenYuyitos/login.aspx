<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="AlmacenYuyitos.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Almacen Los Yuyitos</title>
    <link rel="icon" href="Imagen/logotipo%20(1).png"/>
     <meta name="viewport" content="width=device-width" /> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
    <link href="Estilos/EstilosLogin.css" rel="stylesheet" />
</head>
<body>
      <div class="modal-dialog text-center">
        <div class="col-sm-8 main-section">
            <div class="modal-content">
                <div class="col-12 user-img">
                    <img src="Imagen/icon_user.png" class="imgUser" />
                </div>
                <form runat="server" class="cajaLogin">
                     <h2>Cuenta de usuario </h2>
                    <br />
                         <asp:Label Text="Usuario" CssClass="lblUser" runat="server" />

                         <asp:TextBox ID="txtuser" runat="server" CssClass="txtUser" placeholder="Ingrese Usuario"></asp:TextBox>

                         <asp:Label Text="Contraseña" CssClass="lblPass" runat="server" />

                         <asp:TextBox ID="txtpass" runat="server" TextMode="Password" CssClass="txtPass" placeholder="**********"></asp:TextBox>

                         <asp:Button ID="btnenviar" runat="server" Text="Iniciar sesion" OnClick="btnenviar_Click" CssClass="btnEnviar" />
                         <br>
                         <asp:Label ID="lblerror" runat="server" Text="" CssClass="lblError"></asp:Label>
                </form>
                
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
