package com.nelkinda.template.acceptance; // TODO change

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@CucumberOptions(
        features = "src/test/resources/features",
        strict = true,
        tags = "not(@wip) and not(@future)"
)
@RunWith(Cucumber.class)
public class AcceptanceTest {
}
