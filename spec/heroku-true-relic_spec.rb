require 'spec_helper'

describe HerokuTrueRelic do
  describe Dummy::Application do
    subject { Rails.application }
    it { should be_a_kind_of Dummy::Application }
  end
end
