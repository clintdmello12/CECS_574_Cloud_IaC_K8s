package com.csgeeks.ecommerce.config;

//import com.zaxxer.hikari.*;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.*;
//import javax.sql.DataSource;
//
//@Configuration
//public class DatabaseConfig {
//
//  @Value("${spring.datasource.url}")
//  //@Value("postgres://bleobskvknjebh:0f375194cb9cc4f76743f959ba0e72a17a4b90592b984e4ec35d5d8908323342@ec2-107-22-245-82.compute-1.amazonaws.com:5432/d1pv0jjbf5qlbd")
//  private String dbUrl;
//
//  @Bean
//  public DataSource dataSource() {
//      HikariConfig config = new HikariConfig();
//      config.setJdbcUrl(dbUrl);
//      return new HikariDataSource(config);
//  }
//}

import com.zaxxer.hikari.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import javax.sql.DataSource;

@Configuration
public class DatabaseConfig {

  @Value("${spring.datasource.url}")
  private String dbUrl;

  @Value("${spring.datasource.username}")
  private String dbUsername;

  @Value("${spring.datasource.password}")
  private String dbPassword;

  @Bean
  public DataSource dataSource() {
      HikariConfig config = new HikariConfig();
      config.setJdbcUrl(dbUrl);
      config.setUsername(dbUsername); // Set the username
      config.setPassword(dbPassword); // Set the password
      // If using PostgreSQL, uncomment the following line
      // config.setDriverClassName("org.postgresql.Driver");
      return new HikariDataSource(config);
  }
}

