>>> **ASSOCIATE CLOUD ENGINEER** - *Google Cloud Platform*
------------------------

> TITLE: "Introduction to A Tour of Google Cloud Hands-on Labs"
> 
> Author:
  >- Name: "Vignesh Sekar S"
  >- Designation: "Multi Cloud Architect"
  >- Tags: [Google Cloud, DataEngineer, Python, PySpark, SQL, BigData]

----------------------------------------------------------------------------------------------------------------

# Overview

* Google Cloud is a suite of cloud services hosted on Google's infrastructure. From computing and storage, to data analytics, machine learning, and networking.
  
* Google Cloud offers a wide variety of services and APIs that can be integrated with any cloud-computing application or project, from personal to enterprise-grade.
  
* Google Cloud Skills Boost is where you can access Google Cloud’s entire catalog of labs and courses. 

###### What you'll learn

* In this lab, you will learn about the following:

* The lab platform, and how to identify key features of a lab environment

* How to access the Cloud console with specific credentials

* Google Cloud projects, and identify common misconceptions about them

* How to use the Google Cloud Navigation menu to identify types of Google Cloud services

* Basic roles, and use the Cloud IAM service to inspect actions available to specific users.The API library, and examine its chief features


### Task 1. Accessing the Cloud Console


* **Open Google console**

   * This is the Cloud console: the web console and central development hub for Google Cloud. You will do the majority of your work in Google Cloud from this interface.

* **Project ID**

   * A Google Cloud project is an organizing entity for your Google Cloud resources. 

   * It often contains resources and services; for example, it may hold a pool of virtual machines, a set of databases, and a network that connects them together. Projects also contain settings and permissions, which specify security rules and who has access to what resources.

   * A Project ID is a unique identifier that is used to link Google Cloud resources and APIs to your specific project. 
   
   * Project IDs are unique across Google Cloud: there can be only one qwiklabs-gcp-xxx...., which makes it globally identifiable.

* **Username and Password**

   * These credentials represent an identity in the Cloud Identity and Access Management (Cloud IAM) service. 

   * This identity has access permissions (a role or roles) that allow you to work with Google Cloud resources in the project you've been allocated. 


### Task 2. Projects in the Cloud console

* Google Cloud projects were explained in the section about the contents of the Lab Connection pane. Here's the definition once again:

* A Google Cloud project is an organizing entity for your Google Cloud resources. It often contains resources and services; for example, it may hold a pool of virtual machines, a set of databases, and a network that connects them together. Projects also contain settings and permissions, which specify security rules and who has access to what resources.

* The upper-left corner of the central pane contains a card labeled Project info that looks like this:

###### Google Cloud Project info tile

* Your project has a name, number, and ID. These identifiers are frequently used when interacting with Google Cloud services. You are working with one project to get experience with a specific service or feature of Google Cloud.

###### View all projects

* In the Google Cloud console title bar, next to your project name, click the drop-down menu.

* In the Select a project dialog, click All. The resulting list of projects includes a "Qwiklabs Resources" project.

* It's not uncommon for large enterprises or experienced users of Google Cloud to have dozens to thousands of Google Cloud projects. Organizations use Google Cloud in different ways, so projects are a good method for organizing cloud computing services (by team or product, for example.)

* The Google Cloud project that you are working with is temporary, which means that the project and everything it contains will be deleted when the lab ends. Whenever you start a new lab, you will be given access to one or more new Google Cloud projects, and there (not "Qwiklabs Resources") is where you will run all of the lab steps.

* Click Cancel to return to the Cloud overview page.

### Task 3. Roles and permissions

* In addition to cloud computing services, Google Cloud also contains a collection of permissions and roles that define who has access to what resources. You can use the Cloud Identity and Access Management (Cloud IAM) service to inspect and modify these roles and permissions.

###### View your roles and permissions

* On the Navigation menu (Navigation menu), click IAM & Admin > IAM. This opens a page that contains a list of users and specifies permissions and roles granted to specific accounts.

* Account list with the your Username highlighted

* The Principal column displays googlexxxxxx_student@qwiklabs.net (Your matches the username you signed in with).
   
* The Name column displays student XXXXXXXX. The Role column displays Editor, which is one of three basic roles offered by Google Cloud. Basic roles set project-level permissions and, unless otherwise specified, control access and management to all Google Cloud services.

* The following table pulls definitions from the roles documentation, which gives a brief overview of viewer, editor, and owner role permissions:

| Role Name    | Permissions |
| ---------    | ----------- |
| roles/viewer | Permissions for read-only actions that do not affect state, such as viewing (but not  modifying) existing resources or data. |
| roles/editor | All viewer permissions, plus permissions for actions that modify state, such as changing existing resources. |
| roles/owner  | All editor permissions and permissions for the following actions: manage roles and permissions for a project and all resources within the project; set up billing for a project. |

	
* As an editor, you can create, modify, and delete Google Cloud resources. However, you can't add or delete members from Google Cloud projects.


### Task 4. APIs and services

* Google Cloud APIs are a key part of Google Cloud. Like services, the 200+ APIs, in areas that range from business administration to machine learning, all easily integrate with Google Cloud projects and applications.

* APIs are application programming interfaces that you can call directly or via the client libraries. Cloud APIs use resource-oriented design principles as described in the API Design Guide.

* When a lab provides a new Google Cloud project for a lab instance, it enables many APIs automatically so you can quickly start work on the lab's tasks. When you create your own Google Cloud projects outside of the lab environment, you will have to enable APIs yourself.

* Most Cloud APIs provide you with detailed information on your project’s usage of that API, including traffic levels, error rates, and even latencies, which helps you quickly triage problems with applications that use Google services.

* On the Navigation menu (Navigation menu), click APIs & Services > Library. The left pane, under the header Category, displays the different categories available.

   * In the API search bar, type **Dialogflow**, and then click Dialogflow API. The Dialogflow description page opens.

   * The **Dialogflow API** allows you to build rich conversational applications (e.g., for Google Assistant) without having to understand the underlying machine learning and natural language schema.

   * Click Enable.

   * Click the back button in your browser to verify that the API is now enabled.

   * **Dialogflow** tile with API enabled highlighted

* Click Try this API. A new browser tab displays documentation for the Dialogflow API. Explore this information, and close the tab when you're finished.

* To return to the main page of the Cloud console, on the Navigation menu, click Cloud overview.


------------------------------------------------------------------------------------------------------------------

  <div class="footer">
              copyright © 2022—2023 Cloud & AI Analytics. 
                                      All rights reserved
          </div>