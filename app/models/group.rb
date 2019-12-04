class Group < ApplicationRecord
  # Direct associations

  has_many   :users,
             :dependent => :nullify

  belongs_to :review_access,
             :required => false,
             :class_name => "Review"

  # Indirect associations

  # Validations

end
