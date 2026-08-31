<%@ Page
    Title="Event Details"
    Language="C#"
    MasterPageFile="~/Nav.Master"
    AutoEventWireup="true"
    CodeBehind="EventDetails.aspx.cs"
    Inherits="KMC_EventManagement_Client.EventDetails"
    Async="true" %>


<asp:Content
    ID="EventTitleContent"
    ContentPlaceHolderID="TitleContent"
    runat="server">

    Event Details | KMC Events

</asp:Content>


<asp:Content
    ID="EventDetailsContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <section class="page-container">

        <div class="section-heading">

            <span class="section-small-title">
                Event Information
            </span>

            <h2>
                Event Details
            </h2>

            <p>
                View complete information about this event.
            </p>

        </div>


        <div class="event-details-layout">


            <!-- EVENT IMAGE -->

            <div class="event-details-image-area">

               <asp:Image
                    ID="imgEvent"
                    runat="server"
                    CssClass="event-details-image"
                    AlternateText="Event Image" />

            </div>


            <!-- EVENT INFORMATION -->

            <div class="event-details-card">

                <span class="event-type">

                    <asp:Label
                        ID="lblType"
                        runat="server">
                    </asp:Label>

                </span>


                <asp:Label
                    ID="lblTitle"
                    runat="server"
                    CssClass="event-details-title">
                </asp:Label>


                <div class="event-detail-item">

                    <span class="event-detail-label">

                        <i class="fa-solid fa-align-left"></i>

                        Description

                    </span>

                    <asp:Label
                        ID="lblDescription"
                        runat="server">
                    </asp:Label>

                </div>


                <div class="event-detail-item">

                    <span class="event-detail-label">

                        <i class="fa-regular fa-calendar"></i>

                        Event Date

                    </span>
                    <asp:Label
                        ID="lblDate"
                        runat="server">
                    </asp:Label>

                </div>


                <div class="event-detail-item">

                    <span class="event-detail-label">

                        <i class="fa-regular fa-clock"></i>

                        Event Time

                    </span>

                    <asp:Label
                        ID="lblTime"
                        runat="server">
                    </asp:Label>

                </div>


                <div class="event-detail-item">

                    <span class="event-detail-label">

                        <i class="fa-solid fa-location-dot"></i>

                        Location

                    </span>

                    <asp:Label
                        ID="lblLocation"
                        runat="server">
                    </asp:Label>

                </div>


                <div class="event-detail-item">

                   <span class="event-detail-label">

                        <i class="fa-solid fa-users"></i>

                        Capacity

                    </span>

                    <asp:Label
                        ID="lblCapacity"
                        runat="server">
                    </asp:Label>

                </div>


                <div class="event-details-buttons">

                    <asp:Button
                        ID="btnRegister"
                        runat="server"
                        Text="Register for this Event"
                        CssClass="btn-primary"
                        OnClick="btnRegister_Click" />

                    <a
                        href="Default.aspx#events"
                        class="btn-secondary">

                        ← Back to Events

                    </a>

                </div>

            </div>

        </div>

    </section>

</asp:Content>