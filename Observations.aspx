<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Observations.aspx.cs" Inherits="CitizenScience.Observations" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-8">
                
                
                <asp:Panel ID="errorMsg" runat="server" Visible="false" CssClass="alert alert-danger">
                    Oops! It looks like something went wrong.
                </asp:Panel>

                <asp:Panel ID="ObservationSubID" runat="server" Visible="false">
                    <div class="mb-3">
                        <h2>Submit an Observation</h2>
                        <div class="mb-3">
                            <label for="NotesBox" class="form-label">Notes:</label>
                            <asp:TextBox ID="NotesBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" CssClass="btn btn-success" />
                    </div>
                </asp:Panel>

                <asp:Panel ID="CreateObs" runat="server" Visible="false">
                    <asp:LoginView runat="server" ID="LoginView1">
                        <LoggedInTemplate>
                            <a class="btn btn-primary" runat="server" href="~/ReportDetails">Create Report</a>
                        </LoggedInTemplate>
                    </asp:LoginView>
                </asp:Panel>
            </div>
        </div>
    </div>



































</asp:Content>