CREATE TABLE votes (
    vote_id INT PRIMARY KEY,
    user_id INT,
    poll_id INT,
    option_id INT,
    voted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);