class EmailsController < ApplicationController

  def index
    @emails = Email.all
    puts "  *** Going through the #index method with all "+@emails.count.to_s+" emails listed."
  end

  def show
    @email = Email.find(params[:id])
    puts "  *** Going through the #show method for email n°"+@email.id.to_s+"."
    respond_to do |format|
      format.js { render 'show' }
      format.html{ redirect_to root_path }
    end
  end

  def create
    @email = Email.create(object: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 0).chop+"[created]", 
                          body: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
                          read: false,
                          image: rand(1..5))
    puts "  *** Going through the #create method for email n°"+@email.id.to_s
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
    puts "  *** Going through the #destroy method for email n°"+@email.id.to_s
    @email.destroy
    respond_to do |format|
      format.js { }
      format.html{ redirect_to root_path }
    end
  end

end
