Feature: display the top page.

  All user display the top page.

  Scenario: non-logged-in user display the top page.
    Given there is non-logged-in user.
    When access the 'HOME' page.
    Then display the introduction.
    And display the 'HOME' on the navigation bar.
    And display the 'BLOG' on the navigation bar.

  Scenario: logged-in original user display the top page.
    Given there is logged-in original user.
    When access the 'HOME' page.
    Then display the introduction.
    And display the 'HOME' on the navigation bar.
    And display the 'BLOG' on the navigation bar.

  Scenario: logged-in administrator display the top page.
    Given there is logged-in administrator.
    When access the 'HOME' page.
    Then display the introduction.
    And display the 'HOME' on the navigation bar.
    And display the 'BLOG' on the navigation bar.
