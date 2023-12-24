-- Check if the ClickBite database already exists
CREATE DATABASE IF NOT EXISTS ClickBite;

-- Use the ClickBite database
USE ClickBite;

-- Drop the REVIEWS table if it already exists
DROP TABLE IF EXISTS REVIEWS;

-- Drop the BITE_INGREDIENTS table if it already exists
DROP TABLE IF EXISTS BITE_INGREDIENTS;

-- Drop the BITE_STEPS table if it already exists
DROP TABLE IF EXISTS BITE_STEPS;

-- Drop the BITES table if it already exists
DROP TABLE IF EXISTS BITES;

-- Drop the USERS table if it already exists
DROP TABLE IF EXISTS USERS;

-- Create the USERS table
CREATE TABLE USERS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    USERNAME VARCHAR(255),
    PASSWORD VARCHAR(255),
    EMAIL VARCHAR(255),
    PROFILE_IMAGE VARCHAR(255)
);

-- Create the BITES table with USER_ID as a foreign key
CREATE TABLE BITES (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    USER_ID INT,
    TITLE VARCHAR(255),
    DESCRIPTION VARCHAR(255),
    IMAGE VARCHAR(255),
    NIBBLES INT,
    SPITS INT,
    FOREIGN KEY (USER_ID) REFERENCES USERS(ID)
);

-- Create the BITE_STEPS table
CREATE TABLE BITE_STEPS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    BITE_ID INT,
    STEP VARCHAR(255),
    FOREIGN KEY (BITE_ID) REFERENCES BITES(ID)
);

-- Create the BITE_INGREDIENTS table
CREATE TABLE BITE_INGREDIENTS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    BITE_ID INT,
    INGREDIENT VARCHAR(255),
    FOREIGN KEY (BITE_ID) REFERENCES BITES(ID)
);

-- Create the REVIEWS table
CREATE TABLE REVIEWS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    USER_ID INT,
    BITE_ID INT,
    REVIEW VARCHAR(255),
    FOREIGN KEY (USER_ID) REFERENCES USERS(ID),
    FOREIGN KEY (BITE_ID) REFERENCES BITES(ID)
);

-- Generate Dummy Data

-- Insert dummy data into USERS table
INSERT INTO USERS (ID, USERNAME, PASSWORD, EMAIL, PROFILE_IMAGE)
VALUES
    (1, 'user1', 'password1', 'user1@example.com', 'profile1.jpg'),
    (2, 'user2', 'password2', 'user2@example.com', 'profile2.jpg'),
    (3, 'user3', 'password3', 'user3@example.com', 'profile3.jpg'),
    (4, 'user4', 'password4', 'user4@example.com', 'profile4.jpg'),
    (5, 'user5', 'password5', 'user5@example.com', 'profile5.jpg');

-- Insert dummy data into BITES table
INSERT INTO BITES (ID, USER_ID, TITLE, DESCRIPTION, IMAGE, NIBBLES, SPITS)
VALUES
    (1, 1, 'Recipe 1', 'Description 1', 'image1.jpg', 5, 2),
    (2, 1, 'Recipe 2', 'Description 2', 'image2.jpg', 8, 1),
    (3, 2, 'Recipe 3', 'Description 3', 'image3.jpg', 3, 0),
    (4, 2, 'Recipe 4', 'Description 4', 'image4.jpg', 7, 3),
    (5, 3, 'Recipe 5', 'Description 5', 'image5.jpg', 6, 1);

-- Insert dummy data into BITE_INGREDIENTS table
INSERT INTO BITE_INGREDIENTS (BITE_ID, INGREDIENT)
VALUES

    (1, 'Flour'),
    (1, 'Sugar'),
    (1, 'Eggs'),
    (1, 'Butter'),
    (1, 'Chocolate Chips'),

    (2, 'Chicken'),
    (2, 'Broccoli'),
    (2, 'Soy Sauce'),
    (2, 'Garlic'),
    (2, 'Ginger'),

    (3, 'Chicken'),
    (3, 'Broccoli'),
    (3, 'Soy Sauce'),
    (3, 'Garlic'),
    (3, 'Ginger'),

    (4, 'Chicken'),
    (4, 'Broccoli'),
    (4, 'Soy Sauce'),
    (4, 'Garlic'),
    (4, 'Ginger'),

    (5, 'Flour'),
    (5, 'Sugar'),
    (5, 'Eggs'),
    (5, 'Butter'),
    (5, 'Chocolate Chips');

-- Insert dummy data into BITE_STEPS table
INSERT INTO BITE_STEPS (BITE_ID, STEP)
VALUES
    (1, 'Step 1: Preheat the oven to 350°F.'),
    (1, 'Step 2: Mix the ingredients in a bowl.'),
    (1, 'Step 3: Bake for 20 minutes.'),
    (1, 'Step 4: Cool before serving.'),
    (1, 'Step 5: Enjoy!'),

    (2, 'Step 1: Chop the vegetables.'),
    (2, 'Step 2: Saute the vegetables in a pan.'),
    (2, 'Step 3: Cook the chicken thoroughly.'),
    (2, 'Step 4: Mix in the sauce.'),
    (2, 'Step 5: Serve and enjoy!'),

    (3, 'Step 1: Boil the pasta.'),
    (3, 'Step 2: Prepare the sauce.'),
    (3, 'Step 3: Mix the pasta with the sauce.'),
    (3, 'Step 4: Garnish with herbs.'),
    (3, 'Step 5: Serve hot!'),

    (4, 'Step 1: Marinate the meat.'),
    (4, 'Step 2: Grill to perfection.'),
    (4, 'Step 3: Slice into portions.'),
    (4, 'Step 4: Prepare the sides.'),
    (4, 'Step 5: Enjoy your barbecue!'),

    (5, 'Step 1: Slice the fruits.'),
    (5, 'Step 2: Layer the fruits in a bowl.'),
    (5, 'Step 3: Pour yogurt over the fruits.'),
    (5, 'Step 4: Sprinkle granola on top.'),
    (5, 'Step 5: A healthy snack is ready!');
