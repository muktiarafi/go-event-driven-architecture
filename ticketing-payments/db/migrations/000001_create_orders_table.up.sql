CREATE TABLE orders (
    id INTEGER NOT NULL UNIQUE PRIMARY KEY,
    price DECIMAL NOT NULL,
    status VARCHAR(45) NOT NULL,
    user_id INTEGER NOT NULL,
    version INTEGER DEFAULT 1
)