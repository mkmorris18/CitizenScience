<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="InstitutionsInfo.aspx.cs" Inherits="CitizenScience.InstitutionsInfo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <style>
    .InstInfo-table {
        border-collapse: collapse;
        width: 100%;
    }

    .InstInfo-table th, .InstInfo-table td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    .InstInfo-table th {
        background-color: #198754; 
        color: #fff;
    }
    </style>

    <div class="InstInfo-list">
        <h2 class="InstInfo-title">Institution Information</h2>
        <table class="InstInfo-table">
            <tr class="table-success">
                <th>Institution ID</th>
                <th>Institution Name</th>
                <th>Address</th>
                <th>Contact Number</th>
                <th>Location</th>
                <th>Department</th>
            </tr>
            <tr>
                <td>300</td>
                <td>Science University</td>
                <td>123 Science St, Science City</td>
                <td>123-456-7890</td>
                <td>Science City</td>
                <td>Department of Earth Sciences</td>
            </tr>
            <tr>
                <td>301</td>
                <td>Tech College</td>
                <td>456 Tech Ave, Tech Town</td>
                <td>789-012-3456</td>
                <td>Tech Town</td>
                <td>Department of Environmental Sciences</td>
            </tr>   
        </table>
    </div>
    <br />
    <asp:Button type="button" class="btn btn-outline-success" ID="btnInstPage" runat="server" Text="Return to Institutions Page" OnClick="btnInstPage_Click" Visible='<%# HttpContext.Current.User.Identity.IsAuthenticated %>'/>
</asp:Content>

 
    
    
    
    
    
    
    
    
    
    
