<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ReportDetails.aspx.cs" Inherits="CitizenScience.ReportDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <asp:Panel ID="errorMsg" runat="server" Visible="False">
            Oops! It looks like something went wrong :(
        </asp:Panel>
        <asp:Panel ID="ObservationPanel" runat="server" Visible="false">
            <asp:Repeater ID="ObservationTable" runat="server">
                <HeaderTemplate>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ObservationID</th>
                                <th>Observation Date</th>
                                <th>Value</th>
                                <th>Notes</th>
                                <th>Tool ID</th>
                                <th>ObservationID</th>
                                <th>Latitude</th>
                                <th>Longitude</th>
                                <th>Report ID</th>
                            </tr>
                        </thead>
                        <tbody>        
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("ObservationID") %></td>
                        <td><%# Eval("ObservedDate") %></td>
                        <td><%# Eval("Value") %></td>
                        <td><%# Eval("Notes") %></td>
                        <td><%# Eval("ToolID") %></td>
                        <td><%# Eval("Latitude") %></td>
                        <td><%# Eval("Longitude") %></td>
                        <td><%# Eval("ReportID") %></td>
                    </tr>
                </ItemTemplate>
                </asp:Repeater>
                <br />
            <a href="Observations.aspx" class="btn">Add Observation</a>


        </asp:Panel>
    </main>
</asp:Content>


