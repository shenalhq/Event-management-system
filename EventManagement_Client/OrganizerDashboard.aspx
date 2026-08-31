<%@ Page
    Title="Organizer Dashboard"
    Language="C#"
    MasterPageFile="~/Nav.Master"
    AutoEventWireup="true"
    CodeBehind="OrganizerDashboard.aspx.cs"
    Inherits="KMC_EventManagement_Client.OrganizerDashboard"
    Async="true" %>


<asp:Content
    ID="DashboardTitle"
    ContentPlaceHolderID="TitleContent"
    runat="server">

    Organizer Dashboard | KMC Events

</asp:Content>


<asp:Content
    ID="DashboardContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <!-- DASHBOARD HEADER -->

    <section class="dashboard-header">

        <div class="dashboard-header-container">

            <div>

                <span class="dashboard-small-title">
                    Organizer Portal
                </span>

                <h1>
                    Organizer Dashboard
                </h1>

                <asp:Label
                    ID="lblWelcome"
                    runat="server"
                    CssClass="dashboard-welcome">
                </asp:Label>

            </div>


            <a
                href="AddEvent.aspx"
                class="btn-primary">

                <i class="fa-solid fa-plus"></i>
                Create New Event

            </a>

        </div>

    </section>



    <section class="page-container">


        <!-- DASHBOARD STAT CARDS -->

        <div class="dashboard-stats">


            <!-- MY EVENTS -->

            <div class="stat-card">

                <div class="stat-icon">

                    <i class="fa-regular fa-calendar-days"></i>

                </div>

                <div>

                    <span>
                        My Events
                    </span>

                    <asp:Label
                        ID="lblEventCount"
                        runat="server"
                        CssClass="stat-number"
                        Text="0">
                    </asp:Label>

                </div>

            </div>



            <!-- PLATFORM -->

            <div class="stat-card">

                <div class="stat-icon">

                    <i class="fa-solid fa-landmark"></i>

                </div>

                <div>

                    <span>
                        Platform
                    </span>

                    <strong class="stat-text">
                        KMC Events
                    </strong>

                </div>

            </div>



            <!-- ACCOUNT -->

            <div class="stat-card">

                <div class="stat-icon">

                    <i class="fa-solid fa-circle-check"></i>

                </div>

                <div>

                    <span>
                        Account Status
                    </span>

                    <strong class="stat-text">
                        Active
                    </strong>

                </div>

            </div>


        </div>



        <!-- MY EVENTS HEADING -->

        <div class="dashboard-section-header">

            <div>

                <span class="section-small-title">
                    Event Management
                </span>

                <h2>
                    My Events
                </h2>

                <p>
                    View, edit and delete events created
                    by your organizer account.
                </p>

            </div>

        </div>


        <!-- SUCCESS / ERROR MESSAGE -->

        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="dashboard-message">
        </asp:Label>



        <!-- EVENT TABLE -->

        <div class="dashboard-table-card">

            <asp:GridView
                ID="gvEvents"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="dashboard-table"
                GridLines="None"
                DataKeyNames="EventId"
                EmptyDataText="You have not created any events yet."
                OnRowCommand="gvEvents_RowCommand">

                <Columns>


                    <asp:BoundField
                        DataField="EventId"
                        HeaderText="ID" />


                    <asp:BoundField
                        DataField="Title"
                        HeaderText="Event Name" />


                    <asp:BoundField
                        DataField="EventDate"
                        HeaderText="Date"
                        DataFormatString="{0:dd MMM yyyy}" />


                    <asp:BoundField
                        DataField="EventType"
                        HeaderText="Type" />


                    <asp:BoundField
                        DataField="Location"
                        HeaderText="Location" />


                    <asp:BoundField
                        DataField="Capacity"
                        HeaderText="Capacity" />



                    <asp:TemplateField
                        HeaderText="Actions">

                        <ItemTemplate>

                            <div class="dashboard-actions">


                                <!-- VIEW -->

                                <a
                                    class="action-button action-view"
                                    title="View Event"
                                    href='EventDetails.aspx?id=<%# Eval("EventId") %>'>

                                    <i class="fa-solid fa-eye"></i>

                                    <span>
                                        View
                                    </span>

                                </a>



                                <!-- EDIT -->

                                <a
                                    class="action-button action-edit"
                                    title="Edit Event"
                                    href='EditEvent.aspx?id=<%# Eval("EventId") %>'>

                                    <i class="fa-solid fa-pen-to-square"></i>

                                    <span>
                                        Edit
                                    </span>

                                </a>



                                <!-- DELETE -->

                                <asp:LinkButton
                                    ID="btnDelete"
                                    runat="server"
                                    CssClass="action-button action-delete"
                                    CommandName="DeleteEvent"
                                    CommandArgument='<%# Eval("EventId") %>'
                                    CausesValidation="false"
                                    OnClientClick="return confirm('Are you sure you want to delete this event?');">

                                    <i class="fa-solid fa-trash-can"></i>

                                    <span>
                                        Delete
                                    </span>

                                </asp:LinkButton>


                            </div>

                        </ItemTemplate>

                    </asp:TemplateField>


                </Columns>

            </asp:GridView>

        </div>


    </section>


</asp:Content>