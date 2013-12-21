Feature: display the side menu on each content.

  All user display the side menu following on the top page:
  1. the profile of administrator
  2. the menu of site.

  All user display the side menu following on the blogs page:
  1. the profile of administrator
  2. the recent blogs
  3. the recent blog comments
  4. the blog links

  Scenario: non-logged-in user display on the top page. 
    Given there is non-logged-in user.
    When access the 'HOME' page.
    Then display the 'profile' on the side menu.
    And display the 'menu' on the side menu.

  Scenario: logged-in original user display on the top page.
    Given there is logged-in original user.
    When access the 'HOME' page.
    Then display the 'profile' on the side menu.
    And display the 'menu' on the side menu.

  Scenario: logged-in administrator display on the top page.
    Given there is logged-in administrator.
    When access the 'HOME' page.
    Then display the 'profile' on the side menu.
    And display the 'menu' on the side menu.

  Scenario: non-logged-in user display on the blog page. 
    Given there is non-logged-in user.
    When access the 'BLOG' page.
    Then display the 'profile' on the side menu.
    And display the 'recent_blogs' on the side menu.
    And display the 'recent_blog_comments' on the side menu.
    And display the 'blog_links' on the side menu.
    And display the 'mail_form' on the side menu.

  Scenario: logged-in original user display on the blog page. 
    Given there is logged-in original user.
    When access the 'BLOG' page.
    Then display the 'profile' on the side menu.
    And display the 'recent_blogs' on the side menu.
    And display the 'recent_blog_comments' on the side menu.
    And display the 'blog_links' on the side menu.
    And display the 'mail_form' on the side menu.

  Scenario: logged-in administrator display on the blog page. 
    Given there is logged-in administrator.
    When access the 'BLOG' page.
    Then display the 'profile' on the side menu.
    And display the 'recent_blogs' on the side menu.
    And display the 'recent_blog_comments' on the side menu.
    And display the 'blog_links' on the side menu.
    And display the 'mail_form' on the side menu.
