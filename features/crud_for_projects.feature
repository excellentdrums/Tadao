@focus
Feature: Crud for projects
  In order to provide a mechanism that allows users to manage their projects
  As a project manager
  I want a UI that allows me to create, read, update, and delete projects
  
  Scenario: Story #1 - create a project
    Given I have no projects
    When I go to the new project page
    And I fill in the following:
      | Name        | Tadao                                                               |
      | Description | An awesome todo list application built by even awesomer job seekers |
    And I press "Create"
    Then I should be on the projects page
    And I should see "Tadao"
    And I should see "An awesome todo list application built by even awesomer job seekers"
    And I should see "Your project has been created."
    
  Scenario: Story #1 - delete a project
    Given I have a project named "Tadao"
    When I go to the projects page
    And I follow "Delete" within "#tadao"
    Then I should be on the projects page 
    And I should see "Your project has been deleted"
    And I should not see "Tadao"
  
  
  