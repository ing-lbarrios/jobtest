# Net::HTTP native 2.2.4 ruby lib does not support multipart/form-data
# so we need to rely on a gem like Faraday to send proper HTTP requests.
require 'faraday'

class SuperAgent
  API_ENDPOINT = 'http://localhost:5000'.freeze

  def self.retrieve_posts
    connection = Faraday.new(url: API_ENDPOINT) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    res = connection.get '/posts'

    if res.success?
      { response: :ok, posts: JSON.parse(res.body, symbolize_names: true), status: res.status }
    else
      { response: :not_ok, status: res.status, reason: res.reason_phrase }
    end
  end

  def self.find_post(post_id)
    connection = Faraday.new(url: API_ENDPOINT) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    res = connection.get "/posts/#{post_id}"

    if res.success?
      { response: :ok, post: res.body.present? && JSON.parse(res.body, symbolize_names: true), status: res.status }
    else
      { response: :not_ok, status: res.status, reason: res.reason_phrase }
    end
  end

  def self.create_post(params)
    connection = Faraday.new(url: API_ENDPOINT) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    # Params must contain the :post namespace
    res = connection.post '/posts', params

    if res.success?
      { response: :ok, post: JSON.parse(res.body), status: res.status }
    else
      { response: :not_ok, status: res.status, reason: res.reason_phrase }
    end
  end

  def self.update_post(post_id, params)
    connection = Faraday.new(url: API_ENDPOINT) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    # Params must contain the :post namespace
    res = connection.put "/posts/#{post_id}", params

    if res.success?
      { response: :ok, post: res.body.present? && JSON.parse(res.body), status: res.status }
    else
      { response: :not_ok, status: res.status, reason: res.reason_phrase }
    end
  end

  def self.delete_post(post_id)
    connection = Faraday.new(url: API_ENDPOINT) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    # Params must contain the :post namespace
    res = connection.delete "/posts/#{post_id}"

    if res.success?
      { response: :ok, status: res.status }
    else
      { response: :not_ok, status: res.status, reason: res.reason_phrase }
    end
  end

  def self.retrieve_authors
    connection = Faraday.new(url: API_ENDPOINT) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    res = connection.get '/authors'

    if res.success?
      { response: :ok, authors: res.body.present? && JSON.parse(res.body, symbolize_names: true), status: res.status }
    else
      { response: :not_ok, status: res.status, reason: res.reason_phrase }
    end
  end

  def self.find_author(author_id)
    connection = Faraday.new(url: API_ENDPOINT) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    res = connection.get "/authors/#{author_id}"

    if res.success?
      { response: :ok, author: JSON.parse(res.body), status: res.status }
    else
      { response: :not_ok, status: res.status, reason: res.reason_phrase }
    end
  end

  def self.create_author(params)
    connection = Faraday.new(url: API_ENDPOINT) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    # Params must contain the :author namespace
    res = connection.post '/authors', params

    if res.success?
      { response: :ok, author: JSON.parse(res.body), status: res.status }
    else
      { response: :not_ok, status: res.status, reason: res.reason_phrase }
    end
  end

  def self.update_author(author_id, params)
    connection = Faraday.new(url: API_ENDPOINT) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    # Params must contain the :post namespace
    res = connection.put "/authors/#{author_id}", params

    if res.success?
      { response: :ok, author: res.body.present? && JSON.parse(res.body), status: res.status }
    else
      { response: :not_ok, status: res.status, reason: res.reason_phrase }
    end
  end

  def self.delete_author(author_id)
    connection = Faraday.new(url: API_ENDPOINT) do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    # Params must contain the :post namespace
    res = connection.delete "/authors/#{author_id}"

    if res.success?
      { response: :ok, status: res.status }
    else
      { response: :not_ok, status: res.status, reason: res.reason_phrase }
    end
  end
end
