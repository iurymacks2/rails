require 'rails_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "it's valid when have the firstname and lastname and email" do
    user = User.new(firstname: 'Goku',
      lastname: 'Son',
      email: 'songoku@gmail.com' )

      expect(user).to be_valid
  end
  it 'is not valid when the firstname is null' do
    user = User.new(firstname: nil)
    user.valid?
    expect(user.errors[:firstname]).to  include("can't be blank")
  end
  it "it's invalid if already have a same email on system!!" do
    user = User.create( firstname: 'Steve',
    lastname: 'Harrys', email: 'contato4@ironmaden.com')
    user = User.new( firstname: 'Kira',
    lastname: 'dumb', email: 'contato5@ironmaden.com')
    user.valid?
    expect(user.errors[:email]).to include('has already in use')
  end
end
