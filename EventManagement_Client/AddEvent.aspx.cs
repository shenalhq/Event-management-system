using KMC_EventManagement_Client.Models;
using KMC_EventManagement_Client.Services;
using System;
using System.IO;

namespace KMC_EventManagement_Client
{
    public partial class AddEvent : System.Web.UI.Page
    {
        protected void Page_Load(
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
        }


        protected async void btnCreate_Click(
            object sender,
            EventArgs e)
        {
            try
            {
                lblMessage.Text = "";


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


                if (string.IsNullOrWhiteSpace(
                    txtDate.Text))
                {
                    ShowError(
                        "Please select an event date.");

                    return;
                }


                if (string.IsNullOrWhiteSpace(
                    ddlEventType.SelectedValue))
                {
                    ShowError(
                        "Please select an event type.");

                    return;
                }


                if (string.IsNullOrWhiteSpace(
                    txtLocation.Text))
                {
                    ShowError(
                        "Please enter the event location.");

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
                    out startTime))
                {
                    ShowError(
                        "Please select a valid start time.");

                    return;
                }


                if (!TimeSpan.TryParse(
                    txtEndTime.Text,
                    out endTime))
                {
                    ShowError(
                        "Please select a valid end time.");

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
                        "Please enter a valid participant capacity.");

                    return;
                }


                // =========================
                // IMAGE
                // =========================
                string imageUrl = null;

                try
                {
                    if (!fuEventImage.HasFile)
                    {
                        ShowError(
                            "Please select an event image.");

                        return;
                    }

                    string extension =
                        Path.GetExtension(
                            fuEventImage.FileName)
                        .ToLowerInvariant();

                    if (extension != ".jpg" &&
                        extension != ".jpeg" &&
                        extension != ".png")
                    {
                        ShowError(
                            "Only JPG, JPEG and PNG images are allowed.");

                        return;
                    }

                    if (fuEventImage.PostedFile.ContentLength <= 0)
                    {
                        ShowError(
                            "The selected image is empty.");

                        return;
                    }

                    if (fuEventImage.PostedFile.ContentLength >
                        5 * 1024 * 1024)
                    {
                        ShowError(
                            "Image must be smaller than 5 MB.");

                        return;
                    }

                    string folderPath =
                        Server.MapPath(
                            "~/Images/EventUploads/");

                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(
                            folderPath);
                    }

                    string fileName =
                        Guid.NewGuid()
                        .ToString("N")
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
                catch (UnauthorizedAccessException ex)
                {
                    ShowError(
                        "No permission to save the image. "
                        + ex.Message);

                    return;
                }
                catch (IOException ex)
                {
                    ShowError(
                        "Image file error: "
                        + ex.Message);

                    return;
                }
                catch (Exception ex)
                {
                    ShowError(
                        "Image upload error: "
                        + ex.Message);

                    return;
                }



                // =========================
                // EVENT MODEL
                // =========================

                EventModel eventModel =
                    new EventModel
                    {
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
                            Convert.ToInt32(
                                Session["OrganizerId"]),

                        ImageUrl =
                            imageUrl
                    };


                EventService service =
                    new EventService();


                bool success;

                try
                {
                    success =
                        await service.CreateEvent(
                            eventModel);
                }
                catch (Exception ex)
                {
                    ShowError(
                        "API error: "
                        + ex.Message);

                    return;
                }


                if (!success)
                {
                    ShowError(
                        "Image saved, but event could not be saved through the API.");

                    return;
                }


                Response.Redirect(
                    "OrganizerDashboard.aspx",
                    false);

                Context.ApplicationInstance
                    .CompleteRequest();

                return;
            }
            catch (UnauthorizedAccessException ex)
            {
                ShowError(
                    "Image folder permission error: "
                    + ex.Message);
            }
            catch (DirectoryNotFoundException ex)
            {
                ShowError(
                    "Upload folder error: "
                    + ex.Message);
            }
            catch (Exception ex)
            {
                ShowError(
                    "Event creation error: "
                    + ex.Message);
            }
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