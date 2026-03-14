# Azure-Hub-and-Spoke-Network-Architecture-Lab

**Overview**

This lab simulates a real-world enterprise Azure environment where network segmentation, centralized security enforcement, and identity services are core requirements. All inter-spoke traffic is routed through a central Azure Firewall, ensuring no workload can communicate directly with another without inspection.

**Technologies Used**

- Azure Virtual Networks | Network segmentation and peering
  
- Azure Firewall (Standard) | Centralized traffic inspection
  
- Azure Bastion | Secure RDP/SSH, no public IP's on VM's
  
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

  
