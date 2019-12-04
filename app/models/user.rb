class User < ApplicationRecord
  # Direct associations

  belongs_to :group,
             :required => false,
             :counter_cache => true

  has_many   :reviews,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
