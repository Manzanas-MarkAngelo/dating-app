Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphql", graphql_path: "/graphql"
  end

  get "up" => "rails/health#show", as: :rails_health_check

  get '/schema_debug', to: -> (env) {
  require_relative '../../app/graphql/my_api_schema'
  schema = MyApiSchema.to_definition
  [200, {'Content-Type' => 'text/plain'}, [schema]]
}
end
