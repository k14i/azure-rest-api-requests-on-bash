#!/usr/bin/env bash

exit_status=0

if [ x${AZURE_SP_APP_ID} == x ]; then
    echo "ERROR: Environment variable AZURE_SP_APP_ID is required."
    exit_status=1
fi

if [ x${AZURE_SP_PASSWORD} == x ]; then
    echo "ERROR: Environment variable AZURE_SP_PASSWORD is required."
    exit_status=1
fi

if [ x${AZURE_SP_TENANT} == x ]; then
    echo "ERROR: Environment variable AZURE_SP_TENANT is required."
    exit_status=1
fi

if [ ${exit_status} -ne 0 ]; then
    exit ${exit_status}
fi

curl \
    -X POST \
    -d "grant_type=client_credentials&client_id=${AZURE_SP_APP_ID}&client_secret=${AZURE_SP_PASSWORD}&resource=https%3A%2F%2Fmanagement.azure.com%2F" \
    "https://login.microsoftonline.com/${AZURE_SP_TENANT}/oauth2/token"

if [ `echo -n $?` -ne 0 ]; then
    echo "ERROR: curl returned non-zero status."
    exit 1
fi

echo

exit ${exit_status}

