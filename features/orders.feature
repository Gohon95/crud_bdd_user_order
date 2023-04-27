Feature: Orders

  Scenario: List orders
    When I list all "orders"
    Then I should have response "OK"
    And following "orders" list:
      | id                                   | orderDate  | recipeId                             | quantity | userId                               |
      | dd23a206-7312-4974-a60e-5d6082c770b6 | 2000-08-07 | 53126898-3f0d-4bda-88b1-41070cf0468d |       13 | 635a9999-582e-49ac-b1f3-3305196ddea1 |
      | 61d7c9d4-f239-42b3-ac5a-225ad5013281 | 2001-08-07 | ccf1b79a-8f2a-4e1d-9b8c-34c50716cb8e |       19 | 5bf928f5-ab86-4dc9-b670-28935e348ad3 |

  Scenario: 
    When I check if the "userId" exists in the "user" feature with id "635a9999-582e-49ac-b1f3-3305196ddea1"
      | id                                   |
      | 635a9999-582e-49ac-b1f3-3305196ddea1 |
    Then I should have response "OK"

  Scenario: Get a order
    When I get the "order" having id "61d7c9d4-f239-42b3-ac5a-225ad5013281"
    Then I should have response "OK"
    And following "order" item:
      | id                                   | orderDate  | recipeId                             | quantity | userId                               |
      | 61d7c9d4-f239-42b3-ac5a-225ad5013281 | 2001-08-07 | ccf1b79a-8f2a-4e1d-9b8c-34c50716cb8e |       19 | 5bf928f5-ab86-4dc9-b670-28935e348ad3 |

  Scenario: Get an inexistant order
    When I get the "order" having id "f2514f8b-2c0e-47d5-bfe6-34ef89bab6dc"
    Then I should have response "NOT_FOUND"
    And following error : "Order with id f2514f8b-2c0e-47d5-bfe6-34ef89bab6dc not found"

  Scenario: Create a order
    When I create the following "order":
      | orderDate  | recipeId                             | quantity | userId                               |
      | 2001-08-07 | ccf1b79a-8f2a-4e1d-9b8c-34c50716cb8e |       19 | 40a9389d-caf8-478b-b51a-2d7c9b120617 |
    Then I should have response "CREATED"
    And following new "order" item:
      | orderDate  | recipeId                             | quantity | userId                               |
      | 2001-08-07 | ccf1b79a-8f2a-4e1d-9b8c-34c50716cb8e |       19 | 40a9389d-caf8-478b-b51a-2d7c9b120617 |

  Scenario: Update a order
    When I update the "order" having id "dd23a206-7312-4974-a60e-5d6082c770b6" with following data:
      | orderDate  | recipeId                             | quantity | userId                               |
      | 2003-02-04 | 53126898-3f0d-4bda-88b1-41070cf0468d |       32 | 635a9999-582e-49ac-b1f3-3305196ddea1 |
    Then I should have response "OK"
    And following "order" item:
      | id                                   | orderDate  | recipeId                             | quantity | userId                               |
      | dd23a206-7312-4974-a60e-5d6082c770b6 | 2003-02-04 | 53126898-3f0d-4bda-88b1-41070cf0468d |       32 | 635a9999-582e-49ac-b1f3-3305196ddea1 |

  Scenario: Update an inexistant order
    When I update the "order" having id "3e2d5a20-f359-4fb5-ad46-07907e86ea94" with following data:
      | orderDate  | recipeId                             | quantity | userId                               |
      | 2005-02-04 | 53126898-3f0d-4bda-88b1-41070cf0468d |       45 | 635a9999-582e-49ac-b1f3-3305196ddea1 |
    Then I should have response "NOT_FOUND"
    And following error : "Order with id 3e2d5a20-f359-4fb5-ad46-07907e86ea94 not found"

  Scenario: Delete a order
    When I delete the "order" having id "61d7c9d4-f239-42b3-ac5a-225ad5013281"
    Then I should have response "OK"
    And following deleted "order" item:
      | id                                   | orderDate  | recipeId                             | quantity | userId                               |
      | 61d7c9d4-f239-42b3-ac5a-225ad5013281 | 2001-08-07 | ccf1b79a-8f2a-4e1d-9b8c-34c50716cb8e |       19 | 5bf928f5-ab86-4dc9-b670-28935e348ad3 |

  Scenario: Delete an inexistant order
    When I delete the "order" having id "3e2d5a20-f359-4fb5-ad46-07907e86ea94"
    Then I should have response "NOT_FOUND"
    And following error : "Order with id 3e2d5a20-f359-4fb5-ad46-07907e86ea94 not found"
