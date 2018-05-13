package com.horvath.david.advanced.java.robots.config;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class ConfigurationReader {

    private final static Logger log = Logger.getLogger(ConfigurationReader.class.getName());

    public static RobotFactoryConfiguration readFile(String filename) {

        Path path = Paths.get(filename);

        if (Files.exists(path)) {
            RobotFactoryConfiguration configuration = new RobotFactoryConfiguration();

            try (Stream<String> stream = Files.lines(path)) {

                //stream.forEach(System.out::println);
                //stream.limit(1).forEach(System.out::println);
                //stream.skip(1).forEach(System.out::println);

                List<String> lines = stream.collect(Collectors.toList());

                configuration.setNumRobots(Integer.parseInt(lines.get(0)));

                configuration.setMinProducts(Arrays.asList(lines.get(1).split(" "))
                        .stream()
                        .map(Integer::parseInt)
                        .collect(Collectors.toList()));

                configuration.setMaxProducts(Arrays.asList(lines.get(2).split(" "))
                        .stream()
                        .map(Integer::parseInt)
                        .collect(Collectors.toList()));

                log.info("Configuration: " + configuration);

                return configuration;
            } catch (IOException e) {
                log.severe("Error during create configuration. " + e);
            }
        }
        return null;
    }
}
