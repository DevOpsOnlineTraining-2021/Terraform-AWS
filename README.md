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

*Step-5*: Run command: `terraform validate`
    
        Success! The configuration is valid.


*Step-6*: `terraform plan` (this command gives lengthy output, so pasting here only the few lines from end of the output)

    
      Plan: 2 to add, 0 to change, 0 to destroy.

      Changes to Outputs:
        + jenkins_master_private_ip = (known after apply)
        + jenkins_master_public_ip  = (known after apply)
    
*Step-7*: `terraform apply` (User have to access this change, enter a value: yes )


      Do you want to perform these actions?
        Terraform will perform the actions described above.
        Only 'yes' will be accepted to approve.

        Enter a value: yes

     ---------------------
     
      aws_security_group.security_group_tomcat: Creating...
      aws_security_group.security_group_tomcat: Creation complete after 9s [id=sg-024af18b7739bb660]
      aws_instance.tomcat: Creating...
      aws_instance.tomcat: Still creating... [10s elapsed]
      aws_instance.tomcat: Still creating... [20s elapsed]
      aws_instance.tomcat: Still creating... [30s elapsed]
      
![image](https://user-images.githubusercontent.com/24622526/120889159-76876980-c619-11eb-9084-554934e36ed9.png)

      aws_instance.tomcat: Provisioning with 'file'...
      aws_instance.tomcat: Still creating... [40s elapsed]
      aws_instance.tomcat: Still creating... [50s elapsed]
      aws_instance.tomcat: Still creating... [1m0s elapsed]
      aws_instance.tomcat: Still creating... [1m10s elapsed]
      aws_instance.tomcat: Still creating... [1m20s elapsed]
      aws_instance.tomcat: Still creating... [1m30s elapsed]
      aws_instance.tomcat: Still creating... [1m40s elapsed]
      aws_instance.tomcat: Provisioning with 'file'...
      aws_instance.tomcat: Provisioning with 'file'...
      aws_instance.tomcat: Still creating... [1m50s elapsed]
      aws_instance.tomcat: Provisioning with 'remote-exec'...
      aws_instance.tomcat (remote-exec): Connecting to remote host via SSH...


      installation of the tools 
      
      aws_instance.tomcat: Creation complete after 4m0s [id=i-083bdc91b81535219]

      Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

      Outputs:

      jenkins_master_private_ip = "172.31.81.80"
      jenkins_master_public_ip = "54.211.221.199"
      
      
