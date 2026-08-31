<%@ Page
    Title="Edit Event"
    Language="C#"
    MasterPageFile="~/Nav.Master"
    AutoEventWireup="true"
    CodeBehind="EditEvent.aspx.cs"
    Inherits="KMC_EventManagement_Client.EditEvent"
    Async="true" %>


<asp:Content
    ID="EditTitle"
    ContentPlaceHolderID="TitleContent"
    runat="server">

    Edit Event | KMC Events

</asp:Content>


<asp:Content
    ID="EditContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <section class="page-container">


        <div class="create-event-header">

            <span class="section-small-title">
                Organizer Portal
            </span>

            <h1>
                Edit Event
            </h1>

            <p>
                Update the information for your event.
            </p>

        </div>



        <div class="form-card create-event-form">


            <!-- EVENT TITLE -->

            <div class="form-group">

                <label class="form-label">
                    Event Title *
                </label>

                <asp:TextBox
                    ID="txtTitle"
                    runat="server"
                    CssClass="form-input">
                </asp:TextBox>

            </div>



            <!-- DESCRIPTION -->

            <div class="form-group">

                <label class="form-label">
                    Description
                </label>

                <asp:TextBox
                    ID="txtDescription"
                    runat="server"
                    CssClass="form-input form-textarea"
                    TextMode="MultiLine"
                    Rows="5">
                </asp:TextBox>

            </div>



            <!-- DATE / TYPE -->

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

                        <asp:ListItem
                            Value=""
                            Text="Select Event Type">
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



            <!-- TIMES -->

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



            <!-- LOCATION -->

            <div class="form-group">

                <label class="form-label">
                    Location *
                </label>

                <asp:TextBox
                    ID="txtLocation"
                    runat="server"
                    CssClass="form-input">
                </asp:TextBox>

            </div>



            <!-- CAPACITY -->

            <div class="form-group">

                <label class="form-label">
                    Participant Capacity *
                </label>

                <asp:TextBox
                    ID="txtCapacity"
                    runat="server"
                    TextMode="Number"
                    CssClass="form-input">
                </asp:TextBox>

            </div>

            <!--Images-->
            <div class="form-group">

                <label class="form-label">
                    Current Event Image
                </label>

                <asp:Image
                    ID="imgCurrentEvent"
                    runat="server"
                    CssClass="edit-event-image"
                    AlternateText="Current Event Image" />

            </div>


            <div class="form-group">

                <label class="form-label">
                    Change Event Image
                </label>

                <asp:FileUpload
                    ID="fuEventImage"
                    runat="server"
                    CssClass="form-input" />

                <small class="form-help">
                    JPG, JPEG or PNG only.
                    Leave empty to keep the current image.
                </small>

            </div>



            <!-- BUTTONS -->

            <div class="form-action-row">

                <asp:LinkButton
                    ID="btnUpdate"
                    runat="server"
                    CssClass="btn-primary"
                    OnClick="btnUpdate_Click">

                    <i class="fa-solid fa-floppy-disk"></i>
                    Save Changes

                </asp:LinkButton>


                <a
                    href="OrganizerDashboard.aspx"
                    class="btn-secondary">

                    <i class="fa-solid fa-xmark"></i>
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