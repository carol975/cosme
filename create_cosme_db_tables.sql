CREATE TABLE users(
    uid INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    name VARCHAR(70) NOT NULL,
    profile_pic_url VARCHAR(2083),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY uid
)

CREATE TABLE admin_users(
    uid INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY uid,
    FOREIGN KEY uid REFERENCES users
)

CREATE TABLE regular_users (
    uid INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY uid,
    FOREIGN KEY uid REFERENCES users
)

CREATE TABLE deactivated_users (
    uid INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    deactivated_at DATETIME NOT NULL,
    PRIMARY KEY uid,
    FOREIGN KEY uid REFERENCES users
)

CREATE TABLE products (
    pid INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    barcode_str TEXT,
    overall_rating INT,
    overall_safety_score INT,
    photo_url VARCHAR(255),
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY pid
)

CREATE TABLE product_reviews (
    uid INT NOT NULL,
    pid INT NOT NULL,
    review VARCHAR(255) NOT NULL,
    rating INT,
    likes INT DEFAULT 0,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (uid, pid),
    FOREIGN KEY uid REFERENCES users(uid) ON DELETE CASCADE,
    FOREIGN KEY pid REFERENCES products(pid) ON DELETE CASCADE
)

CREATE TABLE ingredients (
    iid INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    function TEXT,
    safety_score INT NOT NULL,
    PRIMARY KEY iid
)

CREATE TABLE ingredients_synonyms (
    iid INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY iid REFERENCES ingredients(iid) ON DELETE CASCADE
)

CREATE TABLE ingredient_reviews (
    uid INT NOT NULL,
    pid INT NOT NULL,
    review VARCHAR(255) NOT NULL,
    likes INT DEFAULT 0,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (uid, pid),
    FOREIGN KEY uid REFERENCES users(uid) ON DELETE CASCADE,
    FOREIGN KEY pid REFERENCES products(pid) ON DELETE CASCADE
)

CREATE TABLE ingredient_reviews_replies (
    repid INT NOT NULL AUTO_INCREMENT,
    uid INT NOT NULL,
    rvuid INT NOT NULL,
    rvpid INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY repid,
    FOREIGN KEY (rvuid, rvpid) REFERENCES ingredient_reviews(uid, pid) ON DELETE CASCADE
)

CREATE TABLE favorite_products (
    fpi INT NOT NULL AUTO_INCREMENT,
    uid INT NOT NULL,
    pid INT NOT NULL,
    created_at DATETIME NOT NULL,
    PRIMARY KEY (fpi, uid, pid),
    FOREIGN KEY uid REFERENCES users(uid) ON DELETE CASCADE,
    FOREIGN KEY pid REFERENCES products(pid) ON DELETE CASCADE
)

CREATE TABLE ingredients_of_products (
    iid INT NOT NULL,
    pid INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY key (iid, pid),
    FOREIGN KEY iid REFERENCES ingredients(iid) ON DELETE CASCADE,
    FOREIGN KEY pid REFERENCES products(pid) ON DELETE CASCADE
)
