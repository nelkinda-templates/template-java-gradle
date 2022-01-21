@future
#noinspection CucumberUndefinedStep
Feature: Skip a feature or scenario that is future
  Scenario: Future work is not executed
    Given a feature tagged @future
    When running the acceptance tests
    Then the feature or scenario is not executed
