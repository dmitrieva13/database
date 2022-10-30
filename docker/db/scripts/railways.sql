CREATE TABLE "train" (
  "train_nr" int PRIMARY KEY,
  "length" int,
  "start_station_name" varchar,
  "end_station_name" varchar
);

CREATE TABLE "station" (
  "name" varchar PRIMARY KEY,
  "tracks" int
);

CREATE TABLE "city" (
  "name" varchar,
  "region" varchar,
  PRIMARY KEY ("name", "region")
);

CREATE TABLE "connected" (
  "train_nr" int PRIMARY KEY,
  "station_name" varchar,
  "arrival" DATE,
  "departure" DATE
);

CREATE TABLE "lie_in" (
  "station_name" varchar,
  "city_name" varchar,
  "city_region" varchar,
  PRIMARY KEY ("station_name", "city_name", "city_region")
);

ALTER TABLE "train" ADD FOREIGN KEY ("start_station_name") REFERENCES "station" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("end_station_name") REFERENCES "station" ("name");

ALTER TABLE "connected" ADD FOREIGN KEY ("train_nr") REFERENCES "train" ("train_nr");

ALTER TABLE "connected" ADD FOREIGN KEY ("station_name") REFERENCES "station" ("name");

ALTER TABLE "lie_in" ADD FOREIGN KEY ("station_name") REFERENCES "station" ("name");

ALTER TABLE "lie_in" ADD FOREIGN KEY ("city_name", "city_region") REFERENCES "city" ("name", "region");