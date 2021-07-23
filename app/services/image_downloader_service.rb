# frozen_string_literal: true

class ImageDownloaderService < ApplicationService
  def initialize(link)
    @link = link
  end

  def call
    return unless link.pending?
    return link.failed! unless image_response?

    File.open('tmp/image', 'wb') do |file|
      file.write(net_response.body)
    end

    link.image.attach(io: File.open('tmp/image'), filename: 'image')
    link.success!
  end

  private

  attr_reader :link

  def net_response
    @net_response ||= HTTParty.get(link.url)
  end

  def image_response?
    net_response.code == 200 && net_response.headers['Content-Type'].start_with?('image')
  end
end
