# Firewall

**Overview**

Azure Firewall is deployed in the hub VNet as the central security enforcement point for all inter-spoke traffic. It operates as a managed, cloud-based network security service that monitors and controls traffic flowing between vnet-spoke1 and vnet-spoke2.

**How It Works**

Azure Firewall sits in its own dedicated subnet (AzureFirewallSubnetL 10.0.2.0/26) inside the hub VNet. When a packet leaves WIN11-CLIENT01 destined for DC01, the User Defined Route on subnet-spoke2 intercepts it and forwards it to the firewall's private IP (10.0.2.4) instead of routing it directly. The firewwall then evaluates the packet against its rule collections. If a matching allow rule exists, the traffic is forwarded, if not, it is dropped by default. This default-deny behavior means no inter-spoke communication is permitted unless explicitly allowed. 
