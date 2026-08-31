using System;

namespace KMC_EventManagement_Client
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(
            object sender,
            EventArgs e)
        {

        }


        protected void btnSendMessage_Click(
            object sender,
            EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(
                txtContactName.Text))
            {
                ShowError(
                    "Please enter your name.");

                return;
            }


            if (string.IsNullOrWhiteSpace(
                txtContactEmail.Text))
            {
                ShowError(
                    "Please enter your email address.");

                return;
            }


            if (string.IsNullOrWhiteSpace(
                txtContactSubject.Text))
            {
                ShowError(
                    "Please enter a subject.");

                return;
            }


            if (string.IsNullOrWhiteSpace(
                txtContactMessage.Text))
            {
                ShowError(
                    "Please enter your message.");

                return;
            }


            lblContactMessage.CssClass =
                "message-success";

            lblContactMessage.Text =
                "Thank you. Your message has been submitted successfully.";


            txtContactName.Text = "";

            txtContactEmail.Text = "";

            txtContactSubject.Text = "";

            txtContactMessage.Text = "";
        }


        private void ShowError(
            string message)
        {
            lblContactMessage.CssClass =
                "message-error";

            lblContactMessage.Text =
                message;
        }
    }
}