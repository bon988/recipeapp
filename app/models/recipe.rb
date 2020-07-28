class Recipe < ApplicationRecord
    #a recipe belongs to user
    belongs_to :user
    #allows only one image upload
    has_one_attached :image
     
    has_many :ingredients, dependent: :destroy
    accepts_nested_attributes_for :ingredients, allow_destroy: true
    
    has_many :steps,  dependent: :destroy
    accepts_nested_attributes_for :steps, allow_destroy: true
    
end
