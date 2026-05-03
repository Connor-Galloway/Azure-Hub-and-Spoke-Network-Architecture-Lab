# Azure-Hub-and-Spoke-Network-Architecture-Lab

**Overview**

This lab simulates a real-world enterprise Azure environment where network segmentation, centralized security enforcement, and identity services are core requirements. All inter-spoke traffic is routed through a central Azure Firewall, ensuring no workload can communicate directly with another without inspection. I have linked a photo of the full Resource Group for this lab [here.](images/FullRG.png)

**Technologies Used**

- Azure Virtual Networks | Network segmentation and peering
  
- Azure Firewall (Standard) | Centralized traffic inspection
  
- Azure Bastion | Secure RDP/SSH, no public IPs on VMs
  
- User Defined Routes | Force traffic through firewall as next hop
  
- Log Analytics Workspace | Firewall traffic logging
  
- Network Watcher | Routing diagnostics and verification
  
- Active Directory Domain Services | Identity and domain management
  
- Windows Server 2025 Data Center | Domain Controller for Lab
  
- Windows 11 Pro | Domain-joined Win11 client



**Documentation**

Detailed documentation for each component is available in the subdirectories: 

- Firewall

- Routing

- Diagram

- Networking

- Virtual Machines

**Terraform Automation**

- This project also showcases a full working automated deployment pipeline using Terraform, VS Code, and GitHub actions

- Each type of resource is split up into different .tf files for easy viewing access

- An Azure Key Vault is added to house the admin login for both virtual machines

**Goals**

- Design and deploy a hub-and-spoke network topology following proper best practices

- Implement centralized traffic inspection across VNet boundaries using Azure Firewall as the single point of enforcement

- Demonstrate forced routing via UDR's, ensuring no inter-spoke traffic bypasses the firewall

- Deploy and configure a small Active Directory Domain Services environment to demonstrate successful connection across segmented VNets

- Validate network routing decisions using Azure Network Watcher and confirm firewall enforcement through Log Analytics

**Terraform Automation**

- This project also showcases 


  
