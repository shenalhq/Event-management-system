<%@ Page
    Title="Home"
    Language="C#"
    MasterPageFile="~/Nav.Master"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="KMC_EventManagement_Client.Default"
    Async="true" %>

<asp:Content
    ID="HomeTitle"
    ContentPlaceHolderID="TitleContent"
    runat="server">

    KMC Events | Kandy Municipal Council

</asp:Content>


<asp:Content
    ID="HomeContent"
    ContentPlaceHolderID="MainContent"
    runat="server">


    <!-- HERO SECTION -->

<section class="home-slider">

    <div class="slider-wrapper">

        <!-- Slide 1 -->
        <div class="home-slide active">

            <img
                src="Images/home1.jpg"
                alt="Kandy Event"
                class="slide-image" />

        </div>


        <!-- Slide 2 -->
        <div class="home-slide">

            <img
                src="Images/home2.jpg"
                alt="Kandy City Event"
                class="slide-image" />

        </div>


        <!-- Slide 3 -->
        <div class="home-slide">

            <img
                src="Images/home3.png"
                alt="Kandy Community Event"
                class="slide-image" />

        </div>

    </div>


    <!-- Dark Overlay -->

    <div class="slider-overlay"></div>


    <!-- Text Content -->

    <div class="slider-content">

        <span class="hero-badge">
            Kandy Municipal Council Events
        </span>

        <h1>
            Discover Events
            Happening Across Kandy
        </h1>

        <p>
            Discover cultural festivals,
            community programs, exhibitions,
            sports events and many more
            activities happening throughout
            the city of Kandy.
        </p>


        <div class="hero-buttons">

            <a
                href="#events"
                class="btn-primary">

                Explore Events

            </a>

            <a
                href="Login.aspx"
                class="btn-light">

                Organizer Login

            </a>

        </div>

    </div>


    <!-- Slider Dots -->

    <div class="slider-dots">

        <span
            class="slider-dot active"
            onclick="currentSlide(0)">
        </span>

        <span
            class="slider-dot"
            onclick="currentSlide(1)">
        </span>

        <span
            class="slider-dot"
            onclick="currentSlide(2)">
        </span>

    </div>

</section>


    <!-- EVENTS -->

    <section
        id="events"
        class="page-container">

        <div class="section-heading">

            <span class="section-small-title">
                Discover
            </span>

            <h2>
                Upcoming Events
            </h2>

            <p>
                Explore exciting events happening
                across Kandy.
            </p>

        </div>


        <div class="event-grid">

            <asp:Repeater
                ID="rptEvents"
                runat="server">

                <ItemTemplate>


                    <article class="event-card">


                        <!-- Event Image -->

                       <img
                            src='<%#
                                string.IsNullOrWhiteSpace(
                                    Convert.ToString(Eval("ImageUrl")))
                                ? "Images/event-placeholder.jpg"
                                : Convert.ToString(Eval("ImageUrl"))
                            %>'
                            class="event-image"
                            alt='<%# Eval("Title") %>' />


                        <div class="event-card-body">


                            <span class="event-type">

                                <%# Eval("EventType") %>

                            </span>


                            <h3>

                                <%# Eval("Title") %>

                            </h3>

                            <div class="event-meta">

                                <i class="fa-regular fa-calendar"></i>

                                <%#
                                    Convert.ToDateTime(
                                        Eval("EventDate")
                                    ).ToString("dd MMM yyyy")
                                %>

                            </div>

                          <div class="event-meta">

                                <i class="fa-solid fa-location-dot"></i>

                                <%# Eval("Location") %>

                            </div>


                            <div class="event-card-action">

                                <a
                                    class="btn-primary"
                                    href='EventDetails.aspx?id=<%# Eval("EventId") %>'>

                                    View Details

                                </a>

                            </div>


                        </div>

                    </article>


                </ItemTemplate>

            </asp:Repeater>

        </div>


        <asp:Label
            ID="lblMessage"
            runat="server">
        </asp:Label>


    </section>

   <script type="text/javascript">

       let currentIndex = 0;

       const slides =
           document.querySelectorAll(".home-slide");

       const dots =
           document.querySelectorAll(".slider-dot");


       function showSlide(nextIndex) {

           const currentSlideElement =
               slides[currentIndex];

           const nextSlideElement =
               slides[nextIndex];


           // Current image goes to LEFT

           currentSlideElement.style.transition =
               "transform 1s ease-in-out, opacity 1s ease-in-out";

           currentSlideElement.style.transform =
               "translateX(-100%)";

           currentSlideElement.style.opacity =
               "0";


           // Next image starts from RIGHT

           nextSlideElement.style.transition =
               "none";

           nextSlideElement.style.transform =
               "translateX(100%)";

           nextSlideElement.style.opacity =
               "1";

           nextSlideElement.style.left =
               "0";

           nextSlideElement.style.zIndex =
               "2";


           // Force browser refresh

           nextSlideElement.offsetHeight;


           nextSlideElement.style.transition =
               "transform 1s ease-in-out";

           nextSlideElement.style.transform =
               "translateX(0)";


           dots[currentIndex]
               .classList.remove("active");

           dots[nextIndex]
               .classList.add("active");


           setTimeout(function () {

               currentSlideElement
                   .classList.remove("active");

               currentSlideElement.style.transform =
                   "";

               currentSlideElement.style.opacity =
                   "";

               currentSlideElement.style.left =
                   "";

               nextSlideElement
                   .classList.add("active");

           }, 1000);


           currentIndex = nextIndex;

       }


       function nextSlide() {

           let nextIndex =
               currentIndex + 1;


           if (nextIndex >= slides.length) {

               nextIndex = 0;

           }


           showSlide(nextIndex);

       }


       function currentSlide(index) {

           if (index === currentIndex) {

               return;

           }

           showSlide(index);

       }


       setInterval(nextSlide, 4000);

   </script>


</asp:Content>