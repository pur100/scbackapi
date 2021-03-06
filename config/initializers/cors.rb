# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors
Rails.application.config.middleware.insert_before 0, Rack::Cors do
       allow do
         origins '*'
         resource(
           '*',
           headers: :any,
           methods: [:get, :patch, :put, :delete, :post, :options]
           )
       end

  # allow do
  #   origins 'https://nuxt-sc.herokuapp.com/'

  #   resource '*',
  #     headers: :any,
  #     credentials: true,
  #     methods: [:get, :post, :put, :patch, :delete, :options, :head]
  # end
  # allow do
  #   origins 'http://192.168.1.38:3000'

  #   resource '*',
  #     headers: :any,
  #     credentials: true,
  #     methods: [:get, :post, :put, :patch, :delete, :options, :head]
  # end

  # allow do
  #   origins 'https://solutioncreance.fr'

  #   resource '*',
  #     headers: :any,
  #     credentials: true,
  #     methods: [:get, :post, :put, :patch, :delete, :options, :head]
  # end


end
