# Create an instance 

Change the type of the instance in the main.tf file to the desired one at the line 98.

Change the location in the vairables.tf file to the desired one at the line 3.

Then launch the creating script:

```bash
./create.sh
```

Be sure to add the execution rights to the script:

```bash
chmod +x create.sh
```

# Connect to the instance

```bash
ssh -i key.pem azureadmin@$(terraform output -raw public_ip_address)
```

# Executing tests

Create a file named "test.sh" in your instance and copy paste the script of the test.sh file

It will show you the total time for each tests.