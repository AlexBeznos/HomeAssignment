class Robot < ActiveRecord::Base
	has_and_belongs_to_many :features
end
