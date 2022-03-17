# Azure REST API Requests with curl

## Environment Variables

### Required

* `AZURE_SUBSCRIPTION_ID`

### Others

#### Service Principals

* `AZURE_SP_APP_ID`
* `AZURE_SP_PASSWORD`
* `AZURE_SP_TENANT`

#### Access Token

* `AZURE_SP_ACCESS_TOKEN`

#### Azure Data Explorer

* `AZURE_KUSTO_RG_NAME`
* `AZURE_KUSTO_CLUSTER_NAME`


## Usages

### List all resources

1. Create Service Principals
  - with `AZURE_SUBSCRIPTION_ID`
2. Set variables related to Service Principals
  - `appId` for `AZURE_SP_APP_ID`
  - `password` for `AZURE_SP_PASSWORD`
  - `tenant` for `AZURE_SP_TENANT`
3. Get Access Token
  - with `AZURE_SP_APP_ID`, `AZURE_SP_PASSWORD`, and `AZURE_SP_TENANT`
4. Set a variable `AZURE_SP_ACCESS_TOKEN`
3. List resources

