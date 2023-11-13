<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Projects.aspx.cs" Inherits="CitizenScience.Projects" %>

<%--provides links to project details page based on given ProjectID --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <asp:Repeater ID="Project" runat="server">
            <ItemTemplate>
                <a href="ProjectDetails.aspx?ProjectID=<%# Eval("ProjectID") %>">
                    <%# Eval("ProjectName") %>
                </a>
                <br />
            </ItemTemplate>
        </asp:Repeater>
    </main>
</asp:Content>
