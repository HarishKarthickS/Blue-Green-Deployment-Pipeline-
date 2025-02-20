CREATE TABLE IF NOT EXISTS deployment_status (
    id SERIAL PRIMARY KEY,
    version VARCHAR(50) NOT NULL,
    deployed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert initial status record
INSERT INTO deployment_status (version) VALUES ('initial');
