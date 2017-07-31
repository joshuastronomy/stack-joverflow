require "rails_helper"

describe QuestsController do
  it "Makes a new quest" do
    expect(Quest.new(title: "title",
                      body: "body")).to be_valid
  end
end
