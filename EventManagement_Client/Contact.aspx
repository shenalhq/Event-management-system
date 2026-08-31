<%@ Page
    Title="Contact Us"
    Language="C#"
    MasterPageFile="~/Nav.Master"
    AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs"
    Inherits="KMC_EventManagement_Client.Contact"
     Async="true"%>


<asp:Content
    ID="ContactTitle"
    ContentPlaceHolderID="TitleContent"
    runat="server">

    Contact Us | KMC Event Management

</asp:Content>


<asp:Content
    ID="ContactContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <!-- CONTACT HERO -->

    <section class="subpage-hero contact-hero">

        <div class="subpage-hero-overlay"></div>

        <div class="subpage-hero-content">

            <span class="hero-badge">
                Contact KMC
            </span>

            <h1>
                Get in Touch
            </h1>

            <p>
                Have a question about an event or the
                KMC Event Management Platform?
                Contact us using the information below.
            </p>

        </div>

    </section>



    <section class="page-container">

        <div class="contact-layout">


            <!-- CONTACT DETAILS -->

            <div class="contact-information">

                <span class="section-small-title">
                    Contact Information
                </span>

                <h2>
                    Kandy Municipal Council
                </h2>

                <p class="contact-intro">
                    Contact the Kandy Municipal Council
                    for assistance related to city
                    events and this event management
                    platform.
                </p>


                <div class="contact-info-card">

                    <div class="contact-icon">

                        <i class="fa-solid fa-location-dot"></i>

                    </div>

                    <div>

                        <h3>
                            Address
                        </h3>

                        <p>
                            Kandy Municipal Council
                        </p>

                        <p>
                            Kandy, Sri Lanka
                        </p>

                    </div>

                </div>


                <div class="contact-info-card">

                   <div class="contact-icon">

                    <i class="fa-solid fa-envelope"></i>

                </div>

                    <div>

                        <h3>
                            Email
                        </h3>

                        <p>
                            Contact Kandy Municipal
                            Council through its official
                            communication channels.
                        </p>

                    </div>

                </div>


                <div class="contact-info-card">

                  <div class="contact-icon">

                    <i class="fa-regular fa-clock"></i>

                </div>

                    <div>

                        <h3>
                            Office Hours
                        </h3>

                        <p>
                            Monday - Friday
                        </p>

                        <p>
                            During normal council
                            working hours
                        </p>

                    </div>

                </div>


                <div class="contact-info-card">

                   <div class="contact-icon">

                    <i class="fa-solid fa-globe"></i>

                </div>

                    <div>

                        <h3>
                            Event Platform
                        </h3>

                        <p>
                            Browse events, register for
                            events and manage organizer
                            activities online.
                        </p>

                    </div>

                </div>

            </div>



            <!-- CONTACT FORM -->

            <div class="contact-form-card">

                <span class="section-small-title">
                    Send a Message
                </span>

                <h2>
                    How Can We Help?
                </h2>

                <p>
                    Complete the form below to send an
                    enquiry.
                </p>


                <div class="form-group">

                    <label class="form-label">
                        Full Name *
                    </label>

                    <asp:TextBox
                        ID="txtContactName"
                        runat="server"
                        CssClass="form-input"
                        placeholder="Enter your full name">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Email Address *
                    </label>

                    <asp:TextBox
                        ID="txtContactEmail"
                        runat="server"
                        TextMode="Email"
                        CssClass="form-input"
                        placeholder="example@email.com">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Subject *
                    </label>

                    <asp:TextBox
                        ID="txtContactSubject"
                        runat="server"
                        CssClass="form-input"
                        placeholder="Enter enquiry subject">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Message *
                    </label>

                    <asp:TextBox
                        ID="txtContactMessage"
                        runat="server"
                        CssClass="form-input form-textarea"
                        TextMode="MultiLine"
                        Rows="6"
                        placeholder="Write your message">
                    </asp:TextBox>

                </div>


                <asp:Button
                    ID="btnSendMessage"
                    runat="server"
                    Text="Send Message"
                    CssClass="btn-primary"
                    OnClick="btnSendMessage_Click" />


                <asp:Label
                    ID="lblContactMessage"
                    runat="server"
                    CssClass="form-message">
                </asp:Label>


            </div>

        </div>

    </section>


</asp:Content>