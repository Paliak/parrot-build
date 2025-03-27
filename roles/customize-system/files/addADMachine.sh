#!/bin/bash

show_help() {
    echo "Usage: $0 [-i IP] [-d DOMAIN] [-t TLD] [-m MACHINE] [-h]"
    echo ""
    echo "Options:"
    echo "  -i IP      IP address to use"
    echo "  -d DOMAIN  Domain name (e.g., 'example')"
    echo "  -t TLD     Top-level domain (e.g., 'com')"
    echo "  -m MACHINE Machine name (add DOMAIN as DC if not provided)"
    echo "  -h         Show help with examples"
    echo ""
}

show_examples() {
    echo "Example 1 (add DC): $0 -i 10.10.14.8 -d frenzy -t htb"
    echo "# Added to /etc/hosts:"
    echo "# 10.10.14.8 dc.frenzy.htb frenzy.htb dc$"
    echo ""
    echo "Example 2 (add Machine): $0 -i 10.10.14.8 -d frenzy -t htb -m MS01"
    echo "# Added to /etc/hosts:"
    echo "# 10.10.14.8 MS01.frenzy.htb frenzy.htb MS01$"
}

# Parse command line arguments
while getopts ":i:d:t:m:h" opt; do
    case $opt in
        i) IP="$OPTARG";;
        d) DOMAIN="$OPTARG";;
        t) TLD="$OPTARG";;
        m) MACHINE="$OPTARG";;
        h) show_help; show_examples; exit 0;;
        \?) echo "Invalid option: -$OPTARG"; show_help; exit 1;;
    esac
done


if [ -z "$IP" ] || [ -z "$DOMAIN" ] || [ -z "$TLD" ]; then
    echo "Error: IP, domain, and TLD are required (-i, -d, -t)"
    show_help
    exit 1
fi

if [[ $MACHINE ]]; then
    HOSTS_ENTRY="$IP $MACHINE.$DOMAIN.$TLD $MACHINE\$"
else
    HOSTS_ENTRY="$IP dc.$DOMAIN.$TLD $DOMAIN.$TLD dc\$"
fi

echo "$HOSTS_ENTRY" | sudo tee -a /etc/hosts > /dev/null

echo "Added to /etc/hosts:"
tail -n 1 /etc/hosts