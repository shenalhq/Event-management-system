# KMC Event Management System

A web-based event management system developed for the **Kandy Municipal Council (KMC)**.
The system allows the public to view and search events, while event organizers can create, update, and manage their own events.

This project was developed as part of my **second-year Software Engineering studies**.

---

## Project Overview

The KMC Event Management System provides a common platform for managing events organized within Kandy city.

The system follows a **Service-Oriented Architecture (SOA)**. The backend is developed using **ASP.NET Web API**, while the frontend is developed using **ASP.NET Web Forms**.

The API handles the main business logic and database operations, while the client application communicates with the API to display and manage event information.

---

## Main Features

### Public Users

* View available events
* Search events
* Search events by date
* Search events by event type
* View event details
* Register for events

### Event Organizers

* Register an organizer account
* Login to the system
* View organizer dashboard
* Create new events
* Edit existing events
* Delete events
* Manage only their own events

---

## Technologies Used

### Backend

* C#
* ASP.NET Web API
* .NET Framework 4.7.2
* Entity Framework
* REST API

### Frontend

* ASP.NET Web Forms
* HTML5
* CSS3
* JavaScript
* Bootstrap
* Font Awesome

### Database

* Microsoft SQL Server
* SQL Server Management Studio

### Development Tools

* Visual Studio 2019
* SQL Server Management Studio 18
* Postman
* Git
* GitHub

---

## System Architecture

The project contains two main applications.

```text
KMC Event Management System
│
├── KMC_EventManagement_API
│   ├── Controllers
│   ├── Models
│   ├── App_Start
│   └── Web.config
│
└── KMC_EventManagement_Client
    ├── Default.aspx
    ├── Login.aspx
    ├── Register.aspx
    ├── AddEvent.aspx
    ├── EditEvent.aspx
    ├── EventDetails.aspx
    ├── OrganizerDashboard.aspx
    ├── About.aspx
    ├── Contact.aspx
    ├── Nav.Master
    └── Web.config
```

---

## API Functions

The Web API provides services for the client application.

Some main API operations are:

```text
GET     /api/events
GET     /api/events/{id}
POST    /api/events
PUT     /api/events/{id}
DELETE  /api/events/{id}
```

The Events API is used to create, retrieve, update, search, and delete event information.

---

## Event Search

Users can search events using different conditions such as:

* Event date
* Event type
* Event information

Example:

```text
GET /api/events?date=2026-08-31
```

---

## Organizer Management

Organizers can create an account and login to the system.

After successful login, the organizer can access the organizer dashboard.

The organizer is allowed to:

```text
Create Event
Edit Event
Delete Event
View Created Events
```

An organizer should only be able to update or delete events created by that organizer.

---

## Participant Registration

Members of the public can view event information and register for an available event.

Participant information is stored in the database and connected to the selected event.

---

## Database

The system uses **Microsoft SQL Server** as the main database.

The database stores information such as:

* Organizers
* Events
* Participants
* Event registrations

Entity Framework is used to connect the ASP.NET Web API with the SQL Server database.

---

## How to Run the Project

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/kmc-event-management-system.git
```

Open the downloaded project folder.

---

### 2. Open the Project

Open the solution using:

```text
Visual Studio 2019
```

Make sure the required .NET Framework is installed.

```text
.NET Framework 4.7.2
```

---

### 3. Configure the Database

Open **SQL Server Management Studio** and create or restore the project database.

Then update the connection string inside the API `Web.config` file.

Example:

```xml
<connectionStrings>
  <add name="KmcDbContext"
       connectionString="YOUR_DATABASE_CONNECTION_STRING"
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

Replace:

```text
YOUR_DATABASE_CONNECTION_STRING
```

with your SQL Server connection string.

---

### 4. Run the API

Start:

```text
KMC_EventManagement_API
```

The API will run using a localhost URL similar to:

```text
https://localhost:44300/
```

The port number may be different depending on the Visual Studio configuration.

---

### 5. Configure the Client

Open the client project's `Web.config` file.

Update the API base URL.

Example:

```xml
<appSettings>
  <add key="ApiBaseUrl" value="https://localhost:44300/api/" />
</appSettings>
```

Make sure the API URL matches the URL used by the API project.

---

### 6. Run the Client Application

Start:

```text
KMC_EventManagement_Client
```

The web application will open in the browser.

---

## Main Web Pages

| Page                      | Purpose                      |
| ------------------------- | ---------------------------- |
| `Default.aspx`            | Main home page               |
| `Login.aspx`              | Organizer login              |
| `Register.aspx`           | Organizer registration       |
| `OrganizerDashboard.aspx` | Organizer dashboard          |
| `AddEvent.aspx`           | Create a new event           |
| `EditEvent.aspx`          | Update an existing event     |
| `EventDetails.aspx`       | View event information       |
| `About.aspx`              | Information about the system |
| `Contact.aspx`            | Contact information          |

---

## Testing

The API can be tested using **Postman**.

Example request:

```http
GET https://localhost:44300/api/events
```

Postman can also be used to test:

```text
GET requests
POST requests
PUT requests
DELETE requests
```

---

## Security

The application contains basic authentication and organizer authorization.

Event management operations check the organizer information before allowing an event to be modified.

For a production-level system, additional security improvements should be added, such as:

* Password hashing
* JWT authentication
* Role-based authorization
* HTTPS security
* Input validation

---

## Future Improvements

The system can be improved by adding:

* Email notifications
* Event approval system
* Online ticket booking
* QR code event registration
* Advanced organizer dashboard
* Event statistics
* Mobile responsive improvements
* Cloud deployment
* Secure authentication
* Password reset using email
* Admin management dashboard

---

## Learning Outcomes

Through this project, I gained experience in:

* Developing REST APIs
* ASP.NET Web API development
* ASP.NET Web Forms
* C# programming
* SQL Server database development
* Entity Framework
* Service-Oriented Architecture
* API testing using Postman
* Frontend and backend integration
* CRUD operations
* Git and GitHub

---

## Project Purpose

This project was developed for educational purposes as part of a **second-year Software Engineering assignment**.

The main purpose of the project is to understand how a Service-Oriented Architecture can be used to connect a web client, REST API, and database.

---

## Author

Shenal Perera

Second Year Software Engineering Project

