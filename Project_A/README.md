Basically this Project_A is having a modular approach here i have created the Ansible Folder which represents the shell script to execute of Installation of ansible and running the playbook.yml there is again one file present that is playbook.yml in that i have installed the nginx server with different modules involved here with changing the content of the file also using the restart module.
There is another folder which represents the EC2 instance and in that i have used data source for an ami with recent Amazon image that is of ubuntu then i have created the resource given the path of the pem file here i have used the provisioner block here to copy the file from my local to local host and to run the shell script and given the particular permission to execute it. Here i have also created the ami of that particular instance so we can use it or refer that image in different project as well if we need all you know is that the output.tf and the var.tf files is been used to pass the variables to the next file as well
coming to security group here i have created the SG Group to represent the inbound or outbound we can say ingress and outgress to open the particular port for it. as it was for demo purpose its not a good practice to open the port for all.
comming to th VPC all the necessary resource having been created and passed the variables as per use
Here i have using the modular approach for the same for the EC@, SG_groups and VPC as well then here i have created main.tf with the modular apprach i have been mention the source for that particular resource and passed the variables as per our understanding
Before creating the resources mannually you should be aware about the console or we can say manual approach ten only we can go with this approach.
Task: Write a terraform code comprising of two modules; one for VPC and the other for EC2. The module must contain code to configure the respective resources along with all of their sub components i.e. subnet, security group, route table, etc. The terraform should also run a bash script on the configured EC2 instance that will install ansible on the machine. Subsequently, run an ansible playbook on the instance which will install configure nginx with custom webpage (An HTML page with a simple HelloWorld would be sufficient) on localhost.