# Java Application - Jenkins -  Deployment 

This contains Java login page application with a pom.xml file for maven build. 

It also displays how a simple Java application could be maintained using CI/CD on Jenkins and of course Kubernetes for application management and hosting on AWS. 

 ![jenkins Deploy-1](https://github.com/segunjkf/Terraform-Kubernetes-Ansible-Docker/blob/main/ci-cd.jpg)

 ### Continuous Delivery
 * The CD pipeline is already defined and prod/test enviroment deployed.
  * Deployed with no expected downtime in production.

  ## Infrastructure Management

  You will need to have access to the following from your own end:

  * Jenkins server
  * Kubernetes Cluster

  > **Note:** Be aware that the installation of some plugins may cause a misconfiguration of the Jenkins server and your work will be lost.


### Terraform infrastructure configuration  
* you have to install terraform plugin for jenkins (terraform)
* you have to set your AWS Credentials on jenkins with the jenkins plugin (Credentials binding)   

### Using Docker Builder
  * Docker is already integrated with Jenkins, in a job you could use this
  command to build an image

```
 docker build -t <your-name>:some-tag .
```

  * You will need to push data to a remote docker registry. 

### Deploying to Kubernetes

In this section you will need to know.

  * How to deploy to kubernetes.
  * The kube config file.
  * try to create a secret file in jenkins with your configuration file

> **Note:** Make sure you have the different branches on your host application repository


#### How to deploy to Kubernetes.

> **Note:** Make sure to use kubeconfig with the value set up in the
> Jenkins Credentials Section.

  * Update the version of the image in the kubernetes cluster, e.g.:
    - `kubectl --kubeconfig=${KUBECONFIG} --namespace=<ENVIRONMENT>
    set image deployment/api api=name/api:tag`

> **Note:** This only works from jenkins.

## Hire me
Looking for an engineer to build and automate your next application infrastruture/architecture to work remotely? Get in touch: sege.timz12@gmail.com

## How can I thank you?
Why not star the Github repo? I'd love the attention! Why not share the link for this repository on Twitter,Hackernews or Destructoid ? Spread the word!

Don't forget to follow me on [twitter](https://twitter.com/kaytheog). Also, you could see other things I do in the software enviroment via my [website](https://github.com/segunjkf)
