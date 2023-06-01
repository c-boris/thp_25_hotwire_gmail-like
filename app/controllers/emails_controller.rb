class EmailsController < ApplicationController
  require 'faker'

  def index
      @emails = Email.all
  end

  def show
      @email = Email.find(params[:id])
      respond_to do |format|
          format.turbo_stream
          format.html
      end
  end

  def new
      @emails = Email.all
  end

  def create
      @email = Email.new(object: Faker::Lorem.sentence(word_count: 3), body: Faker::Lorem.sentence(word_count: 20))
      if @email.save
          redirect_to root_path
          flash[:notice] = "Email created"
      else
          redirect_to root_path
          flash[:notice] = "Please try again"
      end
  end

end