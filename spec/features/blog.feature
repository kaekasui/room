Feature: display the blogs list and detailed blogs.

  All user display the blogs list.
  The displayed blogs up to a ceiling of 10.

  Scenario Outline: non-logged-in user display blogs list.
    Given there is non-logged-in user.
    And there are <items_count> blogs.
    When access the 'HOME' page.
    And access the 'BLOG' menu.
    And display the <page> page of blogs list.
    Then display the <blogs_count> blogs on the list.
    Examples:
      | items_count | page | blogs_count |
      | 2           | 1    | 2           |
      | 10          | 1    | 10          |
      | 12          | 1    | 10          |
      | 12          | 2    | 2           |
      | 23          | 1    | 10          |
      | 23          | 2    | 10          |
      | 23          | 3    | 3           |
   
  Scenario Outline: logged-in original user display blogs list.
    Given there is logged-in original user.
    And there are <items_count> blogs.
    When access the 'HOME' page.
    And access the 'BLOG' menu.
    And display the <page> page of blogs list.
    Then display the <blogs_count> blogs on the list.
    Examples:
      | items_count | page | blogs_count |
      | 2           | 1    | 2           |
      | 10          | 1    | 10          |
      | 12          | 1    | 10          |
      | 12          | 2    | 2           |
      | 23          | 1    | 10          |
      | 23          | 2    | 10          |
      | 23          | 3    | 3           |
 
  Scenario Outline: logged-in administrator display blogs list.
    Given there is logged-in administrator.
    And there are <items_count> blogs.
    When access the 'HOME' page.
    And access the 'BLOG' menu.
    And display the <page> page of blogs list.
    Then display the <blogs_count> blogs on the list.
    Examples:
      | items_count | page | blogs_count |
      | 2           | 1    | 2           |
      | 10          | 1    | 10          |
      | 12          | 1    | 10          |
      | 12          | 2    | 2           |
      | 23          | 1    | 10          |
      | 23          | 2    | 10          |
      | 23          | 3    | 3           |

  Scenario: non-logged-in user display the blog.
    Given there is non-logged-in user.
    And there is a blog.
    When access the 'BLOG' page.
    And access to the blog.
    Then display the blog title.
    And display the blog contents1.
    And display the blog contents2.

  Scenario: logged-in original user display the blog.
    Given there is logged-in original user.
    And there is a blog.
    When access the 'BLOG' page.
    And access to the blog.
    Then display the blog title.
    And display the blog contents1.
    And display the blog contents2.

  Scenario: logged-in administrator display the blog.
    Given there is logged-in administrator.
    And there is a blog.
    When access the 'BLOG' page.
    And access to the blog.
    Then display the blog title.
    And display the blog contents1.
    And display the blog contents2.
