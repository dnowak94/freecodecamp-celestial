DROP TABLE IF EXISTS galaxy CASCADE;
DROP TABLE IF EXISTS star CASCADE;
DROP TABLE IF EXISTS planet CASCADE;
DROP TABLE IF EXISTS moon CASCADE;
DROP TABLE IF EXISTS planet_types CASCADE;

CREATE TABLE IF NOT EXISTS galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL,
  description TEXT,
  name_origin TEXT,
  age_in_millions_of_years NUMERIC
);


CREATE TABLE IF NOT EXISTS star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL,
  is_spherical BOOLEAN,
  description TEXT,
  galaxy_id integer REFERENCES galaxy (galaxy_id)
);

CREATE TABLE IF NOT EXISTS planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL,
  has_life BOOLEAN,
  distance_from_sun NUMERIC,
  surface_temperature INT,
  star_id integer REFERENCES star (star_id)
);

CREATE TABLE IF NOT EXISTS moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL,
  description TEXT DEFAULT '',
  designation VARCHAR DEFAULT '',
  discovery_year INT,
  planet_id integer REFERENCES planet (planet_id)
);

CREATE TABLE IF NOT EXISTS planet_type (
  planet_type_id SERIAL PRIMARY KEY,
  name VARCHAR UNIQUE NOT NULL,
  description TEXT
);

INSERT INTO galaxy (galaxy_id,name, age_in_millions_of_years, description,name_origin) VALUES
(1,'Milky Way', 0,'',''),
(2,'Canis Major Dwarf', 0.025,'',''),
(3,'Virgo Stellar Stream', 0.030,'',''),
(4,'Sagittarius Dwarf Spheroidal', 0.081,'', ''),
(5,'Large Magellanic Cloud', 0.163, '',''),
(6,'Small Magellanic Cloud', 0.197,'','');


INSERT INTO star (name, galaxy_id, is_spherical, description) VALUES
('Absolutno', 1, false,''),
('Acamar', 2,false,''),
('Achernar', 3,false,''),
('Archird',4,false, ''),
('Acrab', 5, false,''),
('Acrux',6, false, '');

INSERT INTO planet (name, has_life, distance_from_sun, surface_temperature, star_id) VALUES
('Mercury', false, 0.38709893, 440, 1),
('Venus', false, 0.72333199,730, 2),
('Earth', false, 1.00000011,287, 3),
('Mars',  false, 1.52366231,227 ,4),
('Jupiter', false, 5.20336301,152, 5),
('Saturn',  false, 5.20336301,134 ,5),
('Uranus',  false, 5.20336301,76, 5),
('Neptune', false, 5.20336301,73, 5),
('Ceres', false, 5.20336301,167, 5),
('Pluto', false, 5.20336301,40, 5),
('Haumea', false, 5.20336301,50, 5),
('Makemake', false, 5.20336301,30, 5),
('Eris', false, 5.20336301,30, 5);

INSERT INTO moon (name, planet_id, discovery_year) VALUES 
('Luna', 3, NULL),
('Delmos',4,1877),
('Phobos', 4,1877),
('Adrastea', 5,1979),
('Aitne', 5,2001),
('Amathea', 5,1892),
('Ananke', 5,1951),
('Aoede', 5,2003),
('Arche', 5,2002),
('Autonoe', 5,2001),
('Callisto', 5,1610),
('Carme', 5,1938),
('Callirhoe', 5,2000),
('Carpo', 5,2003),
('Chaldene', 5,2000),
('Cyllene', 5,2003),
('Elara', 5,1905),
('Erinome', 5,2000),
('Euanthe', 5,2001),
('Eukelade', 5, 2003);

INSERT INTO planet_type (name, description) VALUES
('Super-Jupiter',''),
('Giant',''),
('Super-Neptune','');
