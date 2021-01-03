# == Schema Information
#
# Table name: stores
#
#  id          :bigint           not null, primary key
#  description :string(255)
#  name        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Store < ApplicationRecord
    has_many :product
  
    validates :name, presence: true
    validates :description, presence: true
end
