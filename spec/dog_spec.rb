RSpec.describe Dog do
  it "has a version number" do
    expect(Dog::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
