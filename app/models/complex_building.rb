class ComplexBuilding < ApplicationRecord
	belongs_to :user
	has_one_attached :image

  delegate :email, to: :user

  def image_attachment_path
    image.attached? ? image : 'default.png'
  end
end
