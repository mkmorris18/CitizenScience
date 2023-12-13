<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ResearchAreas.aspx.cs" Inherits="CitizenScience.ResearchAreas" %>

<%-- provides link to Projects page based on given ResearchID for the ResearchArea--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <h1 style="font-size: larger">Research Areas</h1>
        <asp:Repeater ID="Projects" runat="server">
            <ItemTemplate>
                <a href="Projects.aspx?RA=<%# Eval("ResearchID") %>">
                    <%# Eval("ResearchName") %>
                </a>
                <br />
            </ItemTemplate>
        </asp:Repeater>
    </main>
</asp:Content>
