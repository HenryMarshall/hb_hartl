require 'spec_helper'
# files in `spec/support` are automatically included

describe "StaticPages" do

  # this "lets" you set a local variable
  # let(:base_title) { "RoR Tutorial" }
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home Page" do
    before { visit root_path }
    let(:heading)     { 'Sample App'}
    let(:page_title)  { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)     { 'Help' }
    let(:page_title)  { 'Help' }
    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)     { 'About Us' }
    let(:page_title)  { 'About Us' }
    it_should_behave_like "all static pages"
  end

  describe "Contact Us" do
    before { visit contact_path }
    let(:heading)     { 'Contact Us' }
    let(:page_title)  { 'Contact Us' }
    it_should_behave_like "all static pages"

    # deprecated for shared examples (5.3.9)
    # it { should have_selector('h1', text: 'Contact Us') }
    # it { should have_title(full_title('Contact Us')) }

    # deprecated long form (5.3.4)
    # it "should have the right title" do
    #   expect(page).to have_title "#{base_title} | Contact Us"
    # end
  end

  it "should have the right likes on the layout" do
    visit root_path
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact Us'))
    click_link "hartl tutorial"
    expect(page).to have_title(full_title(''))
  end

end
