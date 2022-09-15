@description('Name of the Service Bus namespace')
param serviceBusNamespaceName string

@description('Name of the Queue')
param serviceBusTopicName string

@description('The location in which the service bus should be deployed.')
param location string = resourceGroup().location

resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2022-01-01-preview' = {
  name: serviceBusNamespaceName
  location: location
  sku: {
    name: 'Premium'
  }
}

resource symbolicname 'Microsoft.ServiceBus/namespaces/topics@2022-01-01-preview' = {
  name: '${serviceBusNamespace.name}/${serviceBusTopicName}'
  properties: {
    requiresDuplicateDetection: false
     supportOrdering: true
  }
}
