require 'spec_helper'

describe Project do
  before do
    @project = Project.new
  end
  
  it "should get and set a name" do
    @project.name = "Tadao"
    @project.name.should == "Tadao"
  end
  
  it "should get and set a description" do
    @project.description = "Some description"
    @project.description.should == "Some description"
  end
end