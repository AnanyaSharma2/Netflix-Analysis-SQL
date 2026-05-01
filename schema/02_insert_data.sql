INSERT INTO subscription_plans VALUES
(1, 'Basic', 199.00, 1, FALSE, FALSE),
(2, 'Standard', 499.00, 2, FALSE, TRUE),
(3, 'Premium', 799.00, 4, TRUE,  TRUE);

INSERT INTO genres VALUES
(1,'Action'),(2,'Drama'),(3,'Romance'),
(4,'Sci-Fi'),(5,'Thriller'),(6,'Comedy'),
(7,'Horror'),(8,'Animation'),(9,'Documentary'),(10,'Crime');

INSERT INTO movies VALUES
-- Blockbusters / High-rating
(1,  'The Dark Knight', 2008, 152, 9.0, 3500, 'English', 'movie', 'UA'),
(2,  'Inception', 2010, 148, 8.8, 2000, 'English', 'movie', 'UA'),
(3,  'Fight Club', 1999, 139, 8.8, 2300, 'English', 'movie', 'A'),
(4,  'The Matrix', 1999, 136, 8.7, 2100, 'English', 'movie', 'UA'),
(5,  'Interstellar', 2014, 169, 8.6, 1800, 'English', 'movie', 'U'),
(6,  'Parasite', 2019, 132, 8.6, 1900, 'Korean', 'movie', 'A'),
(7,  'Gladiator', 2000, 155, 8.5, 1700, 'English', 'movie', 'A'),
(8,  'Joker', 2019, 122, 8.4, 2200, 'English', 'movie', 'A'),
(9,  'Toy Story', 1995,  81, 8.3, 1500, 'English', 'movie', 'U'),
(10, 'Shutter Island', 2010, 138, 8.2, 1800, 'English', 'movie', 'UA'),
(11, 'Deadpool', 2016, 108, 8.1, 1600, 'English', 'movie', 'A'),
(12, 'Avengers', 2012, 143, 8.0, 3000, 'English', 'movie', 'UA'),
(13, 'La La Land', 2016, 128, 8.0, 1300, 'English', 'movie', 'U'),
(14, 'Titanic', 1997, 195, 7.9, 2500, 'English', 'movie', 'UA'),
(15, 'Avatar', 2009, 162, 7.9, 2800, 'English', 'movie', 'UA'),
(16, 'Tenet', 2020, 150, 7.6, 1200, 'English', 'movie', 'UA'),
(17, 'John Wick', 2014, 101, 7.5, 1500, 'English', 'movie', 'A'),
(18, 'Frozen', 2013, 102, 7.5, 1100, 'English', 'movie', 'U'),
(19, 'Gravity', 2013,  91, 7.7, 1400, 'English', 'movie', 'UA'),
(20, 'The Notebook',  2004, 123, 7.8, 1200, 'English', 'movie', 'UA'),
-- Mid-tier
(21, 'Bahubali: The Beginning',2015,159, 8.1, 900, 'Hindi', 'movie', 'UA'),
(22, 'RRR', 2022, 182, 7.8, 700, 'Hindi', 'movie', 'UA'),
(23, 'KGF Chapter 2', 2022, 168, 8.4, 850, 'Kannada', 'movie', 'UA'),
(24, '3 Idiots', 2009, 170, 8.4, 1100, 'Hindi', 'movie', 'U'),
(25, 'Dangal', 2016, 161, 8.3, 950,  'Hindi', 'movie', 'U'),
(26, 'Uri: The Surgical Strike',2019,138,8.2, 600, 'Hindi', 'movie', 'UA'),
(27, 'Gully Boy', 2019, 154, 7.9, 500, 'Hindi', 'movie', 'UA'),
(28, 'Article 15', 2019, 130, 8.0, 450, 'Hindi', 'movie', 'UA'),
(29, 'Tumbbad', 2018, 104, 8.1, 520, 'Hindi', 'movie', 'A'),
(30, 'Andhadhun', 2018, 139, 8.2, 780, 'Hindi', 'movie', 'A'),
-- Documentaries
(31, 'Wild Wild Country', 2018, 360, 8.1, 400, 'English', 'documentary','UA'),
(32, 'Making a Murderer', 2015, 600, 8.6, 500, 'English', 'documentary','UA'),
(33, 'The Social Dilemma', 2020,  94, 7.6, 800, 'English', 'documentary','UA'),
-- Horror
(34, 'Get Out', 2017, 104, 7.7, 1200, 'English', 'movie', 'A'),
(35, 'A Quiet Place', 2018, 90, 7.5, 1100, 'English', 'movie', 'UA'),
-- Animation
(36, 'Spider-Man: Into the Spider-Verse',2018,117,8.4,1600,'English','movie','U'),
(37, 'Your Name', 2016, 106, 8.4, 700, 'Japanese','movie', 'U'),
-- Crime
(38, 'The Godfather', 1972, 175, 9.2, 2800, 'English', 'movie', 'A'),
(39, 'Goodfellas', 1990, 146, 8.7, 1900, 'English', 'movie', 'A'),
(40, 'Pulp Fiction', 1994, 154, 8.9, 2500, 'English', 'movie', 'A');

