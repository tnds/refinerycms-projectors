# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Projectors" do
    describe "Admin" do
      describe "projectors" do
        login_refinery_user

        describe "projectors list" do
          before do
            FactoryGirl.create(:projector, :name => "UniqueTitleOne")
            FactoryGirl.create(:projector, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.projectors_admin_projectors_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.projectors_admin_projectors_path

            click_link "Add New Projector"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Projectors::Projector.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Projectors::Projector.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:projector, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.projectors_admin_projectors_path

              click_link "Add New Projector"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Projectors::Projector.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:projector, :name => "A name") }

          it "should succeed" do
            visit refinery.projectors_admin_projectors_path

            within ".actions" do
              click_link "Edit this projector"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:projector, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.projectors_admin_projectors_path

            click_link "Remove this projector forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Projectors::Projector.count.should == 0
          end
        end

      end
    end
  end
end
