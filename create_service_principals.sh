#!/usr/bin/env bash

exit_status=0

if [ x${AZURE_SUBSCRIPTION_ID} == x ]; then
    echo "ERROR: Environment variable AZURE_SUBSCRIPTION_ID is required."
    exit_status=1
else
    echo "DEBUG: AZURE_SUBSCRIPTION_ID is ${AZURE_SUBSCRIPTION_ID}"
fi

if [ ${exit_status} -ne 0 ]; then
    exit ${exit_status}
fi

az ad sp create-for-rbac \
    --role="Contributor" \
    --scopes="/subscriptions/${AZURE_SUBSCRIPTION_ID}"

if [ `echo -n $?` -ne 0 ]; then
    echo "ERROR: az returned non-zero status."
    exit_status=1
fi

echo

exit ${exit_status}

