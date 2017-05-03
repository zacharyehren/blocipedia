class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Blocipedia Membership - #{current_user.email}",
      amount: Amount.default
    }
  end

  def create
      customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: Amount.default,
      description: "Premium Blocipedia Membership - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Thank you for upgrading you membership, #{current_user.email}!"
    current_user.customer_id = customer.id
    current_user.save!
    current_user.premium!
    redirect_to '/wikis'

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

end
