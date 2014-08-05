require 'spec_helper'

describe ApplicationHelper do
  # tests the full_title helper method (builds titles)
  describe "full_title" do
    it "should include the page title" do
      expect(full_title("foo")).to match(/foo/)
    end

    it "should include the base title" do
      expect(full_title("foo")).to match(/^RoR Tutorial/)
    end

    it "should not include a bar for the home page" do
      expect(full_title("")).not_to match(/\|/)
    end
  end
end

