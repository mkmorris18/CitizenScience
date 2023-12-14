<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Reports.aspx.cs" Inherits="CitizenScience.Reports" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    .report-container {
        border: 2px solid #198754;
        margin-bottom: 10px;
        padding: 10px; 
    }

    
    </style>   
    <main>
        <asp:Panel ID="ReportsPanel" runat="server" Visible="false">
            <h2>Reports</h2>
            <asp:Repeater ID="ReportsTable" runat="server">
                <ItemTemplate>
                    <div class="report-container">
                        <div class="report">
                            <p><%# Eval("ProjectName") %></p>
                            <p><a href='<%# "ReportDetails.aspx?ID=" + Eval("ReportID") %>'>View Report - <%# Eval("ReportID") %></a></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>
    </main>
</asp:Content>


