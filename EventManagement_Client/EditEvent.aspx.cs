using KMC_EventManagement_Client.Models;
using KMC_EventManagement_Client.Services;
using System;
using System.IO;
using System.Threading.Tasks;

namespace KMC_EventManagement_Client
{
    public partial class EditEvent :
        System.Web.UI.Page
    {
        private int EventId
        {
            get
            {
                int id;

                int.TryParse(
                    Request.QueryString["id"],
                    out id);

                return id;
            }
        }



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


            if (EventId <= 0)
            {
                Response.Redirect(
                    "OrganizerDashboard.aspx",
                    false);

                Context.ApplicationInstance
                    .CompleteRequest();

                return;
            }


            if (!IsPostBack)
            {
                await LoadEvent();
            }
        }



        private async Task LoadEvent()
        {
            EventService service =
                new EventService();


            EventModel eventItem =
                await service.GetEvent(
                    EventId);


            if (eventItem == null)
            {
                Response.Redirect(
                    "OrganizerDashboard.aspx",
                    false);

                Context.ApplicationInstance
                    .CompleteRequest();

                return;
            }


            int organizerId =
                Convert.ToInt32(
                    Session["OrganizerId"]);


            // Only creator can edit
            if (eventItem.OrganizerId !=
                organizerId)
            {
                Response.Redirect(
                    "OrganizerDashboard.aspx",
                    false);

                Context.ApplicationInstance
                    .CompleteRequest();

                return;
            }



            txtTitle.Text =
                eventItem.Title;


            txtDescription.Text =
                eventItem.Description;


            txtDate.Text =
                eventItem.EventDate
                .ToString("yyyy-MM-dd");


            txtStartTime.Text =
                eventItem.StartTime
                .ToString(@"hh\:mm");


            txtEndTime.Text =
                eventItem.EndTime
                .ToString(@"hh\:mm");


            txtLocation.Text =
                eventItem.Location;


            txtCapacity.Text =
                eventItem.Capacity
                .ToString();


            if (ddlEventType.Items.FindByValue(
                eventItem.EventType) != null)
            {
                ddlEventType.SelectedValue =
                    eventItem.EventType;
            }


            // Store current image
            ViewState["CurrentImage"] =
                eventItem.ImageUrl;


            if (!string.IsNullOrWhiteSpace(
                eventItem.ImageUrl))
            {
                imgCurrentEvent.ImageUrl =
                    "~/" + eventItem.ImageUrl;
            }
            else
            {
                imgCurrentEvent.ImageUrl =
                    "~/Images/event-placeholder.jpg";
            }
        }



        protected async void btnUpdate_Click(
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


            if (string.IsNullOrWhiteSpace(
                txtTitle.Text))
            {
                ShowError(
                    "Please enter the event title.");

                return;
            }


            DateTime eventDate;

            if (!DateTime.TryParse(
                txtDate.Text,
                out eventDate))
            {
                ShowError(
                    "Please select a valid event date.");

                return;
            }


            TimeSpan startTime;
            TimeSpan endTime;


            if (!TimeSpan.TryParse(
                txtStartTime.Text,
                out startTime)
                ||
                !TimeSpan.TryParse(
                    txtEndTime.Text,
                    out endTime))
            {
                ShowError(
                    "Please enter valid event times.");

                return;
            }


            if (endTime <= startTime)
            {
                ShowError(
                    "End time must be later than start time.");

                return;
            }


            int capacity;

            if (!int.TryParse(
                txtCapacity.Text,
                out capacity)
                ||
                capacity <= 0)
            {
                ShowError(
                    "Please enter a valid capacity.");

                return;
            }


            if (string.IsNullOrWhiteSpace(
                ddlEventType.SelectedValue))
            {
                ShowError(
                    "Please select an event type.");

                return;
            }


            string imageUrl =
                Convert.ToString(
                    ViewState["CurrentImage"]);


            // User selected a new image
            if (fuEventImage.HasFile)
            {
                string extension =
                    Path.GetExtension(
                        fuEventImage.FileName)
                    .ToLowerInvariant();

                // Check file type
                if (extension != ".jpg" &&
                    extension != ".jpeg" &&
                    extension != ".png")
                {
                    ShowError(
                        "Only JPG, JPEG and PNG images are allowed.");

                    return;
                }

                // Check file size - 5 MB
                if (fuEventImage.PostedFile.ContentLength >
                    5 * 1024 * 1024)
                {
                    ShowError(
                        "Image size must be less than 5 MB.");

                    return;
                }

                try
                {
                    string folderPath =
                        Server.MapPath(
                            "~/Images/EventUploads/");

                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(
                            folderPath);
                    }

                    string fileName =
                        Guid.NewGuid().ToString("N")
                        + extension;

                    string fullPath =
                        Path.Combine(
                            folderPath,
                            fileName);

                    fuEventImage.SaveAs(
                        fullPath);

                    imageUrl =
                        "Images/EventUploads/"
                        + fileName;
                }
                catch (Exception ex)
                {
                    ShowError(
                        "Unable to save image: "
                        + ex.Message);

                    return;
                }
            }



            // Verify existing event
            EventService service =
                new EventService();


            EventModel existingEvent =
                await service.GetEvent(
                    EventId);


            if (existingEvent == null)
            {
                ShowError(
                    "Event could not be found.");

                return;
            }


            int organizerId =
                Convert.ToInt32(
                    Session["OrganizerId"]);


            // Client side ownership check
            if (existingEvent.OrganizerId !=
                organizerId)
            {
                ShowError(
                    "You are not allowed to edit this event.");

                return;
            }



            EventModel eventModel =
                new EventModel
                {
                    EventId =
                        EventId,

                    Title =
                        txtTitle.Text.Trim(),

                    Description =
                        txtDescription.Text.Trim(),

                    EventDate =
                        eventDate,

                    StartTime =
                        startTime,

                    EndTime =
                        endTime,

                    Location =
                        txtLocation.Text.Trim(),

                    EventType =
                        ddlEventType.SelectedValue,

                    Capacity =
                        capacity,

                    OrganizerId =
                        organizerId,

                    ImageUrl =
                        imageUrl
                };


            bool success;

            try
            {
                success =
                    await service.UpdateEvent(
                        eventModel);
            }
            catch (Exception ex)
            {
                ShowError(
                    "Update failed: "
                    + ex.Message);

                return;
            }


            if (success)
            {
                Response.Redirect(
                    "OrganizerDashboard.aspx",
                    false);

                Context.ApplicationInstance
                    .CompleteRequest();

                return;
            }


            ShowError(
                "Unable to update the event.");
        }



        private void ShowError(
            string message)
        {
            lblMessage.CssClass =
                "form-message message-error";

            lblMessage.Text =
                message;
        }
    }
}