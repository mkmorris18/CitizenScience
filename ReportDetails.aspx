<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ReportDetails.aspx.cs" Inherits="CitizenScience.ReportDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .ReportDetails-table {
            border-collapse: collapse;
            width: 100%;
        }

        .ReportDetails-table th,
        .ReportDetails-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .ReportDetails-table th {
            background-color: #198754;
            color: #fff;
        }
    </style>

    <div class="container">
        <h2>Report Details</h2>

        <div class="card">
            <div class="card-body">
                <asp:Panel ID="errorMsg" runat="server" Visible="false">
                    Oops! It looks like something went wrong :(
                </asp:Panel>

                <asp:Panel ID="ObservationPanel" runat="server" Visible="false">
                    <table class="ReportDetails-table">
                        <thead>
                            <tr>
                                <th>ObservationID</th>
                                <th>Observation Date</th>
                                <th>Value</th>
                                <th>Notes</th>
                                <th>Tool ID</th>
                                <th>Latitude</th>
                                <th>Longitude</th>
                                <th>Report ID</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="ObservationTable" runat="server">
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
                        </tbody>
                    </table>
                </asp:Panel>

                <div class="card-footer">
                    <a href="Observations.aspx" class="btn btn-outline-success">Add Observation</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
