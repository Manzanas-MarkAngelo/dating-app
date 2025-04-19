<script setup>
import RegistrationForm from './components/RegistrationForm.vue'  // Updated import
</script>

<template>
  <div class="container">
    <RegistrationForm />  <!-- Replaced GraphQLTest with RegistrationForm -->
  </div>
</template>

<style>
.container {
  padding: 2rem;
  text-align: center;
}
</style>