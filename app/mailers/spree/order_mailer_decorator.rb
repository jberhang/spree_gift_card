Spree::OrderMailer.class_eval do
  def gift_card_email(card_id, order_id)
    @gift_card = Spree::GiftCard.find(card_id)
    @order = Spree::Order.find(order_id)
    @location = current_location_phone_email_location(@order.special_instructions)
    subject = "Scratch DJ Academy - Gift Card"
    @gift_card.update_attribute(:sent_at, Time.now)
    mail(:to => @gift_card.email, :from => from_address, :subject => subject)
  end
end
