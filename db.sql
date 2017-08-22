CREATE TABLE "company" (
"id"  SERIAL ,
"name" TEXT NOT NULL ,
"open_date" INTEGER NOT NULL ,
"close_date" INTEGER NOT NULL ,
"id_whisky_people" INTEGER ,
"id_country" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "brand" (
"id"  SERIAL ,
"name" VARCHAR NOT NULL ,
"open_date" INTEGER NOT NULL ,
"close_date" INTEGER NOT NULL ,
"id_company" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "distillery" (
"id"  SERIAL ,
"address" TEXT NOT NULL ,
"latitude" DOUBLE PRECISION NOT NULL ,
"longitude" DOUBLE PRECISION NOT NULL ,
"open_date" INTEGER NOT NULL ,
"close_date" INTEGER NOT NULL ,
"id_whisky_people" INTEGER ,
"id_company" INTEGER ,
"id_country" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "cask_types" (
"id"  SERIAL ,
"type" TEXT NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "cask_size" (
"id"  SERIAL ,
"denomination" TEXT NOT NULL ,
"capacity" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "cask_origin" (
"id"  SERIAL ,
"country" TEXT NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "bottle" (
"id"  SERIAL ,
"name" TEXT NOT NULL ,
"age" INTEGER NOT NULL ,
"vintage" INTEGER NOT NULL ,
"cask_number" INTEGER NOT NULL ,
"alcohol_volume" DECIMAL NOT NULL ,
"is_collector" INTEGER NOT NULL ,
"total_bottle_count" INTEGER NOT NULL ,
"id_brand" INTEGER ,
"id_distillery" INTEGER ,
"id_cask_types" INTEGER ,
"id_cask_origin" INTEGER ,
"id_cask_size" INTEGER ,
"id_grain_type" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "whisky_people" (
"id"  SERIAL ,
"name" TEXT NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "people" (
"id"  SERIAL ,
"name" TEXT NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "review" (
"id"  SERIAL ,
"note" DECIMAL NOT NULL ,
"date" INTEGER NOT NULL ,
"id_place" INTEGER ,
"id_bottle" INTEGER ,
"id_people" INTEGER ,
"content" TEXT NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "place" (
"id"  SERIAL ,
"name" TEXT NOT NULL ,
"id_place_type" INTEGER ,
PRIMARY KEY ("id")
);

CREATE TABLE "place_type" (
"id"  SERIAL ,
"name" VARCHAR NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "grain_type" (
"id"  SERIAL ,
"name" TEXT NOT NULL ,
PRIMARY KEY ("id")
);
COMMENT ON TABLE "grain_type" IS 'Single Malt & co.';

CREATE TABLE "country" (
"id"  SERIAL ,
"name" TEXT NOT NULL ,
PRIMARY KEY ("id")
);

CREATE TABLE "star_field" (
"id"  SERIAL ,
"name" TEXT ,
PRIMARY KEY ("id")
);

CREATE TABLE "field_level" (
"id"  SERIAL ,
"level" DECIMAL NOT NULL ,
"id_star_field" INTEGER ,
"id_review" INTEGER ,
PRIMARY KEY ("id")
);

ALTER TABLE "company" ADD FOREIGN KEY ("id_whisky_people") REFERENCES "whisky_people" ("id");
ALTER TABLE "company" ADD FOREIGN KEY ("id_country") REFERENCES "country" ("id");
ALTER TABLE "brand" ADD FOREIGN KEY ("id_company") REFERENCES "company" ("id");
ALTER TABLE "distillery" ADD FOREIGN KEY ("id_whisky_people") REFERENCES "whisky_people" ("id");
ALTER TABLE "distillery" ADD FOREIGN KEY ("id_company") REFERENCES "company" ("id");
ALTER TABLE "distillery" ADD FOREIGN KEY ("id_country") REFERENCES "country" ("id");
ALTER TABLE "bottle" ADD FOREIGN KEY ("id_brand") REFERENCES "brand" ("id");
ALTER TABLE "bottle" ADD FOREIGN KEY ("id_distillery") REFERENCES "distillery" ("id");
ALTER TABLE "bottle" ADD FOREIGN KEY ("id_cask_types") REFERENCES "cask_types" ("id");
ALTER TABLE "bottle" ADD FOREIGN KEY ("id_cask_origin") REFERENCES "cask_origin" ("id");
ALTER TABLE "bottle" ADD FOREIGN KEY ("id_cask_size") REFERENCES "cask_size" ("id");
ALTER TABLE "bottle" ADD FOREIGN KEY ("id_grain_type") REFERENCES "grain_type" ("id");
ALTER TABLE "review" ADD FOREIGN KEY ("id_place") REFERENCES "place" ("id");
ALTER TABLE "review" ADD FOREIGN KEY ("id_bottle") REFERENCES "bottle" ("id");
ALTER TABLE "review" ADD FOREIGN KEY ("id_people") REFERENCES "people" ("id");
ALTER TABLE "place" ADD FOREIGN KEY ("id_place_type") REFERENCES "place_type" ("id");
ALTER TABLE "field_level" ADD FOREIGN KEY ("id_star_field") REFERENCES "star_field" ("id");
ALTER TABLE "field_level" ADD FOREIGN KEY ("id_review") REFERENCES "review" ("id");