class ContactsController < ApplicationController

  def index
    @contacts = Contact.all.order('name ASC')
  end

  def new
  end

  def create
    contact = Contact.new(
      :name => params[:contact][:name],
      :address => params[:contact][:address],
      :phone => params[:contact][:phone],
      :email => params[:contact][:email])
    if contact.valid_phone? && contact.valid_email? 
      contact.save
    end
    redirect_to("/contacts")
  end

  def show
    id = params[:id]
    @contact = Contact.find(id)
  end

  def favorites
    @contacts = Contact.where(favorite: true)
  end

  def add_favorite
    id = params[:id]
    contact = Contact.find(id)
    contact.favorite = true
    contact.save
    redirect_to("/favorites")
  end

  def search
    letter = params[:letter]
    @contacts = Contact.where("name LIKE '#{letter}%'")
  end

end
