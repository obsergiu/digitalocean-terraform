### About
NDC - New Data Centre server. 

### Requirements 
- Make sure `terraform` from [hashicorp](https://www.terraform.io/downloads.html) is installed into your system
- Get API token from DigitalOcean 


### Run the project
- Instantiate terraform (After pulling the project on your local and in terminal you've `cd` inside the project)  

	* `` terraform init ``


- Change the project settings, which will be automatically loaded, inside the:  

	* ``settings.auto.tfvars``


- Check project by creating an execution plan (this will not do anything)  

	* `` terraform plan ``


- If you wish to check the output before creating the droplet you can run:  

	* `` terraform refresh``
		

- Main function, create the droplet:   

	* `` terraform apply ``
		
		

- To recreate a droplet you need first to destroy it:

	* `` terraform destroy``

		


##### Additional Info
- The upper commands `apply` and `destroy` will need your approval that can be bypassed:  
	* ``terraform apply -auto-approve``  
	* ``terraform destroy -auto-approve