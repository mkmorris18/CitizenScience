<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ProjectDetails.aspx.cs" Inherits="CitizenScience.ProjectDetails" %>

<%--shows the projects details with visual clarity --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <table>
            <tr>
                <td>
                    <div>
                       <label>Project Name:</label>
                        <p><asp:Label ID="lblProjectName" runat="server" Text="Project Name"></asp:Label></p>
                    </div>
                    <div>
                        <label>Start Date:</label>
                        <p><asp:Label ID="lblStartDate" runat="server" Text="Start Date"></asp:Label></p>
                    </div>
                    <div>
                        <label>End Date:</label>
                        <p><asp:Label ID="lblEndDate" runat="server" Text="End Date"></asp:Label></p>
                    </div>
                    <div>
                        <label>Coordinator ID:</label>
                        <p><asp:Label ID="lblCoordinator" runat="server" Text="Coordinator"></asp:Label></p>
                    </div>
                    <div>
                        <label>Description:</label>
                       <p><asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label></p>
                    </div>
                    <div>
                        <asp:Button ID="btnReports" runat="server" Text="View Reports" OnClick="btnReports_OnClick" Visible='<%# HttpContext.Current.User.Identity.IsAuthenticated %>'/>
                    </div>
                </td>
            </tr>
        </table>
    </main>
</asp:Content>

