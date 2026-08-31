using KMC_EventManagement_Client.Models;
using KMC_EventManagement_Client.Services;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace KMC_EventManagement_Client
{
    public partial class Default :
        System.Web.UI.Page
    {
        protected async void Page_Load(
            object sender,
            EventArgs e)
        {
            if (!IsPostBack)
            {
                await LoadEvents();
            }
        }

        private async Task LoadEvents()
        {
            try
            {
                EventService service =
                    new EventService();

                List<EventModel> events =
                    await service.GetEvents();

                rptEvents.DataSource = events;

                rptEvents.DataBind();

                if (events == null ||
                    events.Count == 0)
                {
                    lblMessage.Text =
                        "No upcoming events available.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Unable to load events. "
                    + ex.Message;
            }
        }
    }
}