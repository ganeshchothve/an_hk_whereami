class WhereamiController < ApplicationController
  def index
    remote_ip = request.remote_ip
    accept_language = request.headers['HTTP_ACCEPT_LANGUAGE']

    unless remote_ip
      render json: {
        ip: nil,
        country: nil,
        language: get_most_used_language(accept_language)
      }
    else
      ip_info = fetch_ip_info(remote_ip)
      render json: {
        ip: remote_ip,
        country: ip_info[:country],
        language: get_most_used_language(accept_language)
      }
    end
  end

  private

  def fetch_ip_info(ip)
    uri = URI("https://jsonmock.hackerrank.com/api/ip/#{ip}")
    response = Net::HTTP.get_response(uri)

    return { ip: ip, country: nil } unless response.is_a?(Net::HTTPSuccess)

    json_response = JSON.parse(response.body)
    { ip: json_response['ip'], country: json_response['country'] }
  end

  def get_most_used_language(accept_language)
    return nil if accept_language.blank?

    languages = accept_language.split(',').map { |entry| entry.split(';').first }
    most_used_language = languages.max_by { |lang| languages.count(lang) }

    most_used_language
  end
end
