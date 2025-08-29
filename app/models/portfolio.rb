class Portfolio < ApplicationRecord
    has_many_attached :images
    has_rich_text :description
    validates :name, presence: true

    def thumbnail_images
        images.map do |image|
            image.variant(resize_to_limit: [300, 300])
        end
    end
end
