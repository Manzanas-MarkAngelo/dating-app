<!-- src/components/RegistrationForm.vue -->
<template>
  <form @submit.prevent="onSubmit">
    <div>
      <label>Email</label>
      <input v-model="form.email" type="email" required />
    </div>
    <div>
      <label>Password</label>
      <input v-model="form.password" type="password" required minlength="6" />
    </div>
    <div>
      <label>Confirm Password</label>
      <input v-model="form.passwordConfirmation" type="password" required />
    </div>
    <button type="submit">Register</button>
    <div v-if="errors.length">
      <p v-for="e in errors" :key="e" class="error">{{ e }}</p>
    </div>
  </form>
</template>

<script setup>
import { reactive, ref } from 'vue';
import { useMutation } from '@vue/apollo-composable';
import { REGISTER_USER } from '../graphql/mutations/register';

const form = reactive({
  email: '',
  password: '',
  passwordConfirmation: '',
});

const errors = ref([]);

const { mutate: register } = useMutation(REGISTER_USER, () => ({
  variables: {
    input: {
      email: form.email,
      password: form.password,
      passwordConfirmation: form.passwordConfirmation,
    },
  },
}));

function onSubmit() {
  errors.value = [];
  register()
    .then(({ data }) => {
      if (data.createUser.errors.length) {
        errors.value = data.createUser.errors;
      } else {
        alert('Registration successful!');
        Object.assign(form, {
          email: '',
          password: '',
          passwordConfirmation: '',
        });
      }
    })
    .catch(err => {
      console.error(err);
      errors.value = ['An unexpected error occurred.'];
    });
}
</script>

<style scoped>
.error { color: red; }
</style>
