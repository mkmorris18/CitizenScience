<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ProjectDetails.aspx.cs" Inherits="CitizenScience.ProjectDetails" %>

<%--shows the projects details with visual clarity --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ProjectDetails-list">
        <h2 class="ProjectDetails-title">Project Details</h2>
        <table class="ProjectDetails-table">
            <asp:Repeater ID="ProjectDetailsRepeater" runat="server">
                <ItemTemplate>
                    <tr>
                        <td>
                                Project ID: <%# Eval("ProjectID") %> <br />
                                Project Name: <%# Eval("ProjectName") %> <br />
                                Start Date: <%# Eval("StartDate") %> <br />
                                End Date: <%# Eval("EndDate") %> <br />
                                Description: <%# Eval("Description") %> <br />
                                Coordinator: <%# Eval("Coordinator") %> <br />
                            
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <asp:Button ID="btnCreateReport" runat="server" Text="Create Report" OnClick="btnCreateReport_Click" Visible='<%# HttpContext.Current.User.Identity.IsAuthenticated %>'/>
    </div>
</asp:Content>
