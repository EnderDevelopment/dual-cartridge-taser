CREATE TABLE IF NOT EXISTS taser_states (
    player_id INT PRIMARY KEY,
    cartridge_count INT DEFAULT 2,
    last_activation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO taser_states (player_id, cartridge_count) SELECT player_id, 2 FROM players WHERE player_id NOT IN (SELECT player_id FROM taser_states);