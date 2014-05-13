# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Conferences" do
    describe "Admin" do
      describe "conferences" do
        refinery_login_with :refinery_user

        describe "conferences list" do
          before do
            FactoryGirl.create(:conference, :title => "UniqueTitleOne")
            FactoryGirl.create(:conference, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.conferences_admin_conferences_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.conferences_admin_conferences_path

            click_link "Add New Conference"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Conferences::Conference.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Conferences::Conference.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:conference, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.conferences_admin_conferences_path

              click_link "Add New Conference"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Conferences::Conference.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:conference, :title => "A title") }

          it "should succeed" do
            visit refinery.conferences_admin_conferences_path

            within ".actions" do
              click_link "Edit this conference"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:conference, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.conferences_admin_conferences_path

            click_link "Remove this conference forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Conferences::Conference.count.should == 0
          end
        end

      end
    end
  end
end
