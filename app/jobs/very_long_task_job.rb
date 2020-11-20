class VeryLongTaskJob < ApplicationJob
  queue_as :default

  def perform(assets_type, assets_id, buryer_id)
    asset = assets_type.camelize.constantize.find_by_id(assets_id)
    owner = asset.user
    buryer = User.find(buryer_id)
    sleep 60
    true
    puts 'sending email'
    UserMailer.buyer_booking_email(buryer).deliver_now
    UserMailer.owner_booking_email(owner).deliver_now
  end
end
