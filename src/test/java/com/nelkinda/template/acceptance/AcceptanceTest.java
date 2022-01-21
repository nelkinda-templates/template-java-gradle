package com.nelkinda.template.acceptance; // TODO change

import org.junit.platform.suite.api.ConfigurationParameter;
import org.junit.platform.suite.api.ConfigurationParameters;
import org.junit.platform.suite.api.IncludeEngines;
import org.junit.platform.suite.api.SelectClasspathResource;
import org.junit.platform.suite.api.Suite;

import static io.cucumber.junit.platform.engine.Constants.FILTER_TAGS_PROPERTY_NAME;

@Suite
@IncludeEngines("cucumber")
@SelectClasspathResource("features")
@ConfigurationParameters({
        @ConfigurationParameter(
                key = FILTER_TAGS_PROPERTY_NAME,
                value = "not(@wip) and not(@future)"
        ),
})
@SuppressWarnings("java:S2187") // false positive
public class AcceptanceTest {
}
