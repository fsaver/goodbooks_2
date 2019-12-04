class Group < ApplicationRecord
  # Direct associations

  belongs_to :review_access,
             :required => false,
             :class_name => "Review"

  # Indirect associations

  # Validations

end
