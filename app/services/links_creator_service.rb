# frozen_string_literal: true

class LinksCreatorService < ApplicationService
  def initialize(text)
    @text = text.to_s
  end

  def call
    links = create_links

    ImageDownloaderService.call(links)
  end

  private

  attr_reader :text

  def create_links
    text
      .lines(chomp: true)
      .reject(&:empty?)
      .select { |line| line.match?(/\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/) }
      .map { |line| Link.create_or_find_by(url: line) }
  end
end
