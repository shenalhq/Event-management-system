using KMC_EventManagement_Client.Models;
using KMC_EventManagement_Client.Services;
using System;
using System.Threading.Tasks;

namespace KMC_EventManagement_Client
{
    public partial class EventDetails : System.Web.UI.Page
    {
        protected async void Page_Load(
            object sender,
            EventArgs e)
        {
            if (!IsPostBack)
            {
                await LoadEvent();
            }
        }


        private async Task LoadEvent()
        {
            int eventId;

            if (!int.TryParse(
                Request.QueryString["id"],
                out eventId))
            {
                Response.Redirect("Default.aspx");
                return;
            }


            EventService service =
                new EventService();


            EventModel eventItem =
                await service.GetEvent(eventId);


            if (eventItem == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }


            lblTitle.Text =
                eventItem.Title;
            if (!string.IsNullOrWhiteSpace(
               eventItem.ImageUrl))
            {
                imgEvent.ImageUrl =
                    "~/" + eventItem.ImageUrl;
            }
            else
            {
                imgEvent.ImageUrl =
                    "~/Images/event-placeholder.jpg";
            }


            lblDescription.Text =
                eventItem.Description;


            lblDate.Text =
                eventItem.EventDate
                .ToString("dd MMMM yyyy");


            lblTime.Text =
                eventItem.StartTime.ToString(@"hh\:mm")
                + " - "
                + eventItem.EndTime.ToString(@"hh\:mm");


            lblLocation.Text =
                eventItem.Location;


            lblType.Text =
                eventItem.EventType;


            lblCapacity.Text =
                eventItem.Capacity.ToString()
                + " Participants";
        }


        protected void btnRegister_Click(
            object sender,
            EventArgs e)
        {
            int eventId;

            if (int.TryParse(
                Request.QueryString["id"],
                out eventId))
            {
                Response.Redirect(
                    "Register.aspx?id=" + eventId);
            }
        }
    }
}