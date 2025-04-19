# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    # Use your custom argument, field, and object classes:
    argument_class Types::BaseArgument
    field_class    Types::BaseField
    object_class   Types::BaseObject

    # (Optional) Make all mutations non-null by default:
    # null false
  end
end
