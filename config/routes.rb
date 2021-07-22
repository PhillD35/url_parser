# frozen_string_literal: true

Rails.application.routes.draw do
  resources :links, only: %i[new create index]

  root 'links#new'
end
