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


### Activate Cloud Shell

* Cloud Shell is a virtual machine that is loaded with development tools. It offers a persistent 5GB home directory and runs on the Google Cloud. Cloud Shell provides command-line access to your Google Cloud resources.

* Click Activate Cloud Shell Activate Cloud Shell icon at the top of the Google Cloud console.
When you are connected, you are already authenticated, and the project is set to your PROJECT_ID. 

* The output contains a line that declares the PROJECT_ID for this session:Your Cloud Platform project in this session is set to YOUR_PROJECT_ID

* gcloud is the command-line tool for Google Cloud. It comes pre-installed on Cloud Shell and supports tab-completion.

     * gcloud auth list

* Click Authorize.

* To set the active account, run:
     * gcloud config set account `ACCOUNT`

* You can list the project ID with this command:

     * gcloud config list project


### Task 1. Create a function

* First, you're going to create a simple function named helloWorld. This function writes a message to the Cloud Functions logs. It is triggered by cloud function events and accepts a callback function used to signal completion of the function.

* For this lab the cloud function event is a cloud pub/sub topic event. A pub/sub is a messaging service where the senders of messages are decoupled from the receivers of messages. When a message is sent or posted, a subscription is required for a receiver to be alerted and receive the message. 


###### To create a cloud function:

* In Cloud Shell, run the following command to set the default region:

     * gcloud config set compute/region REGION

* Create a directory for the function code:

     * mkdir gcf_hello_world

* Move to the gcf_hello_world directory:
    
     * cd gcf_hello_world

* Create and open index.js to edit:

     * nano index.js

            ```js
            Copy the following into the index.js file:
            /**
            * Background Cloud Function to be triggered by Pub/Sub.
            * This function is exported by index.js, and executed when
            * the trigger topic receives a message.
            *
            * @param {object} data The event payload.
            * @param {object} context The event metadata.
            */
            exports.helloWorld = (data, context) => {
            const pubSubMessage = data;
            const name = pubSubMessage.data
                ? Buffer.from(pubSubMessage.data, 'base64').toString() : "Hello World";

            console.log(`My Cloud Function: ${name}`);
            };
            ```

* Exit nano (Ctrl+x) and save (Y) the file.


### Task 2. Create a cloud storage bucket and  Pub Sub topic

* Use the following command to create a new cloud storage bucket for your function:

     * gsutil mb -p [PROJECT_ID] gs://[BUCKET_NAME]

* PROJECT_ID is the Project ID in the lab details panel on the left of this lab: <filled in at lab start>

* BUCKET_NAME is the name you give to the bucket. You can use the Project ID as the bucket name to ensure a globally unique name: <filled in at lab start>

* Create a Pubsub topic with topic name as **hello_world**

### Task 3. Deploy your function

* When deploying a new function, you must specify --trigger-topic, --trigger-bucket, or --trigger-http. When deploying an update to an existing function, the function keeps the existing trigger unless otherwise specified.

* For this lab, you'll set the --trigger-topic as hello_world.

* Deploy the function to a pub/sub topic named hello_world, replacing [BUCKET_NAME] with the name of your bucket:

     * gcloud functions deploy helloWorld \
            --gen2 \
            --stage-bucket demobucket_cf_pubsub \
            --trigger-topic hello_world \
            --runtime nodejs20 \
            --allow-unauthenticated \
            --region=us-east4

* Note: If you get OperationError, ignore the warning and re-run the command.If prompted, enter Y to allow unauthenticated invocations of a new function.

* Verify the status of the function:
    
     * gcloud functions describe helloWorld

* Find the revision IDs of the Cloud Run service underlying your function:

     * gcloud run revisions list --service helloworld \
            --region us-east4 

* Use the gcloud run services update-traffic command with your revision IDs to change the traffic configuration. For example, the following command splits traffic 50/50 between two revisions:

    * gcloud run services update-traffic  helloworld\
            --region us-east4 \
            --to-revisions helloworld-00002-saf=60,helloworld-00001-hoh=40* 

* An ACTIVE status indicates that the function has been deployed.

        ```
        entryPoint: helloWorld
        eventTrigger:
        eventType: providers/cloud.pubsub/eventTypes/topic.publish
        failurePolicy: {}
        resource:
        ...
        status: ACTIVE
        ...
        ```

* Every message published in the topic triggers function execution, the message contents are passed as input data.


### Task 4. Test the function

* After you deploy the function and know that it's active, test that the function writes a message to the cloud log after detecting an event.Enter this command to create a message test of the function:

     * DATA=$(printf 'Hello World!'|base64) && gcloud functions call helloWorld --data '{"data":"'$DATA'"}'

* The cloud tool returns the execution ID for the function, which means a message has been written in the log.Example output:

        ```
        executionId: 3zmhpf7l6j5b
        View logs to confirm that there are log messages with that execution ID.
        ```

### Task 5. View logs

* Check the logs to see your messages in the log history:

     * gcloud functions logs read helloWorld

* If the function executed successfully, messages in the log appear as follows:

        ```
        LEVEL: D
        NAME: helloWorld
        EXECUTION_ID: 4bgl3jw2a9i3
        TIME_UTC: 2023-03-23 13:45:31.545
        LOG: Function execution took 912 ms, finished with status: 'ok'
        
        LEVEL: I
        NAME: helloWorld
        EXECUTION_ID: 4bgl3jw2a9i3
        TIME_UTC: 2023-03-23 13:45:31.533
        LOG: My Cloud Function: Hello World!
        
        LEVEL: D
        NAME: helloWorld
        EXECUTION_ID: 4bgl3jw2a9i3
        TIME_UTC: 2023-03-23 13:45:30.633
        LOG: Function execution started
        ```

* To delete the Cloud Function you created run the following command:
     
     * gcloud functions delete helloWorld --gen2 --region us-east4 
  
--------------------------------------------------------------------------------------------------------------------

  <div class="footer">
              copyright © 2022—2023 Cloud & AI Analytics. 
                                      All rights reserved
          </div>