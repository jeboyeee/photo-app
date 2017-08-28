class Payment < ActiveRecord::Base
  #for the javascript to handle
  attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expires_year
  belongs_to :user
  
  def self.month_options
    Date::MONTHNAMES.compact.each_with_index.map { |name, i| ["#{i+1} - #{name}", i+1]}
  end
  
  def self.year_options
    (Date.today.year..(Date.today.year+10)).to_a #to_a to convert into an array
  end
  
  #proces payment method that we will user while creating the registration
  #will use in registrations_controller.rb
  def process_payment
    customer = Stripe::Customer.create email: email, card: token
    
    Stripe::Charge.create customer: customer.id,
          amount: 1000, #in cents (amount will be $10)
          description: 'Premium',
          currency: 'usd'
  end
end
