class Mission < ApplicationRecord
    belongs_to :scientist 
    belongs_to :planet

    validates :name, :scientist, :planet, presence: true
    validates :mission, uniqueness: true

end
