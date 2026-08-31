using KMC_EventManagement_Client.Models;
using KMC_EventManagement_Client.Services;
using System;
using System.Threading.Tasks;

namespace KMC_EventManagement_Client
{
    public partial class Login :
        System.Web.UI.Page
    {
        protected async void btnLogin_Click(
            object sender,
            EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(
                txtEmail.Text))
            {
                lblMessage.Text =
                    "Enter email.";
                return;
            }

            if (string.IsNullOrWhiteSpace(
                txtPassword.Text))
            {
                lblMessage.Text =
                    "Enter password.";
                return;
            }

            OrganizerService service =
                new OrganizerService();

            OrganizerModel organizer =
                await service.Login(
                    txtEmail.Text.Trim(),
                    txtPassword.Text);

            if (organizer == null)
            {
                lblMessage.Text =
                    "Invalid email or password.";
                return;
            }

            Session["OrganizerId"] =
                organizer.OrganizerId;

            Session["OrganizerName"] =
                organizer.Name;

            Session["OrganizerEmail"] =
                organizer.Email;

             Response.Redirect(
             "OrganizerDashboard.aspx",
             false);

                    Context.ApplicationInstance
                        .CompleteRequest();

                    return;
        }
    }
}