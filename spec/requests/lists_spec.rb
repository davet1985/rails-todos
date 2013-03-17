require 'spec_helper'

describe "Lists" do

	before do
		@list = List.create :title => "Test List", :description => 'Test description'
	end

#	after do
#		List.remove
#	end
	
  describe "GET /lists" do

    it "creates a new list" do
    	visit new_list_path
    	fill_in 'Title', :with => 'New List'
    	fill_in 'Description', :with => 'New Description'
    	click_button 'Create List'
    	current_path.should == lists_path
    	page.should have_content 'New List'
    	#remove all lists from the db
    	List.remove
    	# use launcy to show the resulting page
    	#save_and_open_page
   	end

    it "displays lists" do
    	visit lists_path
      page.should have_content 'Test List'
    end

  end

  describe "PUT /lists" do

  	it "updates a list" do
  		visit lists_path
  		click_link 'Edit'
  		#current_path.should == edit_list_path(@list)
  		#save_and_open_page
  		find_field('Title').value.should == 'Test List'
  		fill_in 'Title', :with => 'Test List Updated'
  		click_button 'Update List'
  		#current_path.should == list_path(@list)
  		page.should have_content 'Test List Updated'
  	end

  end

end
