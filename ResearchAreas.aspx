<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ResearchAreas.aspx.cs" Inherits="CitizenScience.ResearchAreas" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
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
