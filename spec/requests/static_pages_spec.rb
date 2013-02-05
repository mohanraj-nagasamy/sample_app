require 'spec_helper'

describe "StaticPages" do

  let(:title) { 'Ruby on Rails Tutorial Sample App' }
  subject { page }

  describe "Home pages" do
    before { visit root_path }

    it { should have_content "Sample App" }
    it { should have_selector 'title', :text => full_title('') }

    it "should have the h1 'Welcome to the Sample App'" do
      #response.status.should be(200)
      page.should have_content "Sample App"
      page.should have_selector('h1', :text => 'Welcome to the Sample App')
    end

    it "should have the base title" do
      page.should have_selector("title", :text => "#{title}")
    end

    it "should not have a custom page title" do
      page.should_not have_selector("title", :text => full_title("Home"))
    end

  end

  describe "Help pages" do
    it "should have content 'Help'" do
      visit help_path
      page.should have_content "Help"
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      page.should have_selector('title', :text => full_title("Help"))
    end
  end

  describe "About pages" do
    it "should have content 'About Us'" do
      visit about_path
      page.should have_content "About Us"
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      visit about_path
      page.should have_selector('title', :text => full_title("About Us"))
    end
  end

  describe "Contact pages" do
    it "should have content 'Contact'" do
      visit contact_path
      page.should have_selector("h1", text: 'Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      page.should have_selector('title', :text => full_title("Contact"))
    end
  end

  share_examples_for "all static pages" do
    it { should have_selector "h1", text: heading }
    it { should have_selector "title", text: full_title(page_title) }
  end

  describe "Home page" do
    before(:each) do
      visit root_path
    end
    let(:heading) { "Sample App" }
    let(:page_title) { "" }

    it_should_behave_like "all static pages"
    it { should_not have_selector "h1", text: "| Home" }

  end
end
