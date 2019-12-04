class Book < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
