# frozen_string_literal: true

class LinksController < ApplicationController
  def new; end

  def create
    LinksCreatorService.call(params[:text])
  end

  def index; end
end
