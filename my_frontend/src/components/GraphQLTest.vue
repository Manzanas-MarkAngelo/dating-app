<script setup>
import { useMutation } from '@vue/apollo-composable'
import { gql } from '@apollo/client/core'

const { mutate, onDone } = useMutation(gql`
  mutation TestMutation {
    testMutation
  }
`)

onDone(result => {
  console.log('Received:', result.data.testMutation)
})
</script>

<template>
  <button @click="mutate()">Test GraphQL</button>
</template>