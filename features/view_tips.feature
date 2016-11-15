Feature: Visitors should be able to see claimed tips
  Background:
    Given a "github" project named "seldon/seldons-project" exists
    And   a developer named "yugo" exists with a emercoin address
    And   a developer named "gaal" exists without a emercoin address
    And   our fee is "0"
    And   a deposit of "500" is made
    And   the most recent commit is "AAA"
    And   a new commit "BBB" is made with parent "AAA"
    And   a new commit "CCC" is made with parent "BBB"
    And   the author of commit "BBB" is "yugo"
    And   the author of commit "CCC" is "gaal"
    When  the project syncs with the remote repo
    Then  there should be a tip of "5" for commit "BBB"
    And   there should be a tip of "4.95" for commit "CCC"
    Given I'm not signed in

  Scenario: Visitors should see all claimed tips but not unclaimed tips
    When  I visit the "tips" page
    Then  I should be on the "tips" page
    And   I should see "yugo"
    But   I should not see "gaal"

  Scenario: Visitors should see all claimed tips per project but not unclaimed tips
    When  I visit the "seldon/seldons-project github-project" page
    Then  I should be on the "seldon/seldons-project github-project" page
    And   I should see "yugo"
    But   I should not see "gaal"
    When  I visit the "seldon/seldons-project github-project tips" page
    Then  I should be on the "seldon/seldons-project github-project tips" page
    And   I should see "yugo"
    But   I should not see "gaal"

  Scenario: Visitors should see all claimed tips per user but not unclaimed tips
    When  I visit the "yugo user tips" page
    Then  I should be on the "yugo user tips" page
    And   I should see "BBB 5.00000000 Ƀ Waiting for withdrawal"
    When  I visit the "gaal user tips" page
    Then  I should be on the "users" page
    And   I should see "User not found"
    And   I should not see "BBB"
    And   I should not see "CCC"
