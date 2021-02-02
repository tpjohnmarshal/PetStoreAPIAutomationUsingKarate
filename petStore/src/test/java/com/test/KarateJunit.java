package com.test;

import static org.junit.Assert.assertTrue;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Collection;

import org.apache.commons.io.FileUtils;
import org.junit.Test;

import com.intuit.karate.cucumber.CucumberRunner;
import com.intuit.karate.cucumber.KarateStats;

import cucumber.api.CucumberOptions;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

@CucumberOptions(features = "src/test/resources")
public class KarateJunit {
	@Test
	public void testParallel() throws Exception{
		String karateOutputPath = "target/surefire-reports";
		KarateStats stats = CucumberRunner.parallel(getClass(), 5, karateOutputPath);
		generateReport(karateOutputPath);
		assertTrue("There are scenario Failures", stats.getFailCount() == 0);
	}
	
	private static void generateReport(String karateOutputPath){
		Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
		List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
		jsonFiles.removeIf(file->file.length()==0);
		jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
		Configuration config = new Configuration(new File("target"), "Pet Store");
		ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
		reportBuilder.generateReports();
	}

}
