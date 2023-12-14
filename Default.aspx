<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CitizenScience._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
       <div class="jumbotron text-center">
        <h1 class="display-4">Welcome to the Citizen Science Homepage</h1>
        <p class="lead">Explore the world of science and research collaboratively.</p>
    </div>

    <div class="container">
        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Institutions</h5>
                        <p class="card-text">Discover various institutions involved in scientific research.</p>
                        <a href="Institutions.aspx" class="btn btn-success">Explore Institutions</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Research Areas</h5>
                        <p class="card-text">Explore different research areas and their contributions.</p>
                        <a href="ResearchAreas.aspx" class="btn btn-success">Explore Research Areas</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <asp:LoginView runat="server" ID="LoginView2">
                    <LoggedInTemplate>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Reports</h5>
                                <p class="card-text">Access reports.</p>
                                <a href="Reports.aspx" class="btn btn-success">Access Reports</a>
                            </div>
                        </div>
                    </LoggedInTemplate>

                    <AnonymousTemplate>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Login</h5>
                                <p class="card-text">Login to access additional features.</p>
                                <a href="Login.aspx" class="btn btn-primary">Login</a>
                            </div>
                        </div>
                    </AnonymousTemplate>
                </asp:LoginView>
            </div>
        </div>
    </div>
       
</asp:Content>

