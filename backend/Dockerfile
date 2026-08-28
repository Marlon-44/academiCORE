# ─── Stage 1: Build ───
FROM maven:3.9-eclipse-temurin-21 AS builder

WORKDIR /build

# Copiar solo el pom para cachear dependencias
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copiar el resto del código y compilar
COPY src ./src
RUN mvn clean package -DskipTests -B

# ─── Stage 2: Runtime ───
FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

RUN groupadd -r academicore && useradd -r -g academicore academicore

COPY --from=builder /build/target/*.jar app.jar

RUN chown -R academicore:academicore /app

USER academicore

EXPOSE 8080

ENV JAVA_OPTS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0 -XX:+UseG1GC"

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
