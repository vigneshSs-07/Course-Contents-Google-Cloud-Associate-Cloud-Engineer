>>> **ASSOCIATE CLOUD ENGINEER** - *Google Cloud Platform*
------------------------

> TITLE: "Lab on Creating a Persistent Disk"
> 
> Author:
  >- Name: "Vignesh Sekar"
  >- Designation: "Multi Cloud Architect"
  >- Tags: [Google Cloud, DataEngineer, Python, PySpark, SQL, BigData]

# Overview

* Compute Engine lets you create and run virtual machines on Google infrastructure. 
* You can create virtual machines running different operating systems, including multiple flavors of Linux (Debian, Ubuntu, Suse, Red Hat, CoreOS) and Windows Server!
* Compute Engine provides persistent disks for use as the primary storage for your virtual machine instances. 
* Like physical hard drives, persistent disks exist independently of the rest of your machine – if a virtual machine instance is deleted, the attached persistent disk continues to retain its data and can be attached to another instance.
* There are 2 types of persistent disks:
    * Standard persistent disk
    * SSD Persistent disk

###### Local SSDs

* Compute Engine can also attach local SSDs. Local SSDs are physically attached to the server hosting the virtual machine instance to which they are mounted. 
* This tight coupling offers superior performance, with very high input/output operations per second (IOPS) and very low latency compared to persistent disks.
* Local SSD performance offers:
    * Less than 1 ms of latency
    * Up to 680,000 read IOPs and 360,000 write IOPs
    * These performance gains require certain trade-offs in availability, durability, and flexibility. Because of these trade-offs, local SSD storage is not automatically replicated and all data can be lost in the event of a host error or a user configuration error that makes the disk unreachable. 
      * Users must take extra precautions to backup their data.



### Task 1. Create a new instance


* gcloud compute disks create demo-disk-001 --project=feisty-port-390303 --type=pd-ssd --description=This\ disk\ is\ used\ in\ Cloud\ \&\ AI\ Analytics\ project. --size=100GB --labels=team=caa --region=us-central1 --replica-zones=projects/feisty-port-390303/zones/us-central1-a,projects/feisty-port-390303/zones/us-central1-f


* gcloud compute resource-policies create snapshot-schedule default-schedule-1 --project=feisty-port-390303 --region=us-central1 --max-retention-days=14 --on-source-disk-delete=keep-auto-snapshots --daily-schedule --start-time=10:00


* gcloud compute disks add-resource-policies demo-disk-001 --project=feisty-port-390303 --region=us-central1 --policies=projects/feisty-port-390303/regions/us-central1/resourcePolicies/default-schedule-1

------------------------------------------------------------------------------------------------------------------
  <div class="footer">
              copyright © 2022—2023 Cloud & AI Analytics. 
                                      All rights reserved
          </div>