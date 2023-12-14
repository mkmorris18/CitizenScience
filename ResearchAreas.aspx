<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ResearchAreas.aspx.cs" Inherits="CitizenScience.ResearchAreas" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <h2>Research Areas</h2>
        
        <div class="row">
            <div class="col-md-12">
                <asp:Repeater ID="Projects" runat="server">
                    <ItemTemplate>
                        <div class="card text-white bg-success mb-4">
                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href='<%# "Projects.aspx?RA=" + Eval("ResearchID") %>' class="text-white">
                                        <%# Eval("ResearchName") %>
                                    </a>
                                </h4>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>


