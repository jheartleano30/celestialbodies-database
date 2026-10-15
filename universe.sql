BEGIN;

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(80) NOT NULL UNIQUE,
  galaxy_type TEXT NOT NULL,
  age_in_millions_of_years NUMERIC NOT NULL,
  has_life BOOLEAN NOT NULL
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(80) NOT NULL UNIQUE,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  spectral_type VARCHAR(20) NOT NULL,
  mass_in_solar_masses NUMERIC NOT NULL,
  is_spherical BOOLEAN NOT NULL,
  planets_discovered INT NOT NULL
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(80) NOT NULL UNIQUE,
  star_id INT NOT NULL REFERENCES star(star_id),
  planet_type TEXT NOT NULL,
  age_in_millions_of_years NUMERIC NOT NULL,
  has_life BOOLEAN NOT NULL,
  moon_count INT NOT NULL
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(80) NOT NULL UNIQUE,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  diameter_in_km NUMERIC NOT NULL,
  has_atmosphere BOOLEAN NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE dwarf_planet (
  dwarf_planet_id SERIAL PRIMARY KEY,
  name VARCHAR(80) NOT NULL UNIQUE,
  star_id INT NOT NULL REFERENCES star(star_id),
  mean_radius_in_km NUMERIC NOT NULL,
  is_spherical BOOLEAN NOT NULL
);

INSERT INTO galaxy (name, galaxy_type, age_in_millions_of_years, has_life) VALUES
  ('Milky Way', 'barred spiral', 13600, TRUE),
  ('Andromeda', 'barred spiral', 10000, FALSE),
  ('Triangulum', 'spiral', 12000, FALSE),
  ('Large Magellanic Cloud', 'irregular', 13000, FALSE),
  ('Small Magellanic Cloud', 'irregular', 12000, FALSE),
  ('Whirlpool', 'grand design spiral', 13000, FALSE);

INSERT INTO star (name, galaxy_id, spectral_type, mass_in_solar_masses, is_spherical, planets_discovered) VALUES
  ('Sun', 1, 'G2V', 1.00, TRUE, 8),
  ('Sirius A', 1, 'A1V', 2.06, TRUE, 1),
  ('Proxima Centauri', 1, 'M5.5Ve', 0.12, TRUE, 1),
  ('Rigil Kentaurus', 1, 'G2V', 1.10, TRUE, 1),
  ('Betelgeuse', 1, 'M1-M2Ia', 16.50, TRUE, 0),
  ('Vega', 1, 'A0V', 2.14, TRUE, 1);

INSERT INTO planet (name, star_id, planet_type, age_in_millions_of_years, has_life, moon_count) VALUES
  ('Mercury', 1, 'terrestrial', 4500, FALSE, 0),
  ('Venus', 1, 'terrestrial', 4500, FALSE, 0),
  ('Earth', 1, 'terrestrial', 4540, TRUE, 1),
  ('Mars', 1, 'terrestrial', 4600, FALSE, 2),
  ('Jupiter', 1, 'gas giant', 4600, FALSE, 95),
  ('Saturn', 1, 'gas giant', 4500, FALSE, 146),
  ('Uranus', 1, 'ice giant', 4500, FALSE, 28),
  ('Neptune', 1, 'ice giant', 4500, FALSE, 16),
  ('Sirius b I', 2, 'rocky exoplanet', 200, FALSE, 0),
  ('Proxima b', 3, 'super-Earth', 4850, FALSE, 0),
  ('Alpha Centauri Bb', 4, 'terrestrial', 5000, FALSE, 0),
  ('Vega b', 6, 'gas giant', 455, FALSE, 0);

INSERT INTO moon (name, planet_id, diameter_in_km, has_atmosphere, description) VALUES
  ('Moon', 3, 3474.8, FALSE, 'Earth natural satellite'),
  ('Phobos', 4, 22.5, FALSE, 'Inner moon of Mars'),
  ('Deimos', 4, 12.4, FALSE, 'Outer moon of Mars'),
  ('Io', 5, 3643.2, FALSE, 'Volcanically active moon of Jupiter'),
  ('Europa', 5, 3121.6, FALSE, 'Icy moon of Jupiter'),
  ('Ganymede', 5, 5268.2, FALSE, 'Largest moon in the solar system'),
  ('Callisto', 5, 4820.6, FALSE, 'Heavily cratered moon of Jupiter'),
  ('Amalthea', 5, 167.0, FALSE, 'Small inner moon of Jupiter'),
  ('Himalia', 5, 139.6, FALSE, 'Irregular moon of Jupiter'),
  ('Elara', 5, 79.9, FALSE, 'Outer moon of Jupiter'),
  ('Mimas', 6, 396.4, FALSE, 'Small icy moon of Saturn'),
  ('Enceladus', 6, 504.2, FALSE, 'Icy moon with subsurface ocean'),
  ('Tethys', 6, 1062.0, FALSE, 'Icy moon of Saturn'),
  ('Dione', 6, 1122.8, FALSE, 'Icy moon of Saturn'),
  ('Rhea', 6, 1527.6, FALSE, 'Second-largest moon of Saturn'),
  ('Titan', 6, 5149.5, TRUE, 'Moon with a dense nitrogen atmosphere'),
  ('Iapetus', 6, 1469.0, FALSE, 'Two-toned moon of Saturn'),
  ('Miranda', 7, 471.6, FALSE, 'Small moon of Uranus'),
  ('Ariel', 7, 1157.8, FALSE, 'Bright moon of Uranus'),
  ('Triton', 8, 2706.8, FALSE, 'Large retrograde moon of Neptune');

INSERT INTO dwarf_planet (name, star_id, mean_radius_in_km, is_spherical) VALUES
  ('Ceres', 1, 469.7, TRUE),
  ('Pluto', 1, 1188.3, TRUE),
  ('Eris', 1, 1163.0, TRUE);

COMMIT;
