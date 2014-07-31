require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "RoR Tutorial" }

  describe "Home Page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it "should have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title "#{base_title}"
      expect(page).not_to have_title "| Home"
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
    it "should have the right title" do
      visit '/static_pages/help'
      expect(page).to have_title "#{base_title} | Help"
    end
  end

  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
    it "should have the right title" do
      visit '/static_pages/about'
      expect(page).to have_title "#{base_title} | About Us"
    end
  end

  describe "Contact Us" do
    it "should have the content 'Contact Us'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact Us')
    end
    it "should have the right title" do
      visit '/static_pages/contact'
      expect(page).to have_title "#{base_title} | Contact Us"
    end
  end

end
