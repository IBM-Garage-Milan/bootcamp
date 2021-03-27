#!/bin/bash

display_usage() {
    echo -e "\nUsage: $0 project \n"
}

if [ $# -le 0 ]; then
    display_usage
    exit 1
fi

if [[ ($# == "--help") || $# == "-h" ]]; then
    display_usage
    exit 0
fi

#oc patch servicemeshmemberroll/default -n istio-system --type=merge -p '{"spec": {"members": ["tracing"]}}'
oc -n istio-system patch --type='json' smmr default -p "[{\"op\": \"add\", \"path\": \"/spec/members/-\", \"value\":\"$1\"}]"