INSERT INTO movie_genres VALUES
(1,1),(1,10),(2,4),(2,5),(3,2),(3,5),(4,4),(4,1),
(5,4),(5,2),(6,2),(6,5),(6,10),(7,1),(7,2),(8,2),(8,5),
(9,8),(10,5),(10,2),(11,1),(11,6),(12,1),(13,2),(13,3),
(14,3),(14,2),(15,4),(15,1),(16,4),(16,5),(17,1),(18,8),
(19,4),(20,3),(21,1),(21,2),(22,1),(22,2),(23,1),(24,6),(24,2),
(25,2),(26,1),(27,2),(28,2),(29,7),(30,5),(30,10),
(31,9),(32,9),(33,9),(34,7),(35,7),(36,8),(36,1),
(37,2),(37,3),(38,10),(38,2),(39,10),(40,10),(40,2);

INSERT INTO directors VALUES
(1,'Christopher Nolan'),(2,'James Cameron'),(3,'Nick Cassavetes'),
(4,'Joss Whedon'),(5,'Chad Stahelski'),(6,'Lana Wachowski'),
(7,'Ridley Scott'),(8,'Todd Phillips'),(9,'Damien Chazelle'),
(10,'Bong Joon-ho'),(11,'David Fincher'),(12,'Martin Scorsese'),
(13,'Pete Docter'),(14,'Quentin Tarantino'),(15,'Tim Miller'),
(16,'Alfonso Cuaron'),(17,'Jordan Peele'),(18,'John Krasinski'),
(19,'S.S. Rajamouli'),(20,'Prashanth Neel'),(21,'Rajkumar Hirani'),
(22,'Nitesh Tiwari'),(23,'Aditya Dhar'),(24,'Zoya Akhtar'),
(25,'Francis Ford Coppola'),(26,'Makoto Shinkai');

INSERT INTO movie_directors VALUES
(1,1),(2,1),(3,2),(4,3),(5,1),(6,10),(7,7),(8,8),
(9,13),(10,12),(11,15),(12,4),(13,9),(14,2),(15,2),
(16,1),(17,5),(18,13),(19,16),(20,3),(21,19),(22,19),
(23,20),(24,21),(25,22),(26,23),(27,24),(28,23),(29,1),
(30,14),(34,17),(35,18),(36,13),(37,26),(38,25),(39,12),(40,14);

INSERT INTO actors VALUES
(1,'Leonardo DiCaprio'),(2,'Joseph Gordon-Levitt'),(3,'Kate Winslet'),
(4,'Robert Downey Jr.'),(5,'Scarlett Johansson'),(6,'Chris Evans'),
(7,'Keanu Reeves'),(8,'Laurence Fishburne'),(9,'Christian Bale'),
(10,'Heath Ledger'),(11,'Joaquin Phoenix'),(12,'Brad Pitt'),
(13,'Edward Norton'),(14,'Ryan Gosling'),(15,'Emma Stone'),
(16,'Song Kang-ho'),(17,'Tom Hanks'),(18,'Tim Allen'),
(19,'Chris Hemsworth'),(20,'Mark Ruffalo'),(21,'Matthew McConaughey'),
(22,'Anne Hathaway'),(23,'Rachel McAdams'),(24,'Ryan Reynolds'),
(25,'Russell Crowe'),(26,'Zazie Beetz'),(27,'Sam Worthington'),
(28,'Zoe Saldana'),(29,'Idina Menzel'),(30,'Kristen Bell'),
(31,'Prabhas'),(32,'Rana Daggubati'),(33,'N.T. Rama Rao Jr.'),
(34,'Ram Charan'),(35,'Aamir Khan'),(36,'Amitabh Bachchan'),
(37,'Manoj Bajpayee'),(38,'Vicky Kaushal'),(39,'Ranveer Singh'),
(40,'Al Pacino'),(41,'Robert De Niro'),(42,'Samuel L. Jackson'),
(43,'John Travolta'),(44,'Marlon Brando'),(45,'Taapsee Pannu');

