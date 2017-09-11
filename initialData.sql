-- PEOPLE
INSERT INTO "people" ("id", "name") VALUES (1, 'Philippe');
INSERT INTO "people" ("id", "name") VALUES (2, 'Claude');
INSERT INTO "people" ("id", "name") VALUES (3, 'JD');
INSERT INTO "people" ("id", "name") VALUES (4, 'Emile');
INSERT INTO "people" ("id", "name") VALUES (5, 'Mikael');

-- WHISKEY PEOPLE
INSERT INTO "whisky_people" ("id", "name") VALUES (1, 'Ichiro Akuto');
INSERT INTO "whisky_people" ("id", "name") VALUES (2, 'Yumi Yoshikawa');

-- COUNTRY
INSERT INTO "country" ("id", "name") VALUES (1, 'Japan');
INSERT INTO "country" ("id", "name") VALUES (2, 'America');
INSERT INTO "country" ("id", "name") VALUES (3, 'France');
INSERT INTO "country" ("id", "name") VALUES (4, 'Scotland');
INSERT INTO "country" ("id", "name") VALUES (5, 'England');
INSERT INTO "country" ("id", "name") VALUES (6, 'China');

-- COMPANY
INSERT INTO "company" ("id","name", "open_date", "close_date", "id_whisky_people", "id_country") VALUES (1, 'Chichibu', 34584388, 859038975, 1, 1);

-- DISTILLERY
INSERT INTO "distillery" ("id", "address", "latitude", "longitude",
"open_date", "close_date", "id_whisky_people", "id_company", "id_country") VALUES (1,
'〒368-0067 Saitama Prefecture, Chichibu, Midorigaoka, ４９', 36.046569,
139.0521664, 473897895, 85904389, 1, 1, 1);

-- CASK TYPE
INSERT INTO "cask_types" ("id", "type") VALUES (1, 'sherry');
INSERT INTO "cask_types" ("id", "type") VALUES (2, 'wine');
INSERT INTO "cask_types" ("id", "type") VALUES (3, 'bourbon');
INSERT INTO "cask_types" ("id", "type") VALUES (4, 'port');
INSERT INTO "cask_types" ("id", "type") VALUES (5, 'rum');
INSERT INTO "cask_types" ("id", "type") VALUES (6, 'madeira');
INSERT INTO "cask_types" ("id", "type") VALUES (7, 'marsala');
INSERT INTO "cask_types" ("id", "type") VALUES (8, 'new virgin oak');
INSERT INTO "cask_types" ("id", "type") VALUES (9, 'cognac');

-- CASK SIZE
INSERT INTO "cask_size" ("id", "denomination", "capacity") VALUES (1, 'Hogshead', 238);
INSERT INTO "cask_size" ("id", "denomination", "capacity") VALUES (4, 'Bourbon', 200);
INSERT INTO "cask_size" ("id", "denomination", "capacity") VALUES (2, 'Butt', 500);
INSERT INTO "cask_size" ("id", "denomination", "capacity") VALUES (3, 'Quarter Cask', 125);
INSERT INTO "cask_size" ("id", "denomination", "capacity") VALUES (4, 'Puncheon', 320);
INSERT INTO "cask_size" ("id", "denomination", "capacity") VALUES (5, 'Madeira Drum', 650);
INSERT INTO "cask_size" ("id", "denomination", "capacity") VALUES (6, 'Port Pipe (tall)', 500);
INSERT INTO "cask_size" ("id", "denomination", "capacity") VALUES (7, 'Sherry Hogdhead', 245);
INSERT INTO "cask_size" ("id", "denomination", "capacity") VALUES (8, 'Cognac', 300);
INSERT INTO "cask_size" ("id", "denomination", "capacity") VALUES (9, 'Bordeaux', 225);
INSERT INTO "cask_size" ("id", "denomination", "capacity") VALUES (10, 'Barrique', 225);
INSERT INTO "cask_size" ("id", "denomination", "capacity") VALUES (11, 'Bloodtub', 50);

-- CASK ORIGIN
INSERT INTO "cask_origin" ("id", "country") VALUES (1, 'France');
INSERT INTO "cask_origin" ("id", "country") VALUES (2, 'Scotland');


-- PLACE TYPE
INSERT INTO "place_type" ("id", "name") VALUES (1, 'Bar');
INSERT INTO "place_type" ("id", "name") VALUES (2, 'House');
INSERT INTO "place_type" ("id", "name") VALUES (3, 'Restaurant');
INSERT INTO "place_type" ("id", "name") VALUES (4, 'Distillery');

-- PLACE
INSERT INTO "place" ("id", "name", "id_place_type") VALUES (1, 'Emile ebisu', 2);
INSERT INTO "place" ("id", "name", "id_place_type") VALUES (2, 'Claude togoshiginza', 2);
INSERT INTO "place" ("id", "name", "id_place_type") VALUES (3, 'Bar in Meguro', 1);
INSERT INTO "place" ("id", "name", "id_place_type") VALUES (4, 'Bar in Nakano', 1);
INSERT INTO "place" ("id", "name", "id_place_type") VALUES (5, 'Unknown bar', 1);

-- GRAIN TYPE
INSERT INTO "grain_type" ("id", "name") VALUES (1, 'Single Malt');
INSERT INTO "grain_type" ("id", "name") VALUES (2, 'Blended Malt Whisky');
INSERT INTO "grain_type" ("id", "name") VALUES (3, 'Blended Whisky');
INSERT INTO "grain_type" ("id", "name") VALUES (4, 'Cask Strength');
INSERT INTO "grain_type" ("id", "name") VALUES (5, 'Single Cask');

-- STAR FIELD
INSERT INTO "star_field" ("id", "name") VALUES (1, 'Attack');
INSERT INTO "star_field" ("id", "name") VALUES (2, 'Strength');
INSERT INTO "star_field" ("id", "name") VALUES (3, 'Length');
INSERT INTO "star_field" ("id", "name") VALUES (4, 'Sweetness');
INSERT INTO "star_field" ("id", "name") VALUES (5, 'Depth');
INSERT INTO "star_field" ("id", "name") VALUES (6, 'Smoke');



