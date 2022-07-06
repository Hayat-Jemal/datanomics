 CREATE TABLE customer(
     id INT PRIMARY KEY,
 	first_name VARCHAR(50) NOT NULL,
 	last_name VARCHAR(50),
 	dob DATE NOT NULL,
 	address VARCHAR(50),
 	 state_id int REFERENCES public.state.id,
	 country_id int REFERENCES public.country.id
 );
CREATE TABLE actor (    
     actor_id integer PRIMARY KEY, 
     first_name character varying(45) NOT NULL,  
     last_name character varying(45) NOT NULL,    
     last_update timestamp without DEFAULT now() NOT NULL);

CREATE TABLE film (
    film_id integer PRIMARY KEY,
    title character varying(255) NOT NULL,
    description text,
    release_year year,
    language_id smallint NOT NULL,
    original_language_id smallint,
    rental_duration smallint DEFAULT 3 NOT NULL,
    rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
    length smallint,
    replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
    rating mpaa_rating DEFAULT 'G',
    last_update timestamp  DEFAULT now() NOT NULL,
    special_features varchar(50),
    fulltext tsvector NOT NULL
);

CREATE TABLE film_actor (
    actor_id smallint NOT NULL,
    film_id smallint NOT NULL,
	PRIMARY KEY (actor_id, film_id),
    last_update timestamp DEFAULT now() NOT NULL
);
ALTER TABLE film_actor(
ADD CONSTRAINT actor_id FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
)

CREATE TABLE film_category (
    film_id smallint NOT NULL,
    category_id smallint NOT NULL,
    last_update timestamp DEFAULT now() NOT NULL
);

CREATE TABLE address (
    address_id integer PRIMARY KEY,
    address character varying(50) NOT NULL,
    address2 character varying(50),
    district character varying(20) NOT NULL,
    city_id smallint NOT NULL,
    postal_code character varying(10),
    phone character varying(20) NOT NULL,
    last_update timestamp DEFAULT now() NOT NULL
);

CREATE TABLE city (
    city_id integer PRIMARY KEY,
    city character varying(50) NOT NULL,
    country_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);

CREATE TABLE country (
    country_id integer PRIMARY KEY,
    country character varying(50) NOT NULL,
    last_update timestamp DEFAULT now() NOT NULL
);


CREATE TABLE customer (
    customer_id integer PRIMARY KEY,
    store_id smallint NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(50),
    address_id smallint NOT NULL,
    activebool boolean DEFAULT true NOT NULL,
    create_date date DEFAULT now() NOT NULL,
    last_update timestamp without time zone DEFAULT now(),
    active integer
); -->


-- manipulating the data -->
-- SELECT
-- <column_list>
--     FROM <table_name>
        

        -- SELECT actor_id, first_name, last_name, Last_update
        -- FROM actor;
        -- SELECT
        -- actor_id AS Actor_number,
        -- first_name AS Actor_name
        -- FROM actor
        -- WHERE actor_id<10 
        --1,Select rows from the film table where the film_id is less than 4. SELECT * FROM film
           -- WHERE film_id<4
        --2,Select rows from the film table where the rating is PG. SELECT * FROM film WHERE
           -- rating='PG' -->

             --3, Select rows from the film table where the rating is PG or G.
            SELECT *
            FROM film
            WHERE rating='PG' OR rating= 'G'
            
            --4,Select rows from the actor table where the first name is Angela, Angelina, or Audrey using IN key word. PS: Google
            --it!
            SELECT *
            FROM actor
            WHERE first_name IN ('Angela','Angelina','Audrey');
            
            --another method
            SELECT *
            FROM actor
            WHERE first_name='Angela' OR first_name='Angelina' OR first_name='Audrey'; -->