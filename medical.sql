DROP TABLE IF EXISTS diagnosis, visits, diseases, patients, doctors;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INTEGER,
    doctor_id INTEGER REFERENCES doctors(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER NOT NULL,
    patient_id INTEGER NOT NULL,
    visit_date DATE NOT NULL,
    appointment_time TIME,
    status VARCHAR(50),
    FOREIGN KEY(doctor_id) REFERENCES doctors(id),
    FOREIGN KEY(patient_id) REFERENCES patients(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE diagnosis (
    iD SERIAL PRIMARY KEY,
    visit_id INTEGER NOT NULL,
    disease_id INTEGER NOT NULL,
    status VARCHAR(50),
    FOREIGN KEY(visit_id) REFERENCES visits(id),
    FOREIGN KEY(disease_id) REFERENCES diseases(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

