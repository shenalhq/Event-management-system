using System;

namespace KMC_EventManagement_Client
{
    public partial class NavMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["OrganizerId"] != null)
            {
                phPublicNavigation.Visible = false;

                phOrganizerNavigation.Visible = true;
            }
            else
            {
                phPublicNavigation.Visible = true;

                phOrganizerNavigation.Visible = false;
            }
        }
    }
}