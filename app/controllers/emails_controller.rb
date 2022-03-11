class EmailsController < ApplicationController

  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
  end

  def create
    @email = Email.create(object: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 0).chop+"[created]", body: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false))
    respond_to do |format|
      format.js { }
      format.html{ redirect_to root_path }
    end
  end

  def new
    #useless
  end

  def edit
    #useless
  end

  def destroy
    @email = Email.find(params[:id])
    puts "  > E-mail n°"+@email.id+"va être effacé"
    @email.destroy
    respond_to do |format|
      format.js { }
      format.html{ redirect_to root_path }
    end
  end

end
