<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Reports.aspx.cs" Inherits="CitizenScience.Reports" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <asp:Panel ID="ReportsPanel" runat="server" Visible="false">
          <asp:Repeater ID="ReportsTable" runat="server">
            <ItemTemplate>
                <div class="report">
                   <p><%# Eval("ProjectName") %></p>
                   <p><a href="ReportDetails.aspx?ID=<%# Eval("ReportID") %>">View Report><%# Eval("ReportID") %></a></p>
               </div>
            </ItemTemplate>
          </asp:Repeater>
        </asp:Panel>
    </main>
</asp:Content>
