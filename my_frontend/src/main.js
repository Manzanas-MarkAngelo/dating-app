import { createApp } from 'vue'
import { ApolloClient, InMemoryCache } from '@apollo/client/core'
import { DefaultApolloClient } from '@vue/apollo-composable'
import App from './App.vue'

// Read from import.meta.env; fallback to localhost for extra safety
const graphqlUri =
  import.meta.env.VITE_APP_GRAPHQL_HTTP || 'http://localhost:3000/graphql'

const apolloClient = new ApolloClient({
  uri: graphqlUri,
  cache: new InMemoryCache(),
})

const app = createApp(App)
app.provide(DefaultApolloClient, apolloClient)
app.mount('#app')
