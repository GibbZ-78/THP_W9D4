class EmailsController < ApplicationController

  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
  end

  def create
    @email = Email.create(object: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 0).chop, body: Faker::Lorem.paragraph)
    respond_to do |format|
      format.js { }
      format.html{ render root_path }
    end
  end

  def new
    #useless
  end

  def edit
    #useless
  end

  def delete
    @email = Email.find(params[:id])
    @email.destroy
    redirect_to root_path
  end

end
