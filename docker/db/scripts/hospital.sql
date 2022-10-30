CREATE TABLE "station_personell" (
  "pers_nr" int,
  "name" varchar,
  "stat_nr" int,
  PRIMARY KEY ("pers_nr")
);

CREATE TABLE "caregiver" (
  "pers_nr" int PRIMARY KEY,
  "qualification" varchar
);

CREATE TABLE "doctor" (
  "pers_nr" int PRIMARY KEY,
  "area" varchar,
  "rank" varchar
);

CREATE TABLE "station" (
  "stat_nr" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "room" (
  "room_nr" int,
  "stat_nr" int,
  "beds" int,
  PRIMARY KEY ("room_nr", "stat_nr")
);

CREATE TABLE "patient" (
  "patient_nr" int PRIMARY KEY,
  "name" varchar,
  "disease" varchar
);

CREATE TABLE "treat" (
  "doctor_nr" int,
  "patient_nr" int,
  PRIMARY KEY ("doctor_nr", "patient_nr")
);

CREATE TABLE "admission" (
  "room_nr" int,
  "room_stat_nr" int,
  "patient_nr" int,
  "from" DATE,
  "to" DATE,
  PRIMARY KEY ("room_nr", "room_stat_nr", "patient_nr")
);

ALTER TABLE "caregiver" ADD FOREIGN KEY ("pers_nr") REFERENCES "station_personell" ("pers_nr");

ALTER TABLE "doctor" ADD FOREIGN KEY ("pers_nr") REFERENCES "station_personell" ("pers_nr");

ALTER TABLE "room" ADD FOREIGN KEY ("stat_nr") REFERENCES "station" ("stat_nr");

ALTER TABLE "treat" ADD FOREIGN KEY ("doctor_nr") REFERENCES "doctor" ("pers_nr");

ALTER TABLE "treat" ADD FOREIGN KEY ("patient_nr") REFERENCES "patient" ("patient_nr");

ALTER TABLE "admission" ADD FOREIGN KEY ("room_nr", "room_stat_nr") REFERENCES "room" ("room_nr", "stat_nr");

ALTER TABLE "admission" ADD FOREIGN KEY ("patient_nr") REFERENCES "patient" ("patient_nr");
