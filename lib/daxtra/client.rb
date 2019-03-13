# frozen_string_literal: true

require "faraday"
require "json"

module Daxtra
  class Client
    PATH = {
      http_prefix:         "http://",
      daxtra_server:       "cvxdemo.daxtra.com",
      api_version:         "/cvx/rest/api/v1",
      profile_full_path:   "/profile/full/json",
      convert_2_html_path: "/convert2html"
    }.freeze

    def initialize(account:, **options)
      @account = account
      @server  = options.delete(:server)
    end

    def post_profile_full(file)
      Faraday.post do |req|
        req.url(profile_full_url)
        req.body = body.merge(file: file)
      end
    end

    def post_convert_2_html(file)
      Faraday.post do |req|
        req.url(convert_2_html_url)
        req.body = body.merge(file: file)
      end
    end

    private

    attr_reader :account, :server

    def path
      @path ||= server ? PATH.merge(daxtra_server: server) : PATH
    end

    def profile_full_url
      PATH.values_at(
        :http_prefix, :daxtra_server, :api_version, :profile_full_path
      ).join
    end

    def convert_2_html_url
      PATH.values_at(
        :http_prefix, :daxtra_server, :api_version, :convert_2_html_path
      ).join
    end

    def body
      { account: account }
    end
  end
end
