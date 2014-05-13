# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Workshops" do
    describe "Admin" do
      describe "workshops" do
        refinery_login_with :refinery_user

        describe "workshops list" do
          before do
            FactoryGirl.create(:workshop, :title => "UniqueTitleOne")
            FactoryGirl.create(:workshop, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.workshops_admin_workshops_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.workshops_admin_workshops_path

            click_link "Add New Workshop"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Workshops::Workshop.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Workshops::Workshop.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:workshop, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.workshops_admin_workshops_path

              click_link "Add New Workshop"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Workshops::Workshop.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:workshop, :title => "A title") }

          it "should succeed" do
            visit refinery.workshops_admin_workshops_path

            within ".actions" do
              click_link "Edit this workshop"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:workshop, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.workshops_admin_workshops_path

            click_link "Remove this workshop forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Workshops::Workshop.count.should == 0
          end
        end

      end
    end
  end
end
