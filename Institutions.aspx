<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Institutions.aspx.cs" Inherits="CitizenScience.Institutions" %>

<%-- provides link to the ResearchAreas page based on InstitutionID --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <asp:Repeater ID="Institution" runat="server">
            <ItemTemplate>
                <a href="ResearchAreas.aspx?InstID<%# Eval("InstitutionID") %>">
                    <%# Eval("InstitutionName") %>
                </a>
                <br />
            </ItemTemplate>
        </asp:Repeater>
    </main>
</asp:Content>
