# template-java-gradle
Template for single-module Java projects at Nelkinda.

## Features
- `Makefile` as wrapper to make standard workflows as well as pipeline reproduction easier to access
- Extensive static code analysis to ensure the quality of certain aspects of structure using _CheckStyle_, _PMD_, and _SonarLint_
- Extensive dynamic code analysis to ensure the quality of behavior using _JUnit 5_, _Cucumber_, _JaCoCo_, and _Pitest_
- Tracking of analysis reports using _SonarQube_

## How to use

### GitHub Template
- Create a new repository based on this template: https://github.com/nelkinda/template-java-gradle/generate
- Open the repository in your favorite IDE, for example

<!-- TODO Replace this README -->
## Reports
The reports are available locally, after running a build using `make`
* [Checkstyle Report Main](build/reports/checkstyle/checkstyleMain/report.html)
* [Checkstyle Report Test](build/reports/checkstyle/checkstyleTest/report.html)
* [PMD Report Main](build/reports/pmd/pmdMain/report.html)
* [PMD Report Test](build/reports/pmd/pmdTest/report.html)
* [SonarLint Report Main](build/reports/sonarlint/sonarlintMain/report.html)
* [SonarLint Report Test](build/reports/sonarlint/sonarlintTest/report.html)
* [Test Report](build/reports/test/test/html/index.html)
* [Jacoco Test Coverage Report](build/reports/jacoco/test/html/index.html)
* [PiTest Mutation Test Report](build/reports/pitest/index.html)
