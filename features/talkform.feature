Feature: Talk submission form
  This feature will describe the Talk submission form. 

  Scenario: Potential speaker registers his talk
    Given my name is Creil Naven and my email is creil.naven@awayday.com
    And my talk proposal has the following information
    | Title   | Summary                                             | Category | Duration | Languages             |
    | My Talk | My talk about talks that need a big enough summary! | SIP      | 45mins   | English, Portuguese   |
    When I submit my talk proposal
    Then I will be in the list of possible presenters
    And my talk proposal will be on the list of proposals
    And I will see a confirmation that my proposal has been submitted

  Scenario: Potential speaker registers his Lightning Talk
    Given my name is Carlo Paroli and my email is carlo.paroli@awayday.com
    And my lightning talk proposal has the following information
    | Title             | Summary                                                     | Category  | Duration | Languages             |
    | My Lightning Talk | My Lightning Talk about babies that needs to explain enough | Technical | 15mins   | English, Portuguese   |
    When I submit my lightning talk proposal
    Then I will be in the list of possible presenters
    And my lightning talk proposal will be on the list of proposals
    And I will see a confirmation that my proposal has been submitted

  Scenario: Potential speaker try to register with short summary
    Given my name is Carlo Paroli and my email is carlo.paroli@awayday.com
    And my lightning talk proposal has the following information
    | Title             | Summary                         | Category  | Duration | Languages             |
    | My Lightning Talk | My really quick lightning talk  | Technical | 15mins   | English, Portuguese   |
    When I submit my lightning talk proposal
    Then I wont be in the list of possible presenters
    And my lightning talk proposal wont be on the list of proposals
    And I will see a message stating that something went wrong
    And a message saying that the summary is too short

  Scenario: Potential speaker forget his name
    Given my name is  and my email is carlo.paroli@awayday.com
    And my lightning talk proposal has the following information
    | Title             | Summary                                                       | Category  | Duration | Languages             |
    | My Lightning Talk | My lightning talk about talks that need a big enough summary! | Technical | 15mins   | English, Portuguese   |
    When I submit my lightning talk proposal
    Then I wont be in the list of possible presenters
    And my lightning talk proposal wont be on the list of proposals
    And I will see a message stating that something went wrong
    And a message saying that I forgot my name

  Scenario: Potential speaker forget his name and the title of the presentation
    Given my name is  and my email is carlo.paroli@awayday.com
    And my lightning talk proposal has the following information
    | Title       | Summary                                             | Category  | Duration | Languages             |
    |             | My talk about talks that need a big enough summary! | Technical | 15mins   | English, Portuguese   |
    When I submit my lightning talk proposal
    Then I wont be in the list of possible presenters
    And my lightning talk proposal wont be on the list of proposals
    And I will see a message stating that something went wrong
    And a message saying that I forgot my name
    And a message saying that I forgot the title of the talk

  Scenario Outline: A presenter can choose between some defined categories
    Given my name is John Presentation and my email is john.presentation@awayday.com
    And my talk proposal has the following information
    | Title     | Summary                                                    | Category   | Duration | Languages             |
    | The Title | The Summary for the example need to have at least 50 chars | <category> | 45mins   | English, Portuguese   |
    When I submit my talk proposal
    Then I will be in the list of possible presenters
    And my talk proposal will be on the list of proposals
    And I will see a confirmation that my proposal has been submitted

    Examples:
    | category                      |
    | SIP                           |
    | Technical                     |
    | Non-Technical                 |
    | Entrepreuneurial              |
    | Life Skills                   |
    | Nothing to do with Technology |
    | Health and Well Being         |
    | Hobbies                       |
