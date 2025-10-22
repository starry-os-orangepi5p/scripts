#!/bin/bash

# Check if ethernet interface exists before configuring it
if ifconfig ${STARRY_CON_EN_INTERFACE} &>/dev/null; then
    # Check if ethernet already has an IP address assigned
    if ifconfig ${STARRY_CON_EN_INTERFACE} | grep -q "inet "; then
        current_ip=$(ifconfig ${STARRY_CON_EN_INTERFACE} | grep "inet " | awk '{print $2}')
        echo "${STARRY_CON_EN_INTERFACE} interface already has IP address: $current_ip"
        read -p "Do you want to overwrite it? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Configuration skipped"
            exit 0
        fi
    fi

    sudo ifconfig ${STARRY_CON_EN_INTERFACE} ${STARRY_CON_TFTP_SERVER_IP} netmask ${STARRY_CON_TFTP_SERVER_NETMASK}
    echo "Successfully configured ${STARRY_CON_EN_INTERFACE} interface"
else
    echo "Error: ${STARRY_CON_EN_INTERFACE} interface not found"
    exit 1
fi
