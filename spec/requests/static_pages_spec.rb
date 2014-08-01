require 'spec_helper'
# files in `spec/support` are automatically included

describe "StaticPages" do

  # this "lets" you set a local variable
  # let(:base_title) { "RoR Tutorial" }
  subject { page }

  describe "Home Page" do
    before { visit root_path }
    it { should have_content('hartl tutorial') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home')}
  end

  describe "Help page" do
    before { visit help_path }
    it { should have_selector('h1', text: 'Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }
    it { should have_selector('h1', text: 'About Us') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact Us" do
    before { visit contact_path }
    it { should have_selector('h1', text: 'Contact Us') }
    it { should have_title(full_title('Contact Us')) }

    # deprecated long form (5.3.4)
    # it "should have the right title" do
    #   expect(page).to have_title "#{base_title} | Contact Us"
    # end
  end

end
