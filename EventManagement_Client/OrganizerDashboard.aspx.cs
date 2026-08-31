using KMC_EventManagement_Client.Models;
using KMC_EventManagement_Client.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace KMC_EventManagement_Client
{
    public partial class OrganizerDashboard :
        System.Web.UI.Page
    {
        protected async void Page_Load(
            object sender,
            EventArgs e)
        {
            if (Session["OrganizerId"] == null)
            {
                Response.Redirect(
                    "Login.aspx",
                    false);

                Context.ApplicationInstance
                    .CompleteRequest();

                return;
            }


            if (!IsPostBack)
            {
                lblWelcome.Text =
                    "Welcome back, "
                    + Convert.ToString(
                        Session["OrganizerName"]);

                await LoadMyEvents();
            }
        }


        private async Task LoadMyEvents()
        {
            try
            {
                EventService service =
                    new EventService();


                List<EventModel> events =
                    await service.GetEvents();


                if (events == null)
                {
                    events =
                        new List<EventModel>();
                }


                int organizerId =
                    Convert.ToInt32(
                        Session["OrganizerId"]);


                List<EventModel> myEvents =
                    events
                    .Where(x =>
                        x.OrganizerId ==
                        organizerId)
                    .OrderByDescending(x =>
                        x.EventDate)
                    .ToList();


                gvEvents.DataSource =
                    myEvents;

                gvEvents.DataBind();


                lblEventCount.Text =
                    myEvents.Count.ToString();
            }
            catch (Exception ex)
            {
                lblMessage.CssClass =
                    "dashboard-message message-error";

                lblMessage.Text =
                    "Unable to load events. "
                    + ex.Message;
            }
        }



        protected async void gvEvents_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName != "DeleteEvent")
            {
                return;
            }


            if (Session["OrganizerId"] == null)
            {
                Response.Redirect(
                    "Login.aspx",
                    false);

                Context.ApplicationInstance
                    .CompleteRequest();

                return;
            }


            int eventId;

            if (!int.TryParse(
                e.CommandArgument.ToString(),
                out eventId))
            {
                lblMessage.CssClass =
                    "dashboard-message message-error";

                lblMessage.Text =
                    "Invalid event.";

                return;
            }


            int organizerId =
                Convert.ToInt32(
                    Session["OrganizerId"]);


            try
            {
                EventService service =
                    new EventService();


                bool success =
                    await service.DeleteEvent(
                        eventId,
                        organizerId);


                if (success)
                {
                    lblMessage.CssClass =
                        "dashboard-message message-success";

                    lblMessage.Text =
                        "Event deleted successfully.";

                    await LoadMyEvents();
                }
                else
                {
                    lblMessage.CssClass =
                        "dashboard-message message-error";

                    lblMessage.Text =
                        "Unable to delete this event.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.CssClass =
                    "dashboard-message message-error";

                lblMessage.Text =
                    "Delete failed. "
                    + ex.Message;
            }
        }
    }
}