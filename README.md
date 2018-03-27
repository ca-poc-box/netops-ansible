# netops-ansible
Ansible deployment automation for NetOps products (CAPM, ADA, NFA, SOI, Spectrum, UIM and VNA)
Latest doc:
https://cawiki.ca.com/display/eastpresales/POC+Appliance+Details 


Deployment setup:
Ansible server reqs: CentOS 7.4, 1 vcpu and 4 GB RAM and 30 GB Storage
Install Ansible:
<br><br>
yum -y install ansible
<br>
Clone the Ansible script from GitHub:
<br><br>
git clone https://github.com/ca-poc-box/netops-ansible.git
<br>

Update the poc-linux-inventory.yml and poc-windows-inventory.yml files with appropriate host names under each role
Update the /etc/hosts file on the ansible server

Configure target VMs for Ansible:
Windows Servers: 
Need to setup to allow Basic Auth. Run the following from powershell:
<br><br>
winrm set winrm/config/client/auth @{Basic="true"} 
winrm set winrm/config/service/auth @{Basic="true"} 
winrm set winrm/config/service @{AllowUnencrypted="true"}
<br>
Run the ConfigureRemotingforAnsible.ps1 file in powershell on each window server.

Linux Servers: 
Setup SSH on Ansible server by running: 
<br><br>
ssh-keygen 
<br>
Establish ability for passwordless ssh connection to Linux servers from Ansible by running:
<br><br>
ssh-copy-id root@<servername>
<br>

Run basic Ansible functionality tests by running this from the Ansible shell:
<br><br>
ansible -i poc-windows-inventory windows -m win_ping
ansible -i poc-linux-inventory linux -m ping
<br>

Copy latest installers to the Ansible VM by running script to pull from FTP site (This file is not kept on GitHub):
https://cawiki.ca.com/display/eastpresales/Download+product+Installers 
<br><br>
./download-installers.sh

Run Ansible setup scrips by running the 
<br><br>
./deploy_netops.sh
<br>
*This will deploy NetOps to the hosts in your inventory files.*
