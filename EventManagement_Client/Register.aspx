<%@ Page
    Title="Event Registration"
    Language="C#"
    MasterPageFile="~/Nav.Master"
    AutoEventWireup="true"
    CodeBehind="Register.aspx.cs"
    Inherits="KMC_EventManagement_Client.Register"
    Async="true" %>


<asp:Content
    ID="RegisterTitle"
    ContentPlaceHolderID="TitleContent"
    runat="server">

    Event Registration | KMC Events

</asp:Content>


<asp:Content
    ID="RegisterContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <section class="page-container">


        <div class="form-card">


            <span class="section-small-title">
                Participant Registration
            </span>


            <h1>
                Register for Event
            </h1>


            <p class="form-description">

                Enter your details below to complete
                your registration.

            </p>


            <div class="registration-event-box">

                <span>
                    Registering for
                </span>

                <asp:Label
                    ID="lblEvent"
                    runat="server">
                </asp:Label>

            </div>


            <div class="form-group">

                <label class="form-label">
                    Full Name
                </label>

                <asp:TextBox
                    ID="txtName"
                    runat="server"
                    CssClass="form-input"
                    placeholder="Enter your full name">
                </asp:TextBox>

            </div>


            <div class="form-group">

                <label class="form-label">
                    Email Address
                </label>

                <asp:TextBox
                    ID="txtEmail"
                    runat="server"
                    CssClass="form-input"
                    TextMode="Email"
                    placeholder="example@email.com">
                </asp:TextBox>

            </div>


            <asp:Button
                ID="btnRegister"
                runat="server"
                Text="Complete Registration"
                CssClass="btn-primary"
                OnClick="btnRegister_Click" />


            <a
                href="Default.aspx"
                class="btn-secondary">

                Cancel

            </a>


            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="form-message">
            </asp:Label>


        </div>


    </section>


</asp:Content>