using KMC_EventManagement_Client.Models;
using KMC_EventManagement_Client.Services;
using System;
using System.Threading.Tasks;

namespace KMC_EventManagement_Client
{
    public partial class Register : System.Web.UI.Page
    {
        protected async void Page_Load(
            object sender,
            EventArgs e)
        {
            if (!IsPostBack)
            {
                await LoadEventName();
            }
        }


        private async Task LoadEventName()
        {
            int eventId;

            if (!int.TryParse(
                Request.QueryString["id"],
                out eventId))
            {
                lblEvent.Text =
                    "Invalid Event";

                btnRegister.Enabled =
                    false;

                return;
            }


            EventService service =
                new EventService();


            EventModel eventItem =
                await service.GetEvent(eventId);


            if (eventItem == null)
            {
                lblEvent.Text =
                    "Event not found";

                btnRegister.Enabled =
                    false;

                return;
            }


            lblEvent.Text =
                eventItem.Title;
        }


        protected async void btnRegister_Click(
            object sender,
            EventArgs e)
        {
            int eventId;

            if (!int.TryParse(
                Request.QueryString["id"],
                out eventId))
            {
                lblMessage.CssClass =
                    "message-error";

                lblMessage.Text =
                    "Invalid event.";

                return;
            }


            if (string.IsNullOrWhiteSpace(
                txtName.Text))
            {
                lblMessage.CssClass =
                    "message-error";

                lblMessage.Text =
                    "Please enter your name.";

                return;
            }


            if (string.IsNullOrWhiteSpace(
                txtEmail.Text))
            {
                lblMessage.CssClass =
                    "message-error";

                lblMessage.Text =
                    "Please enter your email.";

                return;
            }


            RegistrationModel registration =
                new RegistrationModel
                {
                    EventId = eventId,

                    ParticipantName =
                        txtName.Text.Trim(),

                    ParticipantEmail =
                        txtEmail.Text.Trim()
                };


            RegistrationService service =
                new RegistrationService();


            bool success =
                await service.Register(
                    registration);


            if (success)
            {
                lblMessage.CssClass =
                    "message-success";

                lblMessage.Text =
                    "Registration completed successfully!";


                txtName.Text = "";

                txtEmail.Text = "";
            }
            else
            {
                lblMessage.CssClass =
                    "message-error";

                lblMessage.Text =
                    "Registration failed. You may already "
                    + "be registered or the event may be full.";
            }
        }
    }
}