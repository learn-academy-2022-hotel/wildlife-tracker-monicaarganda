class Animal < ApplicationRecord
    has_many :sightings
    validates :common_name, :scientific_binomial, presence: true
    validates :common_name,:scientific_binomial, uniqueness: true
    validate :name_validation
        def name_validation
            if common_name == scientific_binomial
                errors.add(:common_name, 'Common name can not be the same as the animals scientific binomial')
                errors.add(:scientific_binomial, 'Scientific binomial can not be the same as the animals common name')
            end
        end
end
