Feature: display the home page

  All user display the home page.
  Then they display the profile of administrator and site menu on the side.

  Scenario: 
    Given there is non-logged-in user.
    When access the top page.
    Then display the top page.
