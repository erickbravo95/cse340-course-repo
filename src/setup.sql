-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);


-- =====================================
-- Project Table
-- =====================================

CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    date DATE NOT NULL,
    CONSTRAINT fk_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
);

-- =====================================
-- Sample Service Projects
-- =====================================

INSERT INTO project
(organization_id, title, description, location, date)
VALUES
(1, 'Community Center Renovation',
 'Renovate a local community center.',
 'Rexburg, Idaho', '2026-11-20'),

(1, 'Affordable Housing Project',
 'Build affordable homes for families.',
 'Idaho Falls, Idaho', '2026-11-25'),

(1, 'School Playground Repair',
 'Repair playground equipment at a school.',
 'Rexburg, Idaho', '2026-12-01'),

(1, 'Neighborhood Cleanup',
 'Clean and improve public spaces.',
 'Sugar City, Idaho', '2026-12-05'),

(1, 'Community Library Construction',
 'Build a small community library.',
 'Rigby, Idaho', '2026-12-10'),

(2, 'Urban Garden Project',
 'Create a sustainable community garden.',
 'Rexburg, Idaho', '2026-11-22'),

(2, 'Tree Planting Day',
 'Plant trees in local neighborhoods.',
 'Idaho Falls, Idaho', '2026-11-28'),

(2, 'Sustainable Farming Workshop',
 'Teach sustainable farming techniques.',
 'Rigby, Idaho', '2026-12-03'),

(2, 'Community Composting Program',
 'Promote composting and waste reduction.',
 'Sugar City, Idaho', '2026-12-08'),

(2, 'School Vegetable Garden',
 'Create a vegetable garden for students.',
 'Rexburg, Idaho', '2026-12-15'),

(3, 'Food Donation Drive',
 'Collect food for families in need.',
 'Rexburg, Idaho', '2026-11-21'),

(3, 'Winter Clothing Collection',
 'Collect warm clothing for local families.',
 'Idaho Falls, Idaho', '2026-11-27'),

(3, 'Senior Citizen Assistance',
 'Help elderly residents with daily tasks.',
 'Rigby, Idaho', '2026-12-02'),

(3, 'Community Health Fair',
 'Organize a free community health event.',
 'Sugar City, Idaho', '2026-12-09'),

(3, 'Holiday Gift Donation',
 'Collect holiday gifts for children.',
 'Rexburg, Idaho', '2026-12-18');
