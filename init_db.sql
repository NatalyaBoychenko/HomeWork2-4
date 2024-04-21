CREATE TABLE worker(
	id SERIAL PRIMARY KEY,
	name VARCHAR(1000) NOT NULL CHECK(char_length(name) >= 2),
	birthday DATE CHECK(birthday >= '1900.01.01'),
	level VARCHAR(1000) NOT NULL CHECK(level IN ('Trainee', 'Junior', 'Middle', 'Senior')),
	salary NUMERIC CHECK(salary >= 100 AND salary <= 100000)
);

CREATE TABLE client(
	id SERIAL PRIMARY KEY,
	name VARCHAR(1000) NOT NULL CHECK(char_length(name) >= 2)
);

CREATE TABLE project(
	id SERIAL PRIMARY KEY,
	client_id BIGINT REFERENCES client(id),
	start_date DATE,
	finish_date DATE 
);

CREATE TABLE project_worker(
	project_id BIGINT NOT NULL REFERENCES project(id),
	worker_id BIGINT NOT NULL REFERENCES worker(id),
	PRIMARY KEY (project_id, worker_id)
);
