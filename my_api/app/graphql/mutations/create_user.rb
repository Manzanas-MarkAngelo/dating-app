# app/graphql/mutations/create_user.rb
module Mutations
  class CreateUser < BaseMutation
    argument :input, Types::CreateUserInput, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(input:)
      user = User.new(
        email: input.email,
        password: input.password,
        password_confirmation: input.password_confirmation
      )

      if user.save
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end