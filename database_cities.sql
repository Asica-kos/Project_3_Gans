-- Create the database
CREATE DATABASE database_cities;

-- Use the database
USE database_cities;

CREATE TABLE cities_stable (
    city_id INT AUTO_INCREMENT, -- Automatically generated ID for each city
    city VARCHAR(40) NOT NULL, -- Name of the city
    country VARCHAR(40),
    latitude FLOAT,
    longitude FLOAT, 
    PRIMARY KEY (city_id) -- Primary key to uniquely identify each city
);
select* from cities_stable;

CREATE TABLE cities_unstable (
    metro_pop INT,
    city_area FLOAT,
    collected DATE, -- Year the data was collected/saved
	city_id INT,
    FOREIGN KEY (city_id) REFERENCES cities_stable(city_id) -- Foreign key to connect tables
);

select * from cities_unstable;


CREATE TABLE weather_info (
	weather_id INT AUTO_INCREMENT,
    temp_min FLOAT,
	temp_max FLOAT,
    feels_like FLOAT,
    humidity INT,
    pressure INT,
    main VARCHAR(40),
    speed FLOAT,
    visibility INT,
    rain FLOAT,
    `time` DATE,
    city_id INT,
    PRIMARY KEY (weather_id),
    FOREIGN KEY (city_id) REFERENCES cities_stable(city_id)
);    

select * from weather_info;

CREATE TABLE cities_add_info (
	Catholics_pop FLOAT,
    Protestants_pop FLOAT,
    Muslims_pop FLOAT,
	Non_religious_pop FLOAT,
    Turks_pop INT,
	Polish_pop INT,
    Italians_pop INT,
    collected DATE,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES cities_stable(city_id)
);
select * from cities_add_info;


CREATE TABLE cities_airports (
    icao CHAR(4),
    a_name VARCHAR(40),
    city_id INT, 
    PRIMARY KEY (icao),
    FOREIGN KEY (city_id) REFERENCES cities_stable(city_id)
);

select * from cities_airports ;

 CREATE TABLE flights (
	flight_id INT AUTO_INCREMENT,
    arrival_icao CHAR(4),
    departing VARCHAR(255),
    departure_icao VARCHAR(255),
    arrival_time DATE,
    model VARCHAR(255),
    flight_num VARCHAR(255),
	PRIMARY KEY (flight_id),
    FOREIGN KEY (arrival_icao) REFERENCES cities_airports(icao)
);
select * from flights ;

