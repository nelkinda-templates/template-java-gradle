package com.nelkinda.template.acceptance; // TODO change

import org.junit.platform.suite.api.IncludeEngines;
import org.junit.platform.suite.api.SelectClasspathResource;
import org.junit.platform.suite.api.Suite;

@Suite
@IncludeEngines("cucumber")
@SelectClasspathResource("features")
@SuppressWarnings("java:S2187") // false positive
public class AcceptanceTest {
}
