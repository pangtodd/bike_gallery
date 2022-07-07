require 'rails_helper'

describe Bike do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should validate_numericality_of :price}
  it { should validate_presence_of :size}
  it { should validate_presence_of :description}

end