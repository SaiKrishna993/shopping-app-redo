require 'rails_helper'

RSpec.describe User, type: :model do
  context 'before publication' do  
    it 'cannot have orders' do   
      expect { User.create.orders.create! }.to raise_error(ActiveRecord::RecordNotSaved)
    end
  end

  context 'user password' do  
		it 'is database authenticable' do
		  user = User.create(
		    email: 'test@example.com', 
		    password: 'password123',
		    password_confirmation: 'password123'
		  )
		  expect(user.valid_password?('password123')).to be_truthy
		end
  end

end
