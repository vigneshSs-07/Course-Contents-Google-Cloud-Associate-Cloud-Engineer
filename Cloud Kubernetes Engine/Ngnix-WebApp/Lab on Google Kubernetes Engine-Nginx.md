>>> **PROFESSIONAL DATA ENGINEER** - *Google Cloud Platform*
------------------------

> TITLE: "Introduction to Google Cloud - Google Kubernetes Engine"
> 
> Author:
  >- Name: "Vignesh Sekar S"
  >- Designation: "Multi Cloud Architect"
  >- Tags: [Google Cloud, DataEngineer, Python, PySpark, SQL, BigData]

-------------------------------------------------------------------------------------------------------------------

# Lab on Google Cloud -  Kubernetes Engine (CLI)

1. Google Kubernetes Engine (GKE) provides a managed environment for deploying, managing, and scaling your containerized applications using Google infrastructure.
   
2. The Kubernetes Engine environment consists of multiple machines (specifically Compute Engine instances) grouped to form a container cluster.

### Cluster orchestration with Google Kubernetes Engine

* Google Kubernetes Engine (GKE) clusters are powered by the Kubernetes -- an open source cluster management system.
  
* Kubernetes provides the mechanisms through which you interact with your container cluster.You use Kubernetes commands and resources to deploy and manage your applications, perform administrative tasks, set policies, and monitor the health of your deployed workloads.
  
* Kubernetes draws on the same design principles that run popular Google services and provides the same benefits:
    a. automatic management 
    b. monitoring and liveness probes for application containers 
    c. automatic scaling 
    d. rolling updates and more.

* A GKE cluster consists of at least one cluster master machine and multiple worker machines called nodes. a. Nodes are Compute Engine virtual machine (VM) instances that run the Kubernetes processes necessary to make them part of the cluster.
  
* GKE uses Kubernetes objects to create and manage your cluster's resources. Kubernetes provides the Deployment object for deploying stateless applications like web servers.
  
* Service objects define rules and load balancing for accessing your application from the internet.
Kubernetes on Google Cloud

* When you run a GKE cluster, you also gain the benefit of advanced cluster management features that Google Cloud provides. These include:

    * Load balancing for Compute Engine instances
    * Node pools to designate subsets of nodes within a cluster for additional flexibility
    * Automatic scaling of your cluster's node instance count
    * Automatic upgrades for your cluster's node software
    * Node auto-repair to maintain node health and availability
    * Logging and Monitoring with Cloud Monitoring for visibility into your cluster

* Enable the below API's

      * Kubernetes Engine API
      
      * Container Registry API

### Task 1. Set a default compute zone

* Set the default compute region 
  
      * gcloud config set compute/region us-east4
  
* Set the default compute zone 
  
      * export ZONE=$(gcloud config set compute/zone us-east4-a) 
  
      * export ZONE=$(gcloud config get-value compute/zone)


### Task 2. Create a GKE cluster

* Cluster names must start with a letter and end with an alphanumeric, and cannot be longer than 40 characters.
  
      * gcloud container clusters create demo-cluster --machine-type=e2-medium --zone=$ZONE  --num-nodes 2

* After the cluster is created, check your installed version of Kubernetes using the kubectl version command:
  
      * kubectl version

* The gcloud container clusters create command automatically authenticated kubectl for you.


### Task 3. Get authentication credentials for the cluster

*  Authenticate with the cluster 

      *  gcloud container clusters get-credentials demo-cluster


### Task 4. Deploy an application to the cluster

* From your Cloud Shell prompt, launch a single instance of the nginx container. (Nginx is a popular web server.)             
  
      *  kubectl create deploy nginx --image=nginx:1.17.10

* In Kubernetes, all containers run in pods. This use of the kubectl create command caused Kubernetes to create a deployment consisting of a single pod containing the nginx container. 
  
* A Kubernetes deployment keeps a given number of pods up and running even in the event of failures among the nodes on which they run. In this command, you launched the default number of pods, which is 1.

* View the pod running the nginx container:
  
      *  kubectl get pods

* Expose the nginx container to the Internet:

      *  kubectl expose deployment nginx --port 80 --type LoadBalancer

* Kubernetes created a service and an external load balancer with a public IP address attached to it. The IP address remains the same for the life of the service.
   
* Any network traffic to that public IP address is routed to pods behind the service: in this case, the nginx pod.

* View the new service:

      *  kubectl get services

* You can use the displayed external IP address to test and contact the nginx container remotely.
  
* It may take a few seconds before the External-IP field is populated for your service. This is normal. Just re-run the kubectl get services command every few seconds until the field is populated.
  
* Open a new web browser tab and paste your cluster's external IP address into the address bar. The default home page of the Nginx browser is displayed.
  
* Scale up the number of pods running on your service:

      *  kubectl scale deployment nginx --replicas 3

* Scaling up a deployment is useful when you want to increase available resources for an application that is becoming more popular.
  
* Confirm that Kubernetes has updated the number of pods:

      *  kubectl get pods

* Confirm that your external IP address has not changed:

      *  kubectl get services

* Return to the web browser tab in which you viewed your cluster's external IP address. Refresh the page to confirm that the nginx web server is still responding.


### Task 5. Deleting the cluster

* To delete the cluster, run the following command:
  
    * gcloud container clusters delete demo-cluster
  
* When prompted, type Y to confirm. 
  
    * Deleting the cluster can take a few minutes.


-------------------------------------------------------------------------------------------------------------------

  <div class="footer">
              copyright © 2022—2023 Cloud & AI Analytics. 
                                      All rights reserved
          </div>