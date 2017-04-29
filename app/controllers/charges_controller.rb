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
    current_user.premium!
    redirect_to '/wikis'

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

  def edit
    customer = Stripe::Customer.retrieve({CUSTOMER_ID})
  end

  def destroy
    customer = Stripe::Customer.retrieve({CUSTOMER_ID})
    customer.delete
    if customer.destroy
      flash[:notice] = "You have successfully downgraded your account to standard, #{current_user.email}."
      current_user.standard!
      redirect_to '/wikis'
    else
      flash.now[:alert] = "There was an error updating your account."
      render :edit
    end
  end
end
