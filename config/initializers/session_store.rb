# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_myrese_session', domain: :all

#+Rails.application.config.session_store :cookie_store, key: '_myrese_session', domain: {
#+   production: 'myrese.com'
#+}.fetch(Rails.env.to_sym, :all)
