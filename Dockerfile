# B1: Sử dụng Maven với JDK 21 để build
FROM maven:3.9.6-eclipse-temurin-21 AS build
COPY . .
RUN mvn clean package -DskipTests

# B2: Chạy file JAR với JRE 21 siêu nhẹ (Alpine)
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build /target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]