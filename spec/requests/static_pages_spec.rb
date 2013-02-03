require 'spec_helper'

describe "StaticPages" do

  let(:title) {'Ruby on Rails Tutorial Sample App'}

  describe "Home pages" do
    it "should have the h1 'Sample App'" do
      visit "/static_pages/home"
      #response.status.should be(200)
      page.should have_content "Sample App"
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the base title" do
      visit "/static_pages/home"
      page.should have_selector("title", :text => "#{title}")
    end

    it "should not have a custom page title" do
      visit "/static_pages/home"
      page.should_not have_selector("title", :text => "#{title} | Home")
    end

  end

  describe "Help pages" do
    it "should have content 'Help'" do
      visit "/static_pages/help"
      page.should have_content "Help"
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | Help")
    end
  end

  describe "About pages" do
    it "should have content 'About Us'" do
      visit "/static_pages/about"
      page.should have_content "About Us"
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App | About Us")
    end
  end

end
