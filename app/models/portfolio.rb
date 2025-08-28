class Portfolio < ApplicationRecord
    has_many_attached :images
    has_rich_text :description
    validates :name, presence: true
end
