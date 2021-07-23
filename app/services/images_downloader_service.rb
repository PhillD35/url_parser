class ImagesDownloaderService < ApplicationService
  def initialize(links)
    @links = links
  end

  def call
    @links.each { |link| ImageDownloaderService.call(link) }
  end
end
