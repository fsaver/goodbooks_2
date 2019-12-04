class Review < ApplicationRecord
  # Direct associations

  belongs_to :book,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
