>>> **ASSOCIATE CLOUD ENGINEER** - *Google Cloud Platform*
------------------------

> TITLE: "Lab on Cloud Run - Hello AppRun"
> 
> Author:
  >- Name: "Vignesh Sekar"
  >- Designation: "Multi Cloud Architect"
  >- Tags: [Google Cloud, DataEngineer, Python, PySpark, SQL, BigData]


# Overview

* Cloud Run is a managed compute platform that enables you to run stateless containers that are invocable via HTTP requests. 
* Cloud Run is serverless: it abstracts away all infrastructure management, so you can focus on what matters most — building great applications.
* Cloud Run is built from Knative, letting you choose to run your containers either fully managed with Cloud Run, or in your Google Kubernetes Engine cluster with Cloud Run on GKE.
* The goal of this lab is for you to build a simple containerized application image and deploy it to Cloud Run.

###### Objectives

* In this lab, you learn to:

1. Enable the Cloud Run API.
2. Create a simple Node.js application that can be deployed as a serverless, stateless container.
3. Containerize your application and upload to Container Registry (now called "Artifact Registry.")
4. Deploy a containerized application on Cloud Run.
5. Delete unneeded images to avoid incurring extra storage charges.


### Task 1. Enable the Cloud Run API and configure your Shell environment

1. From Cloud Shell, enable the Cloud Run API :
   
     * gcloud services enable run.googleapis.com
     * gcloud services enable artifactregistry.googleapis.com
     * gcloud services enable cloudbuild.googleapis.com

2. Set the compute region:

     *  gcloud config set compute/region "us-east4"

3. Create a LOCATION environment variable:
   
     * export LOCATION="us-east4"



### Task 2. Write the sample application

1. In this task, you will build a simple express-based NodeJS application which responds to HTTP requests.In Cloud Shell create a new directory named helloworld, then move your view into that directory:
   
     * mkdir helloworld && cd helloworld

2. Next you'll be creating and editing files. To edit files, use vi, emac, nano or the Cloud Shell Code Editor by clicking on the Open Editor button in Cloud Shell.Create a package.json file, then add the following content to it:

     * nano package.json

3. Most importantly, the file above contains a start script command and a dependency on the Express web application framework.Press CTRL+X, then Y to save the package.json file.
   
4. Next, in the same directory, create a index.js file, and copy the following lines into it:

       * nano index.js

5. This code creates a basic web server that listens on the port defined by the PORT environment variable. Your app is now finished and ready to be containerized and uploaded to Container Registry.Press CTRL+X, then Y to save the index.js file.


### Task 3. Containerize your app and upload it to Artifact Registry

1. To containerize the sample app, create a new file named Dockerfile in the same directory as the source files, and add the following content:
   
     * nano Dockerfile


2. Now, build your container image using Cloud Build by running the following command from the directory containing the Dockerfile. (Note the $GOOGLE_CLOUD_PROJECT environmental variable in the command, which contains your lab's Project ID)
   
      * gcloud builds submit --tag gcr.io/$GOOGLE_CLOUD_PROJECT/helloworld

3. Cloud Build is a service that executes your builds on GCP. It executes a series of build steps, where each build step is run in a Docker container to produce your application container (or other artifacts) and push it to Cloud Registry, all in one command.
   
4. Once pushed to the registry, you will see a SUCCESS message containing the image name (gcr.io/[PROJECT-ID]/helloworld). The image is stored in Artifact Registry and can be re-used if desired.
   
5. List all the container images associated with your current project using this command:

      * gcloud container images list

6. To run and test the application locally from Cloud Shell, start it using this standard docker command:

      * docker run -d -p 8080:8080 gcr.io/$GOOGLE_CLOUD_PROJECT/helloworld

7. In the Cloud Shell window, click on Web preview and select Preview on port 8080.This should open a browser window showing the "Hello World!" message. You could also simply use curl localhost:8080.


### Task 4. Deploy to Cloud Run

1. Deploying your containerized application to Cloud Run is done using the following command adding your Project-ID:

      * gcloud run deploy --image gcr.io/$GOOGLE_CLOUD_PROJECT/helloworld --allow-unauthenticated --region=$LOCATION

2. The allow-unauthenticated flag in the command above makes your service publicly accessible.When prompted confirm the service name by pressing Enter.Wait a few moments until the deployment is complete.

3. On success, the command line displays the service URL:Service [helloworld] revision [helloworld-00001-xit] has been deployed and is serving 100 percent of traffic.

4. Service URL: https://helloworld-h6cp412q3a-uc.a.run.app
   
5. You can now visit your deployed container by opening the service URL in any browser window.


### Task 5. Clean up

1. While Cloud Run does not charge when the service is not in use, you might still be charged for storing the built container image.
   
2. You can either decide to delete your GCP project to avoid incurring charges, which will stop billing for all the resources used within that project, or simply delete your helloworld image using this command :

      * gcloud container images delete gcr.io/$GOOGLE_CLOUD_PROJECT/helloworld

3. When prompted to continue type Y, and press Enter.To delete the Cloud Run service, use this command :

      * gcloud run services delete helloworld --region="REGION"

4. When prompted to continue type Y, and press Enter.

5. To delete the Cloud Run service, use this command :

      * gcloud run services delete helloworld --region="REGION"

6. When prompted to continue type Y, and press Enter.


------------------------------------------------------------------------------------------------------------------
  <div class="footer">
              copyright © 2022—2023 Cloud & AI Analytics. 
                                      All rights reserved
          </div>


