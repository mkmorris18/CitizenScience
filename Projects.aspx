<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Projects.aspx.cs" Inherits="CitizenScience.Projects" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Projects</h2>

        <div class="row">
            <asp:Repeater ID="Project" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card text-white bg-success">
                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href='<%# "ProjectDetails.aspx?ProjectID=" + Eval("ProjectID") %>' class="text-white">
                                        <%# Eval("ProjectName") %>
                                    </a>
                                </h4>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
