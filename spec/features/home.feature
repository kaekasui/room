Feature: display the top page.

  All user display the top page.

  Scenario: non-logged-in user display the top page.
    Given there is non-logged-in user.
    When access the 'HOME' page.
    Then display the introduction.
    And don't display the My Account on the navigation bar.
    And display the 'HOME' on the navigation bar.
    And display the 'BLOG' on the navigation bar.
    And don't display the admin menu on the navigation bar.

  Scenario: logged-in user display the top page.
    Given there is logged-in user.
    When access the 'HOME' page.
    Then display the introduction.
    And display the My Account on the navigation bar.
    And display the 'HOME' on the navigation bar.
    And display the 'BLOG' on the navigation bar.
    And don't display the admin menu on the navigation bar.

  Scenario: logged-in administrator display the top page.
    Given there is logged-in administrator.
    When access the 'HOME' page.
    Then display the introduction.
    And display the My Account on the navigation bar.
    And display the 'HOME' on the navigation bar.
    And display the 'BLOG' on the navigation bar.
    And display the admin menu on the navigation bar.
