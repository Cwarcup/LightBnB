INSERT INTO users (name, email, password)
VALUES ('Curtis Warcup', 'curtis@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.' ),
VALUES ('Hana Ito', 'hana@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.' ),
VALUES ('Gilligan Dog', 'gilly@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.' );

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, postal_code, active)
VALUES (1, 'The Beach House', 'A beautiful beach house', 'https://images.unsplash.com/photo-1511840636560-acee95b3a83f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80', 'https://images.unsplash.com/photo-1511840636560-acee95b3a83f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80', 100, 2, 1, 1, 'Canada', '123 Main St', 'Vancouver', 'BC', 'V6J1H3', TRUE),
VALUES (2, 'The Lake House', 'A beautiful Lake house', 'https://images.unsplash.com/photo-1559767949-0faa5c7e9992?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', 'https://images.unsplash.com/photo-1559767949-0faa5c7e9992?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', 300, 4, 3, 3, 'Canada', '123 Victoria Dr', 'Richmond', 'BC', 'V7G2H9', TRUE),
VALUES (3, 'The Dog House', 'A dog house', 'https://images.unsplash.com/photo-1599427294074-524c52911d53?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', 'https://images.unsplash.com/photo-1599427294074-524c52911d53?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', 15, 0, 1, 1, 'Canada', '123 Dyke Rd', 'Richmond', 'BC', 'V7C2B6', FALSE);


INSERT INTO reservations (start_date, end_date, property_id, guest_id)


