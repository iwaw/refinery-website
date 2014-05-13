# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "AboutItems" do
    describe "Admin" do
      describe "about_items" do
        refinery_login_with :refinery_user

        describe "about_items list" do
          before do
            FactoryGirl.create(:about_item, :title => "UniqueTitleOne")
            FactoryGirl.create(:about_item, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.about_items_admin_about_items_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.about_items_admin_about_items_path

            click_link "Add New About Item"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::AboutItems::AboutItem.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::AboutItems::AboutItem.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:about_item, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.about_items_admin_about_items_path

              click_link "Add New About Item"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::AboutItems::AboutItem.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:about_item, :title => "A title") }

          it "should succeed" do
            visit refinery.about_items_admin_about_items_path

            within ".actions" do
              click_link "Edit this about item"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:about_item, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.about_items_admin_about_items_path

            click_link "Remove this about item forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::AboutItems::AboutItem.count.should == 0
          end
        end

      end
    end
  end
end
