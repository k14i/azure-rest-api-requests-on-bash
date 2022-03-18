#!/usr/bin/env bash

# NOTE:
# This script is mainly for
# https://docs.microsoft.com/azure/data-explorer/cross-tenant-query-and-commands?tabs=define-with-portal#update-the-cluster


exit_status=0

if [ x${AZURE_SP_ACCESS_TOKEN} == x ]; then
    echo "ERROR: Environment variable AZURE_SP_ACCESS_TOKEN is required."
    exit_status=1
fi

if [ x${AZURE_SUBSCRIPTION_ID} == x ]; then
    echo "ERROR: Environment variable AZURE_SUBSCRIPTION_ID is required."
    exit_status=1
fi

if [ x${AZURE_DATA_EXPLORER_RG_NAME} == x ]; then
    echo "ERROR: Environment variable AZURE_DATA_EXPLORER_RG_NAME is required."
    exit_status=1
fi

if [ x${AZURE_DATA_EXPLORER_CLUSTER_NAME} == x ]; then
    echo "ERROR: Environment variable AZURE_DATA_EXPLORER_CLUSTER_NAME is required."
    exit_status=1
fi

if [ x${AZURE_DATA_EXPLORER_PROPERTIES} == x ]; then
    echo "ERROR: Environment variable AZURE_DATA_EXPLORER_CLUSTER_PROPERTIES is required."
    exit_status=1
fi

if [ ${exit_status} -ne 0 ]; then
    exit ${exit_status}
fi

method="PATCH"
header_auth="Authorization: Bearer ${AZURE_SP_ACCESS_TOKEN}"
header_content_type="Content-Type: application/json"
url="https://management.azure.com/subscriptions/${AZURE_SUBSCRIPTION_ID}/resourceGroups/${AZURE_DATA_EXPLORER_RG_NAME}/providers/Microsoft.Kusto/clusters/${AZURE_DATA_EXPLORER_CLUSTER_NAME}?api-version=2020-09-18"

echo "DEBUG: curl -X \"${method}\" -H \"${header_auth}\" -H \"${header_content_type}\" -d \'${AZURE_DATA_EXPLORER_PROPERTIES}\' \"${url}\""

curl -X "${method}" -H "${header_auth}" -H "${header_content_type}" -d ${AZURE_DATA_EXPLORER_PROPERTIES} "${url}"

if [ `echo -n $?` -ne 0 ]; then
    echo "ERROR: curl returned non-zero status."
    exit 1
fi

echo

exit ${exit_status}

