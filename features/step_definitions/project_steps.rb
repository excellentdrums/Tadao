Given /^I have no projects$/ do
  Project.delete_all
end

Given /^I have a project named "([^\"]*)"$/ do |project_name|
  Project.create! :name => project_name
end