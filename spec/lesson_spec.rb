require 'rails_helper'


describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }
  it { should ensure_length_of(:name).is_at_most(30) }

end
