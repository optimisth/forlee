class List < ActiveRecord::Base
	has_many :bulletins, dependent: :destroy
end
