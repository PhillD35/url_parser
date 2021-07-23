# frozen_string_literal: true

class Link < ApplicationRecord
  has_one_attached :image

  STATUSES = %w[pending success failed].freeze

  scope :success, -> { where(status: 'success') }

  validates :url,
            presence: true,
            uniqueness: true,
            format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }

  validates :status,
            presence: true,
            inclusion: { in: STATUSES }

  def pending?
    status == 'pending'
  end

  def success!
    update!(status: 'success')
  end

  def failed!
    update!(status: 'failed')
  end
end
