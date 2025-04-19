# app/graphql/types/mutation_type.rb
module Types
  class MutationType < Types::BaseObject
    # Registers the RegisterUser mutation
    field :create_user, mutation: Mutations::CreateUser

    field :test_mutation, String, null: false, description: "A test mutation"
    def test_mutation; "Hello from Rails GraphQL!!!!!!!"; end
  end
end