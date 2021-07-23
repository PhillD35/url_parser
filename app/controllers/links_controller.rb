# frozen_string_literal: true

class LinksController < ApplicationController
  def new; end

  def create
    LinksCreatorService.call(params[:links])

    redirect_to links_path
  end

  def index
    @links = Link.success
  end
end
