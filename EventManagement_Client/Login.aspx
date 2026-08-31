<%@ Page
    Title="Organizer Login"
    Language="C#"
    MasterPageFile="~/Nav.Master"
    AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="KMC_EventManagement_Client.Login"
    Async="true" %>

<asp:Content
    ID="LoginContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <div class="page-container">


        <div class="form-card">

            <h1>
                Organizer Login
            </h1>

            <p class="form-description">

                Sign in to manage and create
                your Kandy city events.

            </p>


            <div class="form-group">

                <label class="form-label">
                    Email Address
                </label>

                <asp:TextBox
                    ID="txtEmail"
                    runat="server"
                    CssClass="form-input">
                </asp:TextBox>

            </div>


            <div class="form-group">

                <label class="form-label">
                    Password
                </label>

                <asp:TextBox
                    ID="txtPassword"
                    runat="server"
                    CssClass="form-input"
                    TextMode="Password">
                </asp:TextBox>

            </div>


            <asp:Button
                ID="btnLogin"
                runat="server"
                Text="Login"
                CssClass="btn-primary"
                OnClick="btnLogin_Click" />


            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="message-error">
            </asp:Label>


        </div>


    </div>


</asp:Content>
