---
title: Spring-Cloud(一)：Eureka注册中心
category: spring-cloud
status: push
createDate: 2019-03-15
tags:
    - spring
    - spring-cloud
keywords: spring cloud,spring-cloud
---
## 父pom配置
~~~ xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.0.0.RELEASE</version>
    </parent>

    <groupId>com.github.ermu0420</groupId>
    <artifactId>docker-example</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>pom</packaging>
    <url>https://github.com/ermu0420/docker-example</url>
    <licenses>
        <license>
            <name>Apache 2</name>
            <url>http://www.apache.org/licenses/LICENSE-2.0.txt</url>
            <distribution>repo</distribution>
            <comments>A business-friendly OSS license</comments>
        </license>
    </licenses>

    <properties>
        <docker.image.prefix>ermu0420</docker.image.prefix>
        <docker.plugin.version>0.4.13</docker.plugin.version>
        <mapper.version>3.4.0</mapper.version>
        <maven.compile.source>1.8</maven.compile.source>
        <maven.compile.target>1.8</maven.compile.target>
    </properties>

    <modules>
    <module>eureka-server</module>
    </modules>

    <dependencies>
        <!-- https://mvnrepository.com/artifact/org.projectlombok/lombok -->
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <version>1.16.14</version>
            <scope>provided</scope>
        </dependency>
    </dependencies>
    <repositories>
        <repository>
            <id>oss</id>
            <name>oss</name>
            <url>https://oss.sonatype.org/content/groups/public</url>
        </repository>
        <repository>
            <id>spring-milestones</id>
            <name>Spring Milestones</name>
            <url>https://repo.spring.io/libs-milestone</url>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
        </repository>
        <repository>
            <id>sonatype-nexus-snapshots</id>
            <name>Sonatype Nexus Snapshots</name>
            <url>https://oss.sonatype.org/content/repositories/snapshots/</url>
        </repository>
    </repositories>
    <!--依赖管理，用于管理spring-cloud的依赖，其中Camden.SR3是版本号-->
    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-dependencies</artifactId>
                <version>Finchley.M8</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            <dependency>
                <groupId>com.alibaba</groupId>
                <artifactId>fastjson</artifactId>
                <version>1.2.33</version>
            </dependency>
            <dependency>
                <groupId>com.alibaba</groupId>
                <artifactId>druid</artifactId>
                <version>1.0.11</version>
            </dependency>
        </dependencies>
    </dependencyManagement>

    <distributionManagement>
        <snapshotRepository>
            <id>ossrh</id>
            <url>https://oss.sonatype.org/content/repositories/snapshots</url>
        </snapshotRepository>
        <repository>
            <id>ossrh</id>
            <name>Maven Central Staging Repository</name>
            <url>https://oss.sonatype.org/service/local/staging/deploy/maven2/</url>
        </repository>
    </distributionManagement>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>${maven-compiler-plugin.version}</version>
                <configuration>
                    <source>${maven.compile.source}</source>
                    <target>${maven.compile.target}</target>
                    <encoding>${project.build.sourceEncoding}</encoding>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-source-plugin</artifactId>
                <version>2.4</version>
                <executions>
                    <execution>
                        <id>attach-sources</id>
                        <goals>
                            <goal>jar-no-fork</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>

            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-deploy-plugin</artifactId>
                <version>2.8.2</version>
            </plugin>
        </plugins>
    </build>
</project>
~~~

## eureka项目Pom文件
~~~ xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>com.github.ermu0420</groupId>
        <artifactId>docker-example</artifactId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <groupId>com.github.ermu0420</groupId>
    <artifactId>eureka-server</artifactId>
    <version>1.0-SNAPSHOT</version>
    <name>eureka-server</name>
    <description>Demo project for Spring Boot</description>

    <properties>
        <java.version>1.8</java.version>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-netflix-eureka-server</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter</artifactId>
        </dependency>
    </dependencies>

    <build>
        <finalName>eureka-server</finalName>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>

~~~

## application.yml 配置文件
~~~ javascript
spring:
  application:
    name: eureka-server
---
server:
  port: 8761
spring:
  profiles: peer1
eureka:
  instance:
    hostname: peer1        #Eureka实例的主机名
  client:
    serviceUrl:
      defaultZone: http://peer2:8762/eureka/,http://peer3:8763/eureka/  #Eureka节点相互注册
      register-with-eureka: true
---
server:
  port: 8762
spring:
  profiles: peer2
eureka:
  instance:
    hostname: peer2      #Eureka实例的主机名
  client:
    serviceUrl:
      defaultZone: http://peer1:8761/eureka/,http://peer3:8763/eureka/
      register-with-eureka: true
---
server:
  port: 8763
spring:
  profiles: peer3
eureka:
  instance:
    hostname: peer3    #Eureka实例的主机名
  client:
    serviceUrl:
      defaultZone: http://peer1:8761/eureka/,http://peer2:8762/eureka/
      register-with-eureka: true

~~~
## 启动类
~~~ java
package com.github.ermu.eureka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@EnableEurekaServer
@SpringBootApplication
public class EurekaServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(EurekaServerApplication.class, args);
    }

}

~~~