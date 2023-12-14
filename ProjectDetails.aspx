<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ProjectDetails.aspx.cs" Inherits="CitizenScience.ProjectDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Project Details</h2>

        <div class="row">
            <asp:Repeater ID="ProjectDetailsRepeater" runat="server">
                <ItemTemplate>
                    <div class="col-md-8 mb-4">
                        <div class="card">
                            <div class="card-header bg-success text-white">
                                Project Details
                            </div>
                            <div class="card-body">
                                <p class="card-text">
                                    <strong>Project ID: </strong> <%# Eval("ProjectID") %><br />
                                    <strong>Project Name: </strong> <%# Eval("ProjectName") %> <br />
                                    <strong>Start Date: </strong> <%# Eval("StartDate") %> <br />
                                    <strong>End Date: </strong> <%# Eval("EndDate") %> <br />
                                    <strong>Description: </strong> <%# Eval("Description") %> <br />
                                    <strong>Coordinator: </strong> <%# Eval("Coordinator") %> <br />
                                </p>
                            </div>
                            <div class="card-footer">
                                <asp:Button ID="btnCreateReport" class="btn btn-outline-success" runat="server" Text="Create Report" OnClick="btnCreateReport_Click" Visible='<%# HttpContext.Current.User.Identity.IsAuthenticated %>' />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>


