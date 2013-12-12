Feature: display the blog_comments list on the detailed blog page.

  All user display the blog comments posted on the blog page.
  And then, all user display the blog comment count and blog comment form.
  All user can post the comments to the blog.

  Scenario Outline: user display the blog comments list.
    Given there is non-logged-in user.
    And there is a blog.
    And there are <items_count> comments.
    When access the 'BLOG' page.
    And access to the blog.
    Then display <comments_count> comments on the blog page.
    Examples:
      | items_count | comments_count |
      | 1           | 1              |
      | 2           | 2              |
      | 5           | 5              |

  Scenario: user display the blog comment form.
    Given there is non-logged-in user.
    And there is a blog.
    When access the 'BLOG' page.
    And access to the blog.
    Then display the blog comment form.

  Scenario: user post the blog comment.
    Given there is non-logged-in user.
    And there is a blog.
    When access the 'BLOG' page.
    And access to the blog.
    And fill in item to the text field 'title' .
    And fill in item to the text field 'author' .
    And fill in item to the text field 'content' .
    And click the button 'create' .
    Then post the blog comment.
    And display a blog comment.

  Scenario: user post the blog comment.
    Given there is non-logged-in user.
    And there is a blog.
    When access the 'BLOG' page.
    And access to the blog.
    And fill in item to the text field 'title' .
    And fill in item to the text field 'content' .
    And click the button 'create' .
    Then don't post the blog comment.
    And don't display a blog comment.
