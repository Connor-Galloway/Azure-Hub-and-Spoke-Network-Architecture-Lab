# Virtual Machines

## Overview
Two virtual machines are deployed across the spoke VNets. DC01 serves as the Active Directory Domain Controller and DNS server in vnet-spoke1. WIN11-CLIENT01 is a domain-joined client workstation in vnet-spoke2. Neither VM has a public IP address — all access is handled exclusively through Azure Bastion.


## DC01

DC01 is a Windows Server 2025 Datacenter VM deployed in vnet-spoke1 at private IP 10.1.1.4. It runs Active Directory Domain Services and acts as the DNS server for the entire lab environment.

![DC01 Overview](images/Virtual%20Machines/dc01_overview.png)

**Network Settings**

DC01's NIC is configured with a static private IP of 10.1.1.4. DNS is set to 127.0.0.1 (loopback) which is expected and correct behavior for a Domain Controller — it resolves DNS queries locally since it is the DNS server.

![DC01 NIC IP Config](images/Virtual%20Machines/dc01_nic_ipconfig.png)

![DC01 Network Settings](images/Virtual%20Machines/dc01_network_settings.png)

**Bastion Access**

DC01 is accessed securely through Azure Bastion with no public IP assigned.

![DC01 Bastion Login](images/Virtual%20Machines/dc01_bastion_login.png)

**Active Directory**

Active Directory Users and Computers (ADUC) is installed and running on DC01, confirming the domain controller role is fully operational.

![DC01 ADUC](images/Virtual%20Machines/dc01_aduc.png)

![DC01 IPConfig](images/Virtual%20Machines/dc01_ipconfig.png)


## WIN11-CLIENT01

WIN11-CLIENT01 is a Windows 11 Pro VM deployed in vnet-spoke2. It is successfully domain-joined to the Active Directory domain hosted on DC01, confirming end-to-end connectivity through the Azure Firewall across VNet boundaries.

![WIN11 Overview](images/Virtual%20Machines/win11_overview.png)

**Network Settings**

WIN11-CLIENT01's NIC inherits DNS from vnet-spoke2, which is configured with a custom DNS server pointing to DC01 at 10.1.1.4.

![WIN11 NIC IP Config](images/Virtual%20Machines/win11_nic_ipconfig.png)

**Bastion Access**

WIN11-CLIENT01 is accessed securely through Azure Bastion with no public IP assigned.

![WIN11 Bastion Login](images/Virtual%20Machines/win11_bastion_login.png)

**Connectivity Verification**

nslookup and ipconfig confirm that WIN11-CLIENT01 is resolving DNS via DC01 and is successfully joined to the domain. This validates the full traffic path from WIN11-CLIENT01 through the Azure Firewall to DC01.

![WIN11 NSlookup and IPConfig](images/Virtual%20Machines/win11_nslookup_ipconfig.png)

**Admin Login**

![Admin Logged In](images/Virtual%20Machines/show_admin_logged_in.png)
