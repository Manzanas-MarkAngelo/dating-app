// src/graphql/mutations/register.js
import { gql } from '@apollo/client/core';

export const REGISTER_USER = gql`
  mutation RegisterUser($input: CreateUserInput!) {
    createUser(input: $input) {
      user {
        id
        email
      }
      errors
    }
  }
`;
