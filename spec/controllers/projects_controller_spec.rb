require 'spec_helper'

describe ProjectsController, "GET index" do
  before do
    Project.stub!(:all).and_return(:some_projects)
  end
  
  it "should assign @projects" do
    get :index
    assigns[:projects].should == :some_projects
  end
  
  it "should render the index template" do
    get :index
    response.should render_template(:index)
  end
end

describe ProjectsController, "GET new" do
  let(:project) { mock_model(Project) }
  
  before do
    Project.stub!(:new).and_return(project)
  end
    
  it "should assign @project" do
    get :new
    assigns[:project].should == project
  end
  
  it "should instantiate a new project" do
    Project.should_receive(:new)
    get :new
  end
  
  it "should render the new template" do
    get :new
    response.should render_template('new')
  end
end

describe ProjectsController, "GET create" do
  let(:project) { mock_model(Project, :save => nil) }
  
  before do
    Project.stub!(:new).and_return(project)
  end

  it "should assign @project" do
    post :create
    assigns[:project].should == project
  end
  
  it "should instantiate a new project with params" do
    params = {:project => {:name => "Some Name", :description => "Some Description"}}.with_indifferent_access
    Project.should_receive(:new).with(params[:project])
    post :create, params
  end
  
  it "should save the project" do
    project.should_receive(:save)
    post :create
  end
  
  context "when save is successful" do
    before do
      project.should_receive(:save).and_return(true)
    end
    
    it "should set the flash" do
      post :create
      flash[:notice].should == "Your project has been created."
    end
    
    it "should redirect to the index template" do
      post :create
      response.should redirect_to(projects_path)
    end
  end
  
  context "when save fails" do
    before do
      project.should_receive(:save).and_return(false)
    end

    it "should NOT set the flash" do
     post :create
     flash[:notice].should be_nil
    end
    
    it "should render the new template" do
      post :create
      response.should render_template(:new)
    end
  end
end

# describe ProjectsController, "DELETE destroy" do
#   let(:project) { mock_model(Project, :save => nil) }
#   
#   before do
#     Project.stub!(:find).and_return(project)
#   end
#   
#   it "should assign @project" do
#     delete :destroy
#     assigns[:project].should == project
#   end
# end
