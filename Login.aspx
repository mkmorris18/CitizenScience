<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.cs" Inherits="WebFormsIdentity.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .login-container {
            max-width: 400px;
            margin: 50px 0 0 20px; 
            padding: 20px;
            background-color: #fff;
            border: 1px solid #198754;
            border-radius: 5px;
        }

        .login-container h4 {
            font-size: 1.5rem;
            color: #198754;
        }

        .login-container hr {
            border-top: 1px solid #198754;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn-login {
            background-color: #fff;
            color: #198754;
            border: 2px solid #198754;
        }

        .btn-register {
            background-color: #fff;
            color: #198754;
            border: 2px solid #198754;
        }
    </style>
    <main>
        <div class="login-container">
            <h4>Log In</h4>
            <hr />
            <asp:PlaceHolder runat="server" ID="LoginStatus" Visible="false">
                <p>
                    <asp:Literal runat="server" ID="StatusText" />
                </p>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="LoginForm" Visible="false">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
                    <div>
                        <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                    <div>
                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <div>
                        <asp:Button runat="server" OnClick="SignIn" Text="Log in" CssClass="btn btn-login" />
                        <a href="Register" class="btn btn-register">Register</a>
                    </div>
                </div>
            </asp:PlaceHolder>
            <asp:Button ID="btnHomePage" href="Default.aspx" class="btn btn-outline-success" runat="server" Text="View Homepage" Visible="false" PostBackUrl="~/Default.aspx" />
            <asp:PlaceHolder runat="server" ID="LogoutButton" Visible="false">
                <div>
                    <div>
                        <asp:Button runat="server" class="btn btn-outline-success" OnClick="SignOut" Text="Log out" />
                    </div>
                </div>
            </asp:PlaceHolder>
        </div>
    </main>
</asp:Content>
