#!/bin/bash

GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}
################################################################################################################
#                              Your MarketPlace App has been deployed successfully!                            #
#                                 Passwords are stored under /root/                                            #
################################################################################################################
${NC}"

echo
echo -e "${GREEN}This message will be removed in the next login!${NC}"
echo
echo -e "${GREEN}You can find the Harbor configuration file at '/opt/harbor/harbor.yml'.${NC}"
echo
echo -e "${GREEN}The Harbor UI dashboard can be accessed using the domain name or IP address.${NC}"
echo
echo -e "${GREEN}Allow ports 80 and 443 in the security group to access the Harbor UI.${NC}"
echo

# Function to generate a random password
generate_password() {
    tr -dc 'A-Za-z0-9!@#$%^&*()_+' </dev/urandom | head -c 16
}

# Function to update the Harbor admin password in harbor.yml
update_harbor_admin_password() {
    local HARBOR_CONFIG="/opt/harbor/harbor.yml"
    local NEW_PASS
    NEW_PASS=$(generate_password)

    # Check if harbor.yml exists
    if [ -f "$HARBOR_CONFIG" ]; then
        # Update the harbor_admin_password field in harbor.yml
        sudo sed -i "s|^harbor_admin_password: .*|harbor_admin_password: $NEW_PASS|" "$HARBOR_CONFIG"

        echo -e "${GREEN}Harbor Admin Password has been updated.${NC}"
        echo
        echo
        echo -e "${GREEN}New Harbor Admin Password: ${YELLOW}$NEW_PASS${NC}"
        echo
        echo
    else
        echo -e "${RED}Error: Harbor configuration file not found at $HARBOR_CONFIG.${NC}"
    fi
}

# Call the function to update the password
update_harbor_admin_password

# Function to handle Ctrl+C during domain input
handle_ctrl_c() {
    echo -e "\n${RED}Domain and SSL have NOT been configured. Using the IP address for access.${NC}"

    # Get the primary IP address of the VM
    IP_ADDRESS=$(hostname -I | awk '{print $1}')

    # Comment out SSL configuration and update hostname with IP
    echo -e "${GREEN}Commenting out https configuration and setting hostname to $IP_ADDRESS...${NC}"

    # Comment out https related lines in harbor.yml
    sudo sed -i "/^https:/,/^$/{
        s|^https:|# https:|;
        s|^  port:|#   port:|;
        s|^  certificate:|#   certificate:|;
        s|^  private_key:|#   private_key:|;
    }" "/opt/harbor/harbor.yml"

    # Update hostname to IP address
    sudo sed -i "s/^hostname: .*/hostname: $IP_ADDRESS/" "/opt/harbor/harbor.yml"

    echo -e "${GREEN}SSL installation has failed, and hostname has been updated to IP: $IP_ADDRESS.${NC}"
    exit 1
}

# Ask for domain name
while true; do
    echo -e "${RED}To cancel setup, press Ctrl+C. This script will run again on your next login:${NC}"
    echo -e "${RED}Enter the domain name for your new SSL certificate:${NC}"
    echo -e "${RED}(Example: example.org or sub.example.org) - Do NOT include www or http/s:${NC}"

    # Enable Ctrl+C handling only for domain input
    trap 'handle_ctrl_c' SIGINT
    read -p "Domain/Subdomain name: " dom
    trap - SIGINT  # Disable Ctrl+C handling after domain input

    if [ -z "$dom" ]; then
        echo -e "${RED}Please provide a valid domain or subdomain name.${NC}"
    else
        break
    fi
done

echo -e "${GREEN}Domain entered: $dom${NC}"
echo -e "${GREEN}Configuring SSL for $dom...${NC}"

# Obtain SSL certificate using standalone mode
if [ -n "$dom" ]; then
    echo -e "${RED}Requesting SSL certificate for $dom using Certbot standalone mode...${NC}"
    sudo certbot certonly --standalone -d "$dom" --agree-tos --email admin@$dom --non-interactive

    # Define SSL paths
    CERT_PATH="/etc/letsencrypt/live/$dom/fullchain.pem"
    KEY_PATH="/etc/letsencrypt/live/$dom/privkey.pem"
    HARBOR_CONFIG="/opt/harbor/harbor.yml"

    # Check if SSL certificate exists and update Harbor configuration
    if [ -f "$CERT_PATH" ]; then
        echo -e "${GREEN}SSL Certificate successfully installed for domain: $dom.${NC}"

        # Replace or comment out https entry in harbor.yml using sed
        if grep -q '^https:' "$HARBOR_CONFIG"; then
            echo -e "${GREEN}Updating existing https configuration in harbor.yml...${NC}"
            sudo sed -i "/^https:/,/^$/{
                /^https:/s|certificate:.*|certificate: $CERT_PATH|;
                /^https:/s|private_key:.*|private_key: $KEY_PATH|;
                /^https:/s|port:.*|port: 443|;
            }" "$HARBOR_CONFIG"
        else
            echo -e "${GREEN}Adding https configuration in harbor.yml...${NC}"
            sudo sed -i "/# https related config/a \
https:\n\
  port: 443\n\
  certificate: $CERT_PATH\n\
  private_key: $KEY_PATH" "$HARBOR_CONFIG"
        fi

        # Replace the hostname with the domain
        echo -e "${GREEN}Updating hostname in harbor.yml to $dom...${NC}"
        sudo sed -i "s/^hostname: .*/hostname: $dom/" "$HARBOR_CONFIG"

        echo -e "${GREEN}Harbor configuration updated with SSL details and hostname.${NC}"
        echo -e "${GREEN}Domain and SSL have been successfully configured!${NC}"
    else
        echo -e "${RED}SSL Certificate installation failed. Please check the logs above.${NC}"
        handle_ctrl_c  # Handle failure by executing the fallback logic (to update hostname and comment out SSL)
    fi
else
    # If no domain is provided, handle the failure case
    handle_ctrl_c
fi