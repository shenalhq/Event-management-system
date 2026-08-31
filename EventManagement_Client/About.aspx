<%@ Page
    Title="About Us"
    Language="C#"
    MasterPageFile="~/Nav.Master"
    AutoEventWireup="true"
    CodeBehind="About.aspx.cs"
    Inherits="KMC_EventManagement_Client.About" %>


<asp:Content
    ID="AboutTitle"
    ContentPlaceHolderID="TitleContent"
    runat="server">

    About Us | KMC Event Management

</asp:Content>


<asp:Content
    ID="AboutContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <!-- ABOUT HERO -->

    <section class="subpage-hero about-hero">

        <div class="subpage-hero-overlay"></div>

        <div class="subpage-hero-content">

            <span class="hero-badge">
                Kandy Municipal Council
            </span>

            <h1>
                About KMC Events
            </h1>

            <p>
                Connecting the people of Kandy with
                cultural, community, educational,
                sports and entertainment events
                across the city.
            </p>

        </div>

    </section>



    <!-- ABOUT SYSTEM -->

    <section class="page-container">

        <div class="about-grid">

            <div class="about-image-area">

                <img
                    src="Images/home2.jpg"
                    alt="Kandy City"
                    class="about-main-image" />

            </div>


            <div class="about-text-area">

                <span class="section-small-title">
                    Our Platform
                </span>

                <h2>
                    Bringing Kandy's Events
                    Together in One Place
                </h2>

                <p>
                    The KMC Event Management Platform
                    is a centralized digital solution
                    developed to improve the way events
                    within Kandy are promoted, managed
                    and discovered.
                </p>

                <p>
                    Through this platform, members of
                    the public can easily discover
                    upcoming events, search for events
                    based on different criteria and
                    register to participate.
                </p>

                <p>
                    Event organizers such as community
                    groups, local businesses and other
                    organizations can create and manage
                    their own events through the
                    organizer portal.
                </p>

            </div>

        </div>

    </section>



    <!-- FEATURES -->

    <section class="about-feature-section">

        <div class="page-container">

            <div class="section-heading center-heading">

                <span class="section-small-title">
                    What We Provide
                </span>

                <h2>
                    One Platform for Kandy Events
                </h2>

                <p>
                    Designed to make event management
                    easier for organizers and event
                    discovery easier for citizens.
                </p>

            </div>


        <div class="about-feature-grid">

            <!-- Discover Events -->
            <div class="about-feature-card">

                <div class="about-feature-icon">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>

                <h3>
                    Discover Events
                </h3>

                <p>
                    Browse upcoming events taking
                    place throughout the city of
                    Kandy.
                </p>

            </div>


            <!-- Event Management -->
            <div class="about-feature-card">

                <div class="about-feature-icon">
                    <i class="fa-solid fa-calendar-days"></i>
                </div>

                <h3>
                    Event Management
                </h3>

                <p>
                    Authorized organizers can create
                    and manage their events through
                    a dedicated dashboard.
                </p>

            </div>


            <!-- Participant Registration -->
            <div class="about-feature-card">

                <div class="about-feature-icon">
                    <i class="fa-solid fa-users"></i>
                </div>

                <h3>
                    Participant Registration
                </h3>

                <p>
                    Members of the public can
                    register for available events
                    directly through the platform.
                </p>

            </div>


            <!-- API Integration -->
          <div class="about-feature-card">

            <div class="about-feature-icon">
                <i class="fa-solid fa-people-group"></i>
            </div>

            <h3>Community Events</h3>

            <p>
                Discover cultural, sports, educational, business and
                community events taking place across Kandy.
            </p>

        </div>

        </div>

                </div>

    </section>



    <!-- SOC SECTION -->

    <section class="page-container">

        <div class="about-soc-card">

            <div>

      
               <h2>Bringing Kandy Events Together</h2>

                <p>
                    The KMC Event Management Platform provides a central place for
                    residents and visitors to discover upcoming events happening
                    throughout Kandy.
                </p>

                <p>
                    Event organizers can publish and manage their events, while the
                    public can view event details, search for suitable events and
                    register to participate.
                </p>

            </div>

        </div>

    </section>


</asp:Content>