INSERT INTO movie_actors VALUES
(1,9),(1,10),(2,1),(2,2),(3,12),(3,13),(4,7),(4,8),
(5,21),(5,22),(6,16),(7,25),(8,11),(8,26),(9,17),(9,18),
(10,1),(10,22),(11,24),(12,4),(12,5),(12,6),(12,19),(12,20),
(13,14),(13,15),(14,1),(14,3),(15,27),(15,28),(16,2),
(17,7),(18,29),(18,30),(19,1),(19,22),(20,14),(20,23),
(21,31),(21,32),(22,33),(22,34),(23,31),(24,35),(25,35),
(26,38),(27,39),(28,37),(29,36),(30,36),(36,42),(38,40),(38,44),
(39,41),(39,12),(40,12),(40,43);

--  USER DATA  (10,000 realistic users)
-- Generate 10,000 users 
-- Names, country, segment all derived deterministically from user_id using MOD

INSERT INTO users (user_id, name, email, country, signup_date, birth_year, gender, user_segment, referral_source)
SELECT
    seq.user_id,
    -- Name: first name picked by (user_id MOD 50), last name by (user_id MOD 100)
    CONCAT(
        ELT(1 + (seq.user_id MOD 50),
            'Aarav','Aditya','Akash','Amit','Ananya','Anjali','Arjun','Aryan',
            'Deepak','Divya','Gaurav','Harish','Ishaan','Ishita','Kabir',
            'Kavya','Kiran','Kunal','Manish','Meera','Mohit','Neha','Nikhil',
            'Pooja','Priya','Rahul','Raj','Rakesh','Ritika','Rohan',
            'Samaya','Shruti','Simran','Sneha','Suresh','Tanvi','Varun','Vikram',
            'Liam','Noah','Oliver','James','William','Benjamin','Lucas','Henry',
            'Emma','Sophia','Isabella','Mia'
        ),
        ' ',
        ELT(1 + (seq.user_id MOD 100),
            'Sharma','Verma','Patel','Singh','Kumar','Gupta','Joshi','Mehta',
            'Nair','Iyer','Reddy','Rao','Kapoor','Malhotra','Khanna','Bansal',
            'Mishra','Tiwari','Yadav','Jain','Chopra','Bose','Das','Dutta',
            'Smith','Johnson','Williams','Brown','Jones','Davis','Miller','Wilson',
            'Moore','Taylor','Anderson','Thomas','Jackson','White','Harris','Martin',
            'Thompson','Garcia','Martinez','Robinson','Clark','Lewis','Lee','Walker',
            'Hall','Allen','Young','King','Wright','Scott','Green','Baker',
            'Adams','Nelson','Carter','Mitchell','Perez','Roberts','Turner','Phillips',
            'Campbell','Parker','Evans','Edwards','Collins','Stewart','Sanchez','Morris',
            'Rogers','Reed','Cook','Morgan','Bell','Murphy','Bailey','Rivera',
            'Cooper','Richardson','Cox','Howard','Ward','Torres','Peterson','Gray',
            'Ramirez','James','Watson','Brooks','Kelly','Sanders','Price','Bennett',
            'Wood','Barnes','Ross','Henderson','Coleman','Jenkins','Perry','Powell'
        )
    ) AS name,

    -- Email: lowercase first name + user_id + domain
    CONCAT(
        LOWER(ELT(1 + (seq.user_id MOD 50),
            'aarav','aditya','akash','amit','ananya','anjali','arjun','aryan',
            'deepak','divya','gaurav','harish','ishaan','ishita','kabir',
            'kavya','kiran','kunal','manish','meera','mohit','neha','nikhil',
            'pooja','priya','rahul','raj','rakesh','ritika','rohan',
            'sanya','shruti','simran','sneha','suresh','tanvi','varun','vikram',
            'liam','noah','oliver','james','william','benjamin','lucas','henry',
            'emma','khushi','isabella','mira'
        )),
        seq.user_id,
        '@',
        ELT(1 + (seq.user_id MOD 4),'gmail.com','yahoo.com','outlook.com','hotmail.com')
    ) AS email,

    -- Country: weighted by MOD 20 (India most frequent)
    ELT(1 + (seq.user_id MOD 20),
        'India','India','India','India','India',
        'USA','USA','USA','USA',
        'UK','UK',
        'Canada','Canada',
        'Germany','France','Australia','Brazil',
        'Japan','UAE','Singapore'
    ) AS country,

    -- Signup date: spread across 2022–2024, later users get more recent dates
    DATE_ADD('2022-01-01', INTERVAL (seq.user_id MOD 730) DAY) AS signup_date,

    1970 + (seq.user_id MOD 35) AS birth_year,

    ELT(1 + (seq.user_id MOD 3), 'M','F','Other') AS gender,

    -- Segment: power(20%) regular(30%) casual(30%) churned(20%) via MOD 10
    CASE (seq.user_id MOD 10)
        WHEN 0 THEN 'power'
        WHEN 1 THEN 'power'
        WHEN 2 THEN 'regular'
        WHEN 3 THEN 'regular'
        WHEN 4 THEN 'regular'
        WHEN 5 THEN 'casual'
        WHEN 6 THEN 'casual'
        WHEN 7 THEN 'casual'
        WHEN 8 THEN 'churned'
        ELSE 'churned'
    END AS user_segment,

    ELT(1 + (seq.user_id MOD 5),
        'organic','paid_ad','referral','social_media','email'
    ) AS referral_source

