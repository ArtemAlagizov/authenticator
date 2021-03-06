# frozen_string_literal: true

class AuthenticateController < ApplicationController
  # POST at /authenticate - posts credentials to the authentication service.
  # [returns jwt in the return message if successful]
  def create
    conn = Faraday.new(url: Settings.authentication_service)

    response = conn.post do |req|
      req.url '/authenticate'
      req.headers['Content-Type'] = 'application/json'
      req.body = params.to_json
    end

    status = response.status
    token = response.body

    json_response({ message: { token: token } }, status)
  end

  # GET at /authenticate - tries to get public key from the authentication service.
  # [returns public key if successful]
  def index
    conn = Faraday.new(url: Settings.authentication_service)

    conn.get do |req|
      req.url '/authenticate'
    end
  end
end
