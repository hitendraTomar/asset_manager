class Role < ApplicationRecord
	has_one :user_role
  has_one :user, through: :user_role
end
