>>> **ASSOCIATE CLOUD ENGINEER** - *Google Cloud Platform*
------------------------

> TITLE: "Introduction to Google Cloud - Cloud Shell & Editor"
> 
> Author:
  >- Name: "Vignesh Sekar S"
  >- Designation: "Multi Cloud Architect"
  >- Tags: [Google Cloud, DataEngineer, Python, PySpark, SQL, BigData]


# Cloud Shell:

1. Cloud Shell provides the command-line access to computing resources hosted on Google Cloud.  The gcloud command-line tool and other utilities you need are pre-installed in Cloud Shell, which allows you to get up and running quickly.
2. Cloud Shell is a free Debian-based virtual machine that includes the latest Cloud SDK, including the gcloud command-line interface, popular runtimes, and git, all which allow you to start working quickly.
   * To open your .bashrc file for edit in the Cloud Shell Editor, from the Cloud Shell command line, run:
      - cloudshell edit $HOME/.bashrc
   * Similarly, to download your .bashrc file, run:
      - cloudshell download $HOME/.bashrc
  
### Cloud shell provides the following:

1. Temporary Compute Engine VM
2. Command-line access to the instance via a browser
3. 5 GB of persistent disk storage ($HOME dir)
4. Pre-installed Cloud SDK and other tools
5. gcloud: for working with Google Compute Engine and many GCP services
6. gsutil: for working with Cloud Storage
7. kubectl: for working with Google Container Engine and Kubernetes
8. bq: for working with BigQuery
9. Language support for Java, Go, Python, Node.js, PHP, and Ruby
10. Web preview functionality
11. Built-in authorization for access to resources and instances

###### Common Set Ups:

* Authorizes access and performs other common setup steps.
    * gcloud init
* User Authorizes access only
    * gcloud auth login


### Task 1. Configure your environment

A region is a specific geographical location where you can run your resources. Each region has one or more zones.For example, the us-central1 region denotes a region in the Central United States that has zones us-central1-a, us-central1-b, us-central1-c, and us-central1-f.Resources that live in a zone are referred to as zonal resources. Virtual machine instances and persistent disks live in a zone. 

1. Set the region to us-central1
    a. gcloud config set compute/region us-central1
2. To view the project region setting, run the following command
    b. gcloud config get-value compute/region
3. Set the zone to us-central1-a
    c. gcloud config set compute/zone us-central1-a
4. To view the project zone setting, run the following command
    d. gcloud config get-value compute/zone
5. In Cloud Shell, run the following gcloud command to view details about the project:
    e. gcloud compute project-info describe --project $(gcloud config get-value project)


###### The commands execute the following (in order top to bottom):

1. Authenticate and authorize the user
    a. gcloud auth login
2. Set the project for which the commands are executed - Setting properties
    b. gcloud config set project <project-id>
3. Set the project for which the commands are executed - Unsetting properties
    b. gcloud config unset project <project-id>
4. Disable any gcloud command prompts and use the default
    c. gcloud config set disable_prompts true
5. Enable the Cloud Spanner APIs
    d. gcloud services enable spanner.googleapis.com
6. To view persistent disk consumption
    e. lslbk
7. Memory consumption
    f. free —giga
8. Cpu configuration
    g. lscpu
9. To list the properties in the active configuration
    h. gcloud config list


###### Finding project information

* In Cloud Shell, run the following gcloud command, to view the project id for your project
    - gcloud config get-value project
* gcloud config configurations list
* gcloud config configurations create [NAME] — create a configuration 
* gcloud config configurations activate my-default-configuration
* gcloud auth list —configuration=[my-default-configuration] 
* gcloud config configurations list
* gcloud config configurations describe my-default-configuration	
* To list the properties in the active configuration
    - gcloud config list 


###### Setting environment variables

1. Create an environment variable to store your Project ID
    a. export PROJECT_ID=$(gcloud config get-value project)
2. Create an environment variable to store your Zone
    b. export ZONE=$(gcloud config get-value compute/zone)
3. To verify that your variables were set properly, run the following commands
    c. echo -e "PROJECT ID: $PROJECT_ID\nZONE: $ZONE"


##### Explore gcloud commands
1. The gcloud tool offers simple usage guidelines that are available by adding the -h flag (for help) onto the end of any gcloud command.
    a. gcloud -h   
    b. gcloud config --help (To exit type Q and hit Enter.)
    c. gcloud help config 
    
    NOTE: The results of the gcloud config --help and gcloud help config commands are equivalent. Both return long, detailed help.
* To view the gcloud compute instance create manual, run:
    - gcloud compute instances create --help   
                    (or)
    - gcloud compute instances create -h

1. View the list of configurations in your environment
    b. gcloud config list
2. To see all properties and their settings
    c. gcloud config list --all
3. List your components
    d. gcloud components list
4. View the available logs on the system
    e. gcloud logging logs list


### Task 2. Use Cloud Shell for testing

The contents of your Cloud Shell Home directory persist across Google Cloud Projects between all Cloud Shell sessions, even after the Cloud Shell virtual machine terminates and is restarted. You can use the built-in Git to clone your code and familiar tools to edit it. You can even run any web application that listens to HTTP requests and view them via the Web Preview.

1. Clone a sample app to Cloud Shell
    a. gsutil cp gs://cloud-training/Migrating2gcp/index.js .
2. Run the sample application in your Cloud Shell environment
    b. cat index.js
    c. node index.js
3. To view your running application, click Web Preview (Web Preview icon).
   - A 'Hello from your Cloud Shell!' message should appear in a new window.
4. View the available logs on the system:
    a. gcloud logging logs list
5. View the logs that relate to compute resources:
    a. gcloud logging logs list --filter="compute"
6. Read the logs related to the resource type of gce_instance:
    a. gcloud logging read "resource.type=gce_instance" --limit 5


------------------------------------------------------------------------------------------------------------------

  <div class="footer">
              copyright © 2022—2023 Cloud & AI Analytics. 
                                      All rights reserved
          </div>



