﻿/**************************************************************
*  RUT-SOM-DATA-PT-06-2020-U-C                   Douglas High *
*   >SETL-Challenge                           August 31, 2020 *
*                    TABLE DEFINITION SQL                     *
*  M1 10/2020 - added habit_code and solar_flux to planets.   *
*  M2 10/2020 - added habzone and temp_class to planets.      *
*             - added type to planets.                        *
*  M3 10/2020 - added further_interest table                  *
***************************************************************
*/
-- **  drop all tables  **--
DROP TABLE IF EXISTS planets, stars, facilities, column_document, glossary, further_interest;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/z6TnK8
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "planets" (
    "name" varchar(50)   NOT NULL,
    "host_star" varchar(50)   NOT NULL,
    "ltr" char(1)   NULL,
    "disc_year" date   NOT NULL,
    "orb_period_ed" float   NULL,
    "radius_e" float   NULL,
    "circumference_k" int   NOT NULL,
    "circumference_m" int   NOT NULL,
    "mass_e" float   NULL,
    "density_e" float   NULL,
    "solar_flux" float   NULL,
    "habit_code" int   NOT NULL,
    "habzone" int   NULL,
    "temp_c" int   NULL,
    "temp_f" int   NULL,
    "temp_class" varchar(10)   NULL,
    "planet_class" varchar(25)   NULL,
    "disc_facility" varchar(100)   NOT NULL,
    "disc_method" varchar(50)   NOT NULL,
    CONSTRAINT "pk_planets" PRIMARY KEY (
        "name"
     )
);

CREATE TABLE "stars" (
    "star" varchar(50)   NOT NULL,
    "type" varchar(20)   NULL,
    "temp_k" float   NULL,
    "radius_s" float   NULL,
    "mass_s" float   NULL,
    "bright" float   NULL,
    "gravity" float   NULL,
    "age" float   NULL,
    "density" float   NULL,
    "gal_lat" float   NULL,
    "gal_long" float   NULL,
    "distance" float   NULL,
    "num_stars" int   NOT NULL,
    "num_planets" int   NOT NULL,
    "num_moons" int   NOT NULL,
    CONSTRAINT "pk_stars" PRIMARY KEY (
        "star"
     )
);

CREATE TABLE "facilities" (
    "name" varchar(100)   NOT NULL,
    "type" varchar(20)   NOT NULL,
    "location" varchar(100)   NULL,
    "latitude" float   NULL,
    "longitude" float   NULL,
    CONSTRAINT "pk_facilities" PRIMARY KEY (
        "name"
     )
);

CREATE TABLE "column_document" (
    "column_name" varchar(50)   NOT NULL,
    "short_desc" varchar(50)   NOT NULL,
    "long_desc" varchar(200)   NULL
);

CREATE TABLE "glossary" (
    "name" varchar(50)   NOT NULL,
    "abbr" varchar(10)   NULL,
    "value" varchar(50)   NULL,
    "description" varchar(200)   NOT NULL,
    "more_info" varchar(200)   NULL
);

CREATE TABLE "further_interest" (
    "Cat" char(1)   NULL,
    "Name" varchar(100)   NOT NULL,
    "Duration" varchar(10)   NULL,
    "Description" varchar(250)   NULL,
    "Link" varchar(200)   NULL
);

ALTER TABLE "planets" ADD CONSTRAINT "fk_planets_host_star" FOREIGN KEY("host_star")
REFERENCES "stars" ("star");

ALTER TABLE "planets" ADD CONSTRAINT "fk_planets_disc_facility" FOREIGN KEY("disc_facility")
REFERENCES "facilities" ("name");