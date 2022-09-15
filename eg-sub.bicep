@description('Name of the Service Bus namespace')
param systemTopicName string

@description('The location in which the Event Grid resources should be deployed.')
param location string = resourceGroup().location

resource systemTopic 'Microsoft.EventGrid/systemTopics@2022-06-15' = {
  name: systemTopicName
  location: location
  properties: {
    source: '/subscriptions/8c98d9ee-59e7-4a29-a204-2e7c8471fda1/resourceGroups/sb-demo2-rg/providers/Microsoft.ServiceBus/namespaces/sutest2'
    topicType: 'Microsoft.ServiceBus.Namespaces'
  }   
}
