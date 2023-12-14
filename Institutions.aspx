<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Institutions.aspx.cs" Inherits="CitizenScience.Institutions" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Institutions</h2>
        
        <div class="row">
            <asp:Repeater ID="Institution" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card text-white bg-success">
                            
                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href='<%# "ResearchAreas.aspx?InstID=" + Eval("InstitutionID") %>' class="text-white">
                                        <%# Eval("InstitutionName") %>
                                    </a>
                                </h4>
                                
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <asp:Button type="button" class="btn btn-outline-success" ID="btnInstInfo" runat="server" Text="View Details about the Institutions" OnClick="btnInstInfo_Click" Visible='<%# HttpContext.Current.User.Identity.IsAuthenticated %>'/> 
        
    </div>
</asp:Content>