FROM (
    SELECT h.n * 100 + t.n - 100 AS user_id
    FROM (
        SELECT 1 AS n UNION ALL SELECT 2  UNION ALL SELECT 3  UNION ALL SELECT 4  UNION ALL SELECT 5
        UNION ALL SELECT 6  UNION ALL SELECT 7  UNION ALL SELECT 8  UNION ALL SELECT 9  UNION ALL SELECT 10
        UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15
        UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20
        UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25
        UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29 UNION ALL SELECT 30
        UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35
        UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39 UNION ALL SELECT 40
        UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45
        UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49 UNION ALL SELECT 50
        UNION ALL SELECT 51 UNION ALL SELECT 52 UNION ALL SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55
        UNION ALL SELECT 56 UNION ALL SELECT 57 UNION ALL SELECT 58 UNION ALL SELECT 59 UNION ALL SELECT 60
        UNION ALL SELECT 61 UNION ALL SELECT 62 UNION ALL SELECT 63 UNION ALL SELECT 64 UNION ALL SELECT 65
        UNION ALL SELECT 66 UNION ALL SELECT 67 UNION ALL SELECT 68 UNION ALL SELECT 69 UNION ALL SELECT 70
        UNION ALL SELECT 71 UNION ALL SELECT 72 UNION ALL SELECT 73 UNION ALL SELECT 74 UNION ALL SELECT 75
        UNION ALL SELECT 76 UNION ALL SELECT 77 UNION ALL SELECT 78 UNION ALL SELECT 79 UNION ALL SELECT 80
        UNION ALL SELECT 81 UNION ALL SELECT 82 UNION ALL SELECT 83 UNION ALL SELECT 84 UNION ALL SELECT 85
        UNION ALL SELECT 86 UNION ALL SELECT 87 UNION ALL SELECT 88 UNION ALL SELECT 89 UNION ALL SELECT 90
        UNION ALL SELECT 91 UNION ALL SELECT 92 UNION ALL SELECT 93 UNION ALL SELECT 94 UNION ALL SELECT 95
        UNION ALL SELECT 96 UNION ALL SELECT 97 UNION ALL SELECT 98 UNION ALL SELECT 99 UNION ALL SELECT 100
    ) h
    CROSS JOIN (
        SELECT 1 AS n UNION ALL SELECT 2  UNION ALL SELECT 3  UNION ALL SELECT 4  UNION ALL SELECT 5
        UNION ALL SELECT 6  UNION ALL SELECT 7  UNION ALL SELECT 8  UNION ALL SELECT 9  UNION ALL SELECT 10
        UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15
        UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20
        UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25
        UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29 UNION ALL SELECT 30
        UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35
        UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39 UNION ALL SELECT 40
        UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45
        UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49 UNION ALL SELECT 50
        UNION ALL SELECT 51 UNION ALL SELECT 52 UNION ALL SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55
        UNION ALL SELECT 56 UNION ALL SELECT 57 UNION ALL SELECT 58 UNION ALL SELECT 59 UNION ALL SELECT 60
        UNION ALL SELECT 61 UNION ALL SELECT 62 UNION ALL SELECT 63 UNION ALL SELECT 64 UNION ALL SELECT 65
        UNION ALL SELECT 66 UNION ALL SELECT 67 UNION ALL SELECT 68 UNION ALL SELECT 69 UNION ALL SELECT 70
        UNION ALL SELECT 71 UNION ALL SELECT 72 UNION ALL SELECT 73 UNION ALL SELECT 74 UNION ALL SELECT 75
        UNION ALL SELECT 76 UNION ALL SELECT 77 UNION ALL SELECT 78 UNION ALL SELECT 79 UNION ALL SELECT 80
        UNION ALL SELECT 81 UNION ALL SELECT 82 UNION ALL SELECT 83 UNION ALL SELECT 84 UNION ALL SELECT 85
        UNION ALL SELECT 86 UNION ALL SELECT 87 UNION ALL SELECT 88 UNION ALL SELECT 89 UNION ALL SELECT 90
        UNION ALL SELECT 91 UNION ALL SELECT 92 UNION ALL SELECT 93 UNION ALL SELECT 94 UNION ALL SELECT 95
        UNION ALL SELECT 96 UNION ALL SELECT 97 UNION ALL SELECT 98 UNION ALL SELECT 99 UNION ALL SELECT 100
    ) t
    WHERE h.n * 100 + t.n - 100 BETWEEN 1 AND 10000
) seq;


