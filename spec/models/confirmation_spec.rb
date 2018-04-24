require 'rails_helper'

describe Confirmation, type: :model do

  it { is_expected.to belong_to(:plan) }

end
