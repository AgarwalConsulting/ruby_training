require_relative '../hello'

RSpec.describe Hello do
  context "#world" do
    it { expect(Hello.world).to eql 'world' }
  end
end
