using System;

namespace KMC_EventManagement_Client
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();

            Session.Abandon();

            Response.Redirect("~/Default.aspx");
        }
    }
}