require 'spec_helper'
require 'capybara/rspec'

describe "the views for people", type: :request do
  before(:all) do
    @person = Person.create(first_name: "John", last_name: "Doe")
    number_a = @person.phone_numbers.create(number: "1234567")
    number_b = @person.phone_numbers.create(number: "7654321")
    @email_a = @person.email_addresses.create(address: "foo@bar.com", 
      person_id: 2)
  end

  describe "when looking at a single person" do
    before(:all) do
      visit person_path(@person)
    end

    it "should have edit links for each phone number" do
      @person.phone_numbers.each do |phone_number|
        page.should have_link("Edit", href: edit_phone_number_path(phone_number))
      end
    end

    # it "shows each of the email addresses" do
    #   page.should have_selector('li', text: "foo@bar.com")
    # end #####stupid capybara
  end
end
