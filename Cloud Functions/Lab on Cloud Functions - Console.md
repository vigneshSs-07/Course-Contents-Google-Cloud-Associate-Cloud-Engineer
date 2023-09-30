>>> **ASSOCIATE CLOUD ENGINEER** - *Google Cloud Platform*
------------------------

> TITLE: "Introduction to Google Cloud - Google Kubernetes Engine"
> 
> Author:
  >- Name: "Vignesh Sekar S"
  >- Designation: "Multi Cloud Architect"
  >- Tags: [Google Cloud, DataEngineer, Python, PySpark, SQL, BigData]

-------------------------------------------------------------------------------------------------------------------


# Overview

* A cloud function is a piece of code that runs in response to an event, such as an HTTP request, a message from a messaging service, or a file upload. 
  
* Cloud events are things that happen in your cloud environment. These might be things like changes to data in a database, files added to a storage system, or a new virtual machine instance being created.
  
* Since cloud functions are event-driven, they only run when something happens. This makes them a good choice for tasks that need to be done quickly or that don't need to be running all the time.

* For example, you can use a cloud function to:

    * automatically generate thumbnails for images that are uploaded to Cloud Storage.

    * send a notification to a user's phone when a new message is received in Cloud Pub/Sub.

    * process data from a Cloud Firestore database and generate a report.

    * You can write your code in any language that supports Node.js, and you can deploy your code to the cloud with a few clicks. Once your cloud function is deployed, it will automatically start running in response to events.

* This hands-on lab shows you how to create, deploy, and test a cloud function using the Google Cloud console.

1. Create a cloud function
   
2. Deploy and test the function
   
3. View logs


### Task 1. Create a function

* In this step, you're going to create a cloud function using the console.In the console, click the Navigation menu (Navigation Menu icon) > Cloud Functions.

* Click Create function.

* In the Create function dialog, enter the following values:

<table>
  <tbody>
    <tr>
      <th>Field</th>
      <th align="center">Values</th>
    </tr>
    <tr>
      <td>Environment</td>
      <td align="center">2nd Gen</td>\
    </tr>
    <tr>
      <td>Function name</td>
      <td align="center">GCFunction</td>
    </tr>
    <tr>
      <td>Region</td>
      <td align="center">us-east4</td>
    </tr>
    <tr>
      <td>Trigger type</td>
      <td align="center">HTTPS</td>
    </tr>
    <tr>
      <td>Authentication</td>
      <td align="center">Allow unauthenticated invocations</td>
    </tr>
  </tbody>
</table>


* Memory allocated (In Runtime, Build, Connections and Security Settings)

* Keep it default

* Autoscaling

* Set the Maximum number of instance to 5 and then click Next

### Task 2. Deploy the function

* Still in the Create function dialog, in Source code for Inline editor use the default hello **Cloud & AI Analytics** function implementation already provided for index.js.

* At the bottom, click Deploy to deploy the function.

* After you click Deploy, the console redirects to the Cloud Functions Overview page.

    * Note:While the function is being deployed, the icon next to it is a small spinner. When it's deployed, the spinner is a green check mark.


### Task 3. Test the function

* Test the deployed function.In the Cloud Functions Overview page, click on GCFunction.

* Cloud Functions Overview page

* On function details dashboard, to test the function click on TESTING.

* Cloud Functions details page

* In the Triggering event field, enter the following text between the brackets {} and click Test the function.

    * "message":"Hello Cloud & AI Analytics!"

* In the Output field, you should see the message Success: Hello Cloud & AI Analytics!

* In the Logs field, a status code of 200 indicates success. (It may take a minute for the logs to appear.)A status code of 200 displays in the Logs field



### Task 4. View logs

* View logs from the Cloud Functions Overview page.Click the blue arrow to go back to the Cloud Functions Overview page.

* Display the menu for your function, and click View logs.

* View logs option in the function menu

* Example of the log history that displays in Query results:

* Log history on Query results page

* Your application is deployed, tested, and you can view the logs.

* Test the function



--------------------------------------------------------------------------------------------------------------------

  <div class="footer">
              copyright © 2022—2023 Cloud & AI Analytics. 
                                      All rights reserved
          </div>