Feature: Users

  Scenario: List users
    When I list all "users"
    Then I should have response "OK"
    And following "users" list:
      | id                                   | lastName | firstName | birthDate  | address       | phone      | email          |
      | 635a9999-582e-49ac-b1f3-3305196ddea1 | POM      | Axel      | 2000-04-09 | 2 rue du lila | +337834929 | axel@gmail.com |
      | 5bf928f5-ab86-4dc9-b670-28935e348ad3 | HENRY    | Marc      | 2003-04-09 |    24 passage | +337832767 | marc@gmail.com |

  Scenario: Get a user
    When I get the "user" having id "5bf928f5-ab86-4dc9-b670-28935e348ad3"
    Then I should have response "OK"
    And following "user" item:
      | id                                   | lastName | firstName | birthDate  | address    | phone      | email          |
      | 5bf928f5-ab86-4dc9-b670-28935e348ad3 | HENRY    | Marc      | 2003-04-09 | 24 passage | +337832767 | marc@gmail.com |

  Scenario: Get an inexistant user
    When I get the "user" having id "f41c113f-557f-4801-be04-b038bbecf464"
    Then I should have response "NOT_FOUND"
    And following error : "User with id f41c113f-557f-4801-be04-b038bbecf464 not found"

  Scenario: Create a user
    When I create the following "user":
      | lastName | firstName | birthDate  | address                | phone      | email           |
      | TONNY    | Montana   | 1980-01-03 | 13 rue du pamplemousse | +337932732 | tonny@gmail.com |
    Then I should have response "CREATED"
    And following new "user" item:
      | lastName | firstName | birthDate  | address                | phone      | email           |
      | TONNY    | Montana   | 1980-01-03 | 13 rue du pamplemousse | +337932732 | tonny@gmail.com |

  Scenario: Update a user
    When I update the "user" having id "635a9999-582e-49ac-b1f3-3305196ddea1" with following data:
      | lastName | firstName | birthDate  | address       | phone      | email          |
      | POM      | Thierry   | 2000-04-09 | 2 rue du lila | +337834929 | axel@gmail.com |
    Then I should have response "OK"
    And following "user" item:
      | id                                   | lastName | firstName | birthDate  | address       | phone      | email          |
      | 635a9999-582e-49ac-b1f3-3305196ddea1 | POM      | Thierry   | 2000-04-09 | 2 rue du lila | +337834929 | axel@gmail.com |

  Scenario: Update an inexistant user
    When I update the "user" having id "6c6a48d7-38ba-44ea-987a-7b5fc04b13b4" with following data:
      | lastName | firstName | birthDate  | address       | phone      | email          |
      | POM      | Thierry   | 2000-04-09 | 2 rue du lila | +337834929 | axel@gmail.com |
    Then I should have response "NOT_FOUND"
    And following error : "User with id 6c6a48d7-38ba-44ea-987a-7b5fc04b13b4 not found"

  Scenario: Delete a user
    When I delete the "user" having id "5bf928f5-ab86-4dc9-b670-28935e348ad3"
    Then I should have response "OK"
    And following deleted "user" item:
      | id                                   | lastName | firstName | birthDate  | address    | phone      | email          |
      | 5bf928f5-ab86-4dc9-b670-28935e348ad3 | HENRY    | Marc      | 2003-04-09 | 24 passage | +337832767 | marc@gmail.com |

  Scenario: Get a user

  Scenario: Delete an inexistant user
    When I delete the "user" having id "6c6a48d7-38ba-44ea-987a-7b5fc04b13b4"
    Then I should have response "NOT_FOUND"
    And following error : "User with id 6c6a48d7-38ba-44ea-987a-7b5fc04b13b4 not found"
