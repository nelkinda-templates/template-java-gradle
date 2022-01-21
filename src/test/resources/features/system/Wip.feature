@wip
#noinspection CucumberUndefinedStep
Feature: Skip a feature or scenario that is work in progress
  Scenario: Work in Progress is not executed
    Given a feature tagged @wip
    When running the acceptance tests
    Then the feature or scenario is not executed
