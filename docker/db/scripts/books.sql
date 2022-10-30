CREATE TABLE "reader" (
  "id" int PRIMARY KEY,
  "surname" varchar,
  "name" varchar,
  "address" varchar,
  "birth_date" DATE
);

CREATE TABLE "book" (
  "ISBN" int PRIMARY KEY,
  "author" varchar,
  "year" int,
  "pages_number" int,
  "title" varchar,
  "pub_id" int
);

CREATE TABLE "copy" (
  "id" int,
  "ISBN" int,
  "place" varchar,
  "reader_id" int,
  "date_of_return" DATE,
  PRIMARY KEY ("id", "ISBN")
);

CREATE TABLE "category" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "up_category_id" int
);

CREATE TABLE "publisher" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "address" varchar
);

ALTER TABLE "book" ADD FOREIGN KEY ("pub_id") REFERENCES "publisher" ("id");

CREATE TABLE "category_book" (
  "category_id" int,
  "book_id" int,
  PRIMARY KEY ("category_id", "book_id")
);

ALTER TABLE "category_book" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id");

ALTER TABLE "category_book" ADD FOREIGN KEY ("book_id") REFERENCES "book" ("ISBN");


ALTER TABLE "copy" ADD FOREIGN KEY ("ISBN") REFERENCES "book" ("ISBN");

ALTER TABLE "copy" ADD FOREIGN KEY ("reader_id") REFERENCES "reader" ("id");

ALTER TABLE "category" ADD FOREIGN KEY ("up_category_id") REFERENCES "category" ("id");
