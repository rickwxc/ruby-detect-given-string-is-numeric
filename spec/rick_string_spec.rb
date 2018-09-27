require 'spec_helper'
require 'json'
require './lib/RickSimpleString'

RSpec.describe "test string is_valid_numeric?" do

	describe RickSimpleString do

		context "valid" do
			it "integer" do
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('123')).to eq true
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('0')).to eq true
			end

			it "with ." do
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('1.23')).to eq true
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('.123')).to eq true
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('123.')).to eq true
			end

			it "with +" do
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('+123')).to eq true
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('+0')).to eq true
			end

			it "with -" do
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('-123')).to eq true
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('-0')).to eq true
			end

			it "with e" do
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('8e-16')).to eq true
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('8e+16')).to eq true
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('4.8e-16')).to eq true
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('0.8e-16')).to eq true
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('.8e-16')).to eq true
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('-.8e-16')).to eq true
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('+.8e-16')).to eq true
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('+.8e+16')).to eq true
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('-.8e+16')).to eq true
			end

		end

		context "not valid" do
			it "empty string" do
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('')).to eq false
			end

			it "double ." do
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('.1.23')).to eq false
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('1.23.')).to eq false
			end

			it "double -" do
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('--123')).to eq false
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('--.123')).to eq false
			end

			it "double +" do
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('++123')).to eq false
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('++.123')).to eq false
			end
			it "both - +" do
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('+-123')).to eq false
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('-+123')).to eq false
			end

			it "with e" do
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('123e++10')).to eq false
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('123e--10')).to eq false

				expect(RickSimpleString::NumberValidator.is_valid_numeric?('e+16')).to eq false 
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('+e+16')).to eq false
				expect(RickSimpleString::NumberValidator.is_valid_numeric?('-e+16')).to eq false
			end
		end


	end

end
