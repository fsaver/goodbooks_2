require 'rails_helper'

RSpec.describe Group, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:users) }

    it { should belong_to(:review_access) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
