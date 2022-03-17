#!/usr/bin/env bash

exit_status=0

if [ x${AZURE_SP_ACCESS_TOKEN} == x ]; then
    echo "ERROR: Environment variable AZURE_SP_ACCESS_TOKEN is required."
    exit_status=1
fi

if [ x${AZURE_SUBSCRIPTION_ID} == x ]; then
    echo "ERROR: Environment variable AZURE_SUBSCRIPTION_ID is required."
    exit_status=1
fi

if [ ${exit_status} -ne 0 ]; then
    exit ${exit_status}
fi

curl \
    -X GET \
    -H "Authorization: Bearer ${AZURE_SP_ACCESS_TOKEN}" \
    -H "Content-Type: application/json" \
    "https://management.azure.com/subscriptions/${AZURE_SUBSCRIPTION_ID}/resources?api-version=2019-10-01"

if [ `echo -n $?` -ne 0 ]; then
    echo "ERROR: curl returned non-zero status."
    exit 1
fi

echo

exit ${exit_status}

