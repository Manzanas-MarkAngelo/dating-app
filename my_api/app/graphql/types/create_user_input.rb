# app/graphql/types/create_user_input.rb
module Types
  class CreateUserInput < Types::BaseInputObject
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true
  end
end