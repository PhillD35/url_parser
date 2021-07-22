# frozen_string_literal: true

class Link < ApplicationRecord
  validates :url,
            presence: true,
            unique: true,
            format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
end
