Feature: display the top page.

  All user display the top page.
  Then they display the profile of administrator and menu on the side.

  Scenario: 
    Given there is non-logged-in user.
    When access the 'HOME' page.
    Then display the introduction.
    And display the 'profile' on the side menu.
    And display the 'menu' on the side menu.
    And don't display the My Account on the navigation bar.
    And display the 'HOME' on the navigation bar.
    And display the 'BLOG' on the navigation bar.
    And don't display the admin menu on the navigation bar.

  Scenario:
    Given there is logged-in user.
    When access the 'HOME' page.
    Then display the introduction.
    And display the 'profile' on the side menu.
    And display the 'menu' on the side menu.
    And display the My Account on the navigation bar.
    And display the 'HOME' on the navigation bar.
    And display the 'BLOG' on the navigation bar.
    And don't display the admin menu on the navigation bar.

  Scenario:
    Given there is logged-in administrator.
    When access the 'HOME' page.
    Then display the introduction.
    And display the 'profile' on the side menu.
    And display the 'menu' on the side menu.
    And display the My Account on the navigation bar.
    And display the 'HOME' on the navigation bar.
    And display the 'BLOG' on the navigation bar.
    And display the admin menu on the navigation bar.
