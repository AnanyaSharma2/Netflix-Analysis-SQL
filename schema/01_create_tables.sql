DROP DATABASE IF EXISTS netflix;
CREATE DATABASE netflix;
USE netflix;

--  TABLE DEFINITIONS

-- 1. subscription_plans

CREATE TABLE subscription_plans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(50) NOT NULL,
    price_monthly  DECIMAL(6,2) NOT NULL,
    max_screens INT NOT NULL,
    has_4k BOOLEAN NOT NULL DEFAULT FALSE,
    has_downloads BOOLEAN NOT NULL DEFAULT FALSE
);


-- 2. users

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    country VARCHAR(50) NOT NULL,
    signup_date DATE NOT NULL,
    birth_year INT,
    gender ENUM('M','F','Other'),
    user_segment ENUM('power','regular','casual','churned') NOT NULL DEFAULT 'casual',
    referral_source ENUM('organic','paid_ad','referral','social_media','email') NOT NULL
);


-- 3. user_subscriptions

CREATE TABLE user_subscriptions (
    sub_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    plan_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,                        
    cancellation_reason  VARCHAR(100),               
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (plan_id) REFERENCES subscription_plans(plan_id)
);


-- 4. genres

CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    genre_name  VARCHAR(50) NOT NULL
);


-- 5. movies

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    release_year INT NOT NULL,
    duration INT NOT NULL, -- In Minutes
    imdb_rating DECIMAL(3,1),
    imdb_votes INT,
    language VARCHAR(50) NOT NULL DEFAULT 'English',
    content_type ENUM('movie','series','documentary') NOT NULL DEFAULT 'movie',
    age_rating ENUM('U','UA','A','R') NOT NULL DEFAULT 'UA'
);


-- 6. movie_genres  

CREATE TABLE movie_genres (
    movie_id  INT NOT NULL,
    genre_id  INT NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);


-- 7. directors

CREATE TABLE directors (
    director_id INT PRIMARY KEY,
    director_name VARCHAR(100) NOT NULL
);


-- 8. actors

CREATE TABLE actors (
    actor_id INT PRIMARY KEY,
    actor_name VARCHAR(100) NOT NULL
);


-- 9. movie_directors 

CREATE TABLE movie_directors (
    movie_id INT NOT NULL,
    director_id INT NOT NULL,
    PRIMARY KEY (movie_id, director_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (director_id) REFERENCES directors(director_id)
);


-- 10. movie_actors  

CREATE TABLE movie_actors (
    movie_id INT NOT NULL,
    actor_id INT NOT NULL,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);


-- 11. watch_history 

CREATE TABLE watch_history (
    watch_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    watch_time DATETIME NOT NULL,
    watch_duration INT NOT NULL,   -- minutes actually watched
    completion_pc DECIMAL(5,2) NOT NULL,   -- 0.00–100.00
    device_type ENUM('mobile','desktop','tablet','smart_tv') NOT NULL,
    dropped_at_minute INT,  -- NULL = completed or near-complete
    FOREIGN KEY (user_id)  REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- 12. user_ratings

CREATE TABLE user_ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    movie_id INT NOT NULL,
    rating DECIMAL(3,1) NOT NULL,
    rating_date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

--   INDEXES  (performance — document in README)


CREATE INDEX idx_wh_user ON watch_history(user_id);
CREATE INDEX idx_wh_movie ON watch_history(movie_id);
CREATE INDEX idx_wh_time ON watch_history(watch_time);
CREATE INDEX idx_wh_device ON watch_history(device_type);
CREATE INDEX idx_ur_user ON user_ratings(user_id);
CREATE INDEX idx_ur_movie ON user_ratings(movie_id);
CREATE INDEX idx_us_user ON user_subscriptions(user_id);
CREATE INDEX idx_us_end ON user_subscriptions(end_date);
CREATE INDEX idx_users_country ON users(country);
CREATE INDEX idx_users_segment ON users(user_segment);
CREATE INDEX idx_movies_year ON movies(release_year);
