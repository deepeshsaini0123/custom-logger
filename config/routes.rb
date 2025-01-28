# frozen_string_literal: true

CustomLogger::Engine.routes.draw do
  get "/examples" => "examples#index"
  # define routes here
end

Discourse::Application.routes.draw { mount ::CustomLogger::Engine, at: "custom-logger" }
