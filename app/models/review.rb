class Review < ApplicationRecord
  # Direct associations

  has_many   :groups,
             :foreign_key => "review_access_id",
             :dependent => :nullify

  belongs_to :book,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
