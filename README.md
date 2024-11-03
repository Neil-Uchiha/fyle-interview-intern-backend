# Fyle Backend Challenge

## Overview
This project is containerized using Docker, making it easier to set up and run in a consistent environment. Below are instructions on how to build, run, reset the database, and test the application.

## Prerequisites
- Install [Docker](https://docs.docker.com/get-docker/)
- Install [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

### Steps to Run the Application

1. Clone the repository:
```
git clone https://github.com/Neil-Uchiha/fyle-interview-intern-backend.git
```

2. Build and start the containers:
```
docker-compose up --build
```

3. Reset the database (run these commands in a separate terminal window):
```
docker-compose exec web rm core/store.sqlite3
docker-compose exec web flask db upgrade -d core/migrations/
```

4. To run the test suite:
```
docker-compose run test  
```

5. To generate a coverage report:
```
docker-compose run test pytest --cov
```

### Additional Notes

- The application will be available at `http://localhost:5000` once started.
- You may need to adjust port mappings in the `docker-compose.yml` file if conflicts occur.
- Ensure you have sufficient permissions to run Docker commands on your system.
- If you face any issues with run.sh, it might need EOL conversion, use unix2dos if on linux, or convert LF to CRLF from bottom right of VS-Code