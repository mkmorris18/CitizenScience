<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Observations.aspx.cs" Inherits="CitizenScience.Observations" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <asp:Panel ID="errorMsg" runat="server" Visible="False">
            Oops! It looks like something went wrong :(
        </asp:Panel>
        <asp:Panel ID="ObservationID" runat="server" Visible="false">
            <h2>Submit an Observation</h2>
            Notes: <asp:TextBox ID="NotesBox" runat="server"></asp:TextBox><br />
            <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />
        </asp:Panel>

        <asp:Panel ID="Success" runat="server" Visibile="false">
            <h2>Submission Confirmation</h2>
            <p>
                Thanks for your submission! Submission Confirmation:
                <asp:Label ID="ObNumber" runat="server"></asp:Label>
            </p>

        </asp:Panel>

        <asp:Panel ID="CreateObs" runat="server" Visible="false">
         <asp:LoginView runat="server" ID="LoginView1">
            <LoggedInTemplate>
                <a class="btn" runat="server" href="~/ReportDetails">Check out</a>
            </LoggedInTemplate>
        </asp:LoginView>
    </asp:Panel>


        






    </main>

































</asp:Content>