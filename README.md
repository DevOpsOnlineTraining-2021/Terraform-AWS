# Terraform-AWS Tomcat

*Step-0*: Install terraform and AWS CLI

      terraform: https://github.com/DevOpsPlatform/Phase-7/blob/master/Terraform/1.Installation_and_example.md
      
      AWS CLI: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
      
      Setup the AWS creds as suggested in https://github.com/DevOpsPlatform/Phase-7/blob/master/Terraform/1.Installation_and_example.md

*Step-1*: Clone this branch to your local machine

      git clone -b tomcat https://github.com/DevOpsOnlineTraining-2021/Terraform-AWS.git

*Step-2*: Reolace *.pem file to templates/YourKeyFile.pem with your pem file.

*Step-3*: Update key file name(variable name `tomcat_key_name`) in https://github.com/DevOpsOnlineTraining-2021/Terraform-AWS/blob/master/variables.tf

*Step-4*: Tested this script (`templates/tomcat_startup.sh`) on RHEL8 server. Update the AMI details(variable name `amis`) in https://github.com/DevOpsOnlineTraining-2021/Terraform-AWS/blob/master/variables.tf

*Step-5*: Run the below commands

    terraform validate
    
        Success! The configuration is valid.


