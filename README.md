# CECS_574_Cloud_IaC_K8s
# CSGEEKS

# Eccommerce Web Application Deployment Guide

This guide provides an overview of how to deploy the frontend and backend components of our project, manage infrastructure with Terraform, automate deployment with Jenkins, and configure Kubernetes resources with Helm.

## Frontend

The frontend directory contains all the source code for the user interface of the application. It includes HTML, CSS, JavaScript files, and other assets required for the frontend.
1. Change the baseURL from `App.Vue` file to lacate your Backend Application URL
2. Create `process.env` file and add your Stripe Public key (For Stripe public key and secret key you need to create account on stripe follow the process)
`VUE_APP_STRIPETOKEN="your_stripe_pk"`
3. Navigate to the frontend directory.
4. Install the dependencies using `npm install`.
5. Start the development server using `npm run serve`.


## Backend
The backend directory includes the application's server-side logic, database management, and API services.
This is a Maven Project. Ensure, Maven is installed on your system.
1. Change the Application Properties (E.g. username/password of DB) present in `resources/application.properties` according to your local mysql-server also set your Stripe keys.
2. Go to `application.properties` and add front-end url and enter the STRIPE API Keys.
3. Set your Stripe Secret key in OrderService.java in service folder.

## Terraform

The Terraform directory contains IaC (Infrastructure as Code) scripts that define the cloud resources required for the project.

### Usage Instructions

1. Navigate to the Terraform directory.
2. Fill in the required variables in `values.tfvars` with your specific cloud resource values.
3. Initialize Terraform using `terraform init`.
4. Apply the configuration using `terraform apply -var-file="values.tfvars"`.

## Jenkins

The Jenkinsfile contains the definitions for the CI/CD pipeline stages.

1. Set up a Jenkins pipeline pointing to your repository.
2. Replace all instances of `${VARIABLE_NAME}` in the Jenkinsfile with your specific values (e.g., AWS credentials, repository URLs).

## Helm

The Helm directory provides the necessary charts to deploy the applications on Kubernetes.

### Deployment Instructions

1. Navigate to the Helm directory.
2. Adjust `values.yaml` as needed to configure the application pods, LoadBalancer, deployment sets, etc.
3. Deploy to your Kubernetes cluster using `helm install` or `helm upgrade`.

## Manual Steps

### Adding ELB URLs to Route53 Records

After deploying the application, you need to manually update the Route53 DNS records with the ELB URLs.

1. Retrieve the ELB URLs from the AWS Management Console.
2. Navigate to the Route53 service in the AWS Console.
3. Select your hosted zone and add a new record set.
4. Input the ELB URL as the alias for the A or CNAME record.

## Conclusion

This README provides the necessary steps to set up, configure, and deploy both the frontend and backend parts of the application, manage infrastructure with Terraform, automate deployments with Jenkins, and configure Kubernetes resources with Helm. Please ensure to replace placeholder values with your specific configuration details.
