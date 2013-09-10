require "spec_helper"

describe User do
	before { @user = User.new(email: "email@gmail.com", password: "foobar123", 
					 password_confirmation: "foobar123") }
	subject {@user}

	it { should respond_to(:email) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:remember_token) }
	it { should be_valid}

	
end