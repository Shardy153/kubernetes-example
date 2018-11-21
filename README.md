# Kubernetes environment exmaple
---
Implementation of Kubernetes deployment of a Simple Hello World HTTP server to DEV, TEST and STAGING environments.
## Prerequisites
---
  - Make sure you have Kubernetes installed of atleast 2 nodes.
  - Make sure you have GIT installed.

## Installation
---
 - On kubernetes master, Checkout this example using following command
    ```
    git https://github.com/k2io/kubernetes-environment.git
    cd kubernetes-environment
    ```
 ## Run
 ---
 - This command will create all the required resources.
    ```
    sh utility.sh -c
    ```
 - This command will delete all the created resources by build shell script.

    ```
    sh utility.sh -d
    ```

## References
---
- https://blog.ubuntu.com/2017/10/06/kubernetes-on-ubuntu-vms

## Few Important Notes
---
- This examples contains 3 YAML files, one YAML for each environment i.e. dev, test and staging.
- After running build shell script, following resources will be created:
    - 3 namespaces named as dev, test and staging.
    - A deployment in each namespace, which consists of 2 pods and each pod hosts a simple Hello World HTTP server.
    - A service in each namespace to make the pods accessible.
- The Hello World HTTP server runs on port 80 inside the container and can be accessed on following port in each environment:
    - Dev: 30001
    - Test: 30002
    - Staging: 30003
