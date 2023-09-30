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
