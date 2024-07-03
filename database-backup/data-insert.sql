INSERT INTO [dbo].[City] (name) 
VALUES 
('Ho Chi Minh City'), 
('Binh Duong'), 
('Dong Nai'), 
('Ba Ria - Vung Tau'), 
('Long An');

INSERT INTO [dbo].[District] (name, city_id) 
VALUES 
-- Districts for Ho Chi Minh City (city_id = 1)
('District 1', 1),
('District 2', 1),
('District 3', 1),
('District 4', 1),
('District 5', 1),

-- Districts for Binh Duong (city_id = 2)
('Thu Dau Mot', 2),
('Di An', 2),

-- Districts for Dong Nai (city_id = 3)
('Bien Hoa', 3),
('Long Khanh', 3),

-- Districts for Ba Ria - Vung Tau (city_id = 4)
('Vung Tau', 4),
('Ba Ria', 4),

-- Districts for Long An (city_id = 5)
('Tan An', 5),
('Kien Tuong', 5);

INSERT INTO [dbo].[Ward] (name, district_id)
VALUES 
-- Wards for District 1 (district_id = 1)
('Ward 1', 1),
('Ward 2', 1),
('Ward 3', 1),

-- Wards for District 2 (district_id = 2)
('Ward 1', 2),
('Ward 2', 2),

-- Wards for Thu Dau Mot (district_id = 6)
('Phu Cuong', 6),
('Chanh Nghia', 6);


INSERT INTO Accounts (full_name, [password], email, phone, [address], ward_id, district_id, city_id, [role], [status]) 
VALUES ('Admin', 'admin', 'sa@gmail.com', '123-456-7890', '123 Admin St', 1, 1, 1, 'admin', 1);
