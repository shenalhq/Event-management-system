<%@ Page
    Title="Create Event"
    Language="C#"
    MasterPageFile="~/Nav.Master"
    AutoEventWireup="true"
    CodeBehind="AddEvent.aspx.cs"
    Inherits="KMC_EventManagement_Client.AddEvent"
    Async="true" %>

<asp:Content
    ID="AddEventTitle"
    ContentPlaceHolderID="TitleContent"
    runat="server">

    Create Event | KMC Events

</asp:Content>

<asp:Content
    ID="AddEventContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <section class="page-container">

        <div class="create-event-header">

            <span class="section-small-title">
                Organizer Portal
            </span>

            <h1>
                Create New Event
            </h1>

            <p>
                Add a new event to the KMC Event Management Platform.
            </p>

        </div>

        <div class="form-card create-event-form">

            <div class="form-group">

                <label class="form-label">
                    Event Title *
                </label>

                <asp:TextBox
                    ID="txtTitle"
                    runat="server"
                    CssClass="form-input"
                    placeholder="Enter event title">
                </asp:TextBox>

            </div>


            <div class="form-group">

                <label class="form-label">
                    Description
                </label>

                <asp:TextBox
                    ID="txtDescription"
                    runat="server"
                    CssClass="form-input form-textarea"
                    TextMode="MultiLine"
                    Rows="5"
                    placeholder="Enter event description">
                </asp:TextBox>

            </div>


            <div class="form-row">

                <div class="form-group">

                    <label class="form-label">
                        Event Date *
                    </label>

                    <asp:TextBox
                        ID="txtDate"
                        runat="server"
                        TextMode="Date"
                        CssClass="form-input">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Event Type *
                    </label>

                    <asp:DropDownList
                        ID="ddlEventType"
                        runat="server"
                        CssClass="form-input">

                        <asp:ListItem Value="">
                            Select Event Type
                        </asp:ListItem>

                        <asp:ListItem Value="Cultural">
                            Cultural
                        </asp:ListItem>

                        <asp:ListItem Value="Sports">
                            Sports
                        </asp:ListItem>

                        <asp:ListItem Value="Community">
                            Community
                        </asp:ListItem>

                        <asp:ListItem Value="Education">
                            Education
                        </asp:ListItem>

                        <asp:ListItem Value="Business">
                            Business
                        </asp:ListItem>

                        <asp:ListItem Value="Music">
                            Music
                        </asp:ListItem>

                        <asp:ListItem Value="Other">
                            Other
                        </asp:ListItem>

                    </asp:DropDownList>

                </div>

            </div>


            <div class="form-row">

                <div class="form-group">

                    <label class="form-label">
                        Start Time *
                    </label>

                    <asp:TextBox
                        ID="txtStartTime"
                        runat="server"
                        TextMode="Time"
                        CssClass="form-input">
                    </asp:TextBox>

                </div>


                <div class="form-group">

                    <label class="form-label">
                        End Time *
                    </label>

                    <asp:TextBox
                        ID="txtEndTime"
                        runat="server"
                        TextMode="Time"
                        CssClass="form-input">
                    </asp:TextBox>

                </div>

            </div>


            <div class="form-group">

                <label class="form-label">
                    Location *
                </label>

                <asp:TextBox
                    ID="txtLocation"
                    runat="server"
                    CssClass="form-input"
                    placeholder="Enter event location">
                </asp:TextBox>

            </div>


            <div class="form-group">

                <label class="form-label">
                    Participant Capacity *
                </label>

                <asp:TextBox
                    ID="txtCapacity"
                    runat="server"
                    TextMode="Number"
                    CssClass="form-input"
                    placeholder="Example: 300">
                </asp:TextBox>

            </div>


            <div class="form-group">

                <label class="form-label">
                    Event Image *
                </label>

                <asp:FileUpload
                    ID="fuEventImage"
                    runat="server"
                    CssClass="form-input" />

                <small class="form-help">
                    JPG, JPEG or PNG only. Maximum size 5 MB.
                </small>

            </div>


            <div class="form-action-row">

                <asp:Button
                    ID="btnCreate"
                    runat="server"
                    Text="Create Event"
                    CssClass="btn-primary"
                    OnClick="btnCreate_Click" />

                <a
                    href="OrganizerDashboard.aspx"
                    class="btn-secondary">

                    Cancel

                </a>

            </div>


            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="form-message">
            </asp:Label>

        </div>

    </section>

</asp:Content>