--  SUBSCRIPTIONS

-- Active subscriptions (non-churned users)
INSERT INTO user_subscriptions (user_id, plan_id, start_date, end_date, cancellation_reason)
SELECT
    u.user_id,
    -- Plan distribution: 50% Basic, 35% Standard, 15% Premium
    CASE
        WHEN RAND() < 0.50 THEN 1
        WHEN RAND() < 0.85 THEN 2
        ELSE 3
    END AS plan_id,
    DATE_ADD(u.signup_date, INTERVAL FLOOR(RAND()*3) DAY) AS start_date,
    NULL AS end_date,
    NULL AS cancellation_reason
FROM users u
WHERE u.user_segment != 'churned';

-- Churned users: cancelled subscription
INSERT INTO user_subscriptions (user_id, plan_id, start_date, end_date, cancellation_reason)
SELECT
    u.user_id,
    CASE
        WHEN RAND() < 0.65 THEN 1
        WHEN RAND() < 0.90 THEN 2
        ELSE 3
    END AS plan_id,
    DATE_ADD(u.signup_date, INTERVAL FLOOR(RAND()*5) DAY) AS start_date,
    DATE_ADD(u.signup_date, INTERVAL (14 + FLOOR(RAND()*60)) DAY) AS end_date,
    ELT(FLOOR(RAND()*5)+1,
        'too_expensive',
        'not_enough_content',
        'switched_to_competitor',
        'poor_streaming_quality',
        'temporary_break'
    ) AS cancellation_reason
FROM users u
WHERE u.user_segment = 'churned';


-- WATCH HISTORY  

INSERT INTO watch_history (user_id, movie_id, watch_time, watch_duration, completion_pct, device_type, dropped_at_minute)
SELECT
    u.user_id,

    -- Popularity-weighted movie selection
    CASE
        WHEN RAND() < 0.08  THEN 1     -- The Dark Knight  (most popular)
        WHEN RAND() < 0.15  THEN 2     -- Inception
        WHEN RAND() < 0.21  THEN 38    -- The Godfather
        WHEN RAND() < 0.27  THEN 40    -- Pulp Fiction
        WHEN RAND() < 0.32  THEN 12    -- Avengers
        WHEN RAND() < 0.37  THEN 5     -- Interstellar
        WHEN RAND() < 0.42  THEN 24    -- 3 Idiots
        WHEN RAND() < 0.46  THEN 36    -- Spider-Man: Spider-Verse
        WHEN RAND() < 0.50  THEN 6     -- Parasite
        WHEN RAND() < 0.54  THEN 8     -- Joker
        WHEN RAND() < 0.57  THEN 23    -- KGF Chapter 2
        WHEN RAND() < 0.60  THEN 25    -- Dangal
        ELSE FLOOR(1 + RAND() * 40)    -- long tail
    END AS movie_id,
    TIMESTAMP(
        DATE_ADD(u.signup_date, INTERVAL FLOOR(1 + RAND() * 500) DAY),
        CASE
            WHEN RAND() < 0.50 THEN SEC_TO_TIME(68400 + FLOOR(RAND()*14400))  -- 7–11pm
            WHEN RAND() < 0.75 THEN SEC_TO_TIME(46800 + FLOOR(RAND()*21600))  -- 1–7pm
            WHEN RAND() < 0.90 THEN SEC_TO_TIME(32400 + FLOOR(RAND()*14400))  -- 9am–1pm
            ELSE SEC_TO_TIME(FLOOR(RAND()*32400))                             -- late night
        END
    ) AS watch_time,

    CASE
        WHEN RAND() < 0.12 THEN FLOOR(3  + RAND()*15)     -- very early drop-off (<15 min)
        WHEN RAND() < 0.22 THEN FLOOR(15 + RAND()*30)     -- early drop-off (15–45 min)
        WHEN RAND() < 0.35 THEN FLOOR(45 + RAND()*40)     -- partial watch
        WHEN RAND() < 0.55 THEN FLOOR(80 + RAND()*40)     -- most of movie
        ELSE                    FLOOR(120 + RAND()*60)     -- full / re-watch
    END AS watch_duration,

    -- completion_pct derived below (placeholder; updated after)
    ROUND(RAND() * 100, 2) AS completion_pct,

    -- Device mix: mobile-heavy
    ELT(FLOOR(RAND()*10)+1,
        'mobile','mobile','mobile','mobile',        -- 40% mobile
        'smart_tv','smart_tv','smart_tv',           -- 30% smart TV
        'desktop','desktop',                        -- 20% desktop
        'tablet'                                    -- 10% tablet
    ) AS device_type,

    CASE
        WHEN RAND() < 0.22 THEN FLOOR(3 + RAND()*42)
        ELSE NULL
    END AS dropped_at_minute

FROM users u
-- Inline row multiplier (1..50) — no temp/permanent table reference needed
JOIN (
    SELECT 1 AS n UNION ALL SELECT 2  UNION ALL SELECT 3  UNION ALL SELECT 4  UNION ALL SELECT 5
    UNION ALL SELECT 6  UNION ALL SELECT 7  UNION ALL SELECT 8  UNION ALL SELECT 9  UNION ALL SELECT 10
    UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15
    UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20
    UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25
    UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29 UNION ALL SELECT 30
    UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35
    UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39 UNION ALL SELECT 40
    UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45
    UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49 UNION ALL SELECT 50
) t
WHERE
    CASE u.user_segment
        WHEN 'power'   THEN t.n <= 50 AND RAND() < 0.75
        WHEN 'regular' THEN t.n <= 15 AND RAND() < 0.70
        WHEN 'casual'  THEN t.n <=  5 AND RAND() < 0.65
        WHEN 'churned' THEN t.n <=  2 AND RAND() < 0.55
        ELSE FALSE
    END;

UPDATE watch_history wh
JOIN movies m ON wh.movie_id = m.movie_id
SET wh.completion_pct = LEAST(100.00, ROUND(wh.watch_duration * 100.0 / m.duration, 2));

--  7: USER RATINGS  

INSERT INTO user_ratings (user_id, movie_id, rating, rating_date)
SELECT
    wh.user_id,
    wh.movie_id,
    -- U-shaped rating distribution (polarized, like real data)
    CASE
        WHEN RAND() < 0.08 THEN ROUND(1.0 + RAND()*1.9, 1)    -- 1–3  haters
        WHEN RAND() < 0.15 THEN ROUND(3.0 + RAND()*1.9, 1)    -- 3–5  mixed
        WHEN RAND() < 0.20 THEN ROUND(5.0 + RAND()*1.9, 1)    -- 5–7  neutral
        WHEN RAND() < 0.55 THEN ROUND(7.0 + RAND()*1.4, 1)    -- 7–8.5 liked it
        ELSE ROUND(8.5 + RAND()*1.5, 1)    -- 8.5–10 loved it
    END AS rating,
    DATE_ADD(wh.watch_time, INTERVAL FLOOR(RAND()*48) HOUR) AS rating_date
FROM watch_history wh
WHERE wh.completion_pct >= 50.0
  AND RAND() < 0.55;   

-- Getting ROW COUNTS

SELECT 'subscription_plans' AS tbl, COUNT(*) AS row_s FROM subscription_plans
UNION ALL SELECT 'genres', COUNT(*) FROM genres
UNION ALL SELECT 'movies', COUNT(*) FROM movies
UNION ALL SELECT 'users', COUNT(*) FROM users
UNION ALL SELECT 'user_subscriptions', COUNT(*) FROM user_subscriptions
UNION ALL SELECT 'watch_history', COUNT(*) FROM watch_history
UNION ALL SELECT 'user_ratings', COUNT(*) FROM user_ratings
UNION ALL SELECT 'directors', COUNT(*) FROM directors
UNION ALL SELECT 'actors', COUNT(*) FROM actors;
