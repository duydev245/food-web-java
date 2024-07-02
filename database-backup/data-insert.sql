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


INSERT INTO Dishes ([name], price, [status], [description], [category], [calories], [image], [recipe])
VALUES 
('Cold-Pressed Juice Variety Pack', 10.99, 1, 'Drink the rainbow with our variety pack of refreshing cold-pressed juices.', 'Juice', '110', 'https://images.everyplate.com/c_fillf_autofl_lossyh_398q_autow_1152/everyplate_s3/image/cold-pressed-juice-variety-pack-7a1e2a5d.jpg', 'Apple Juice, Kale Juice, Lemon Juice, Wheatgrass Juice'),
('Summer Refresher Variety Pack', 9.99, 1, 'Quench your thirst in the most delicious way with these invigorating refreshers in two great flavors.', 'Juice', '90', 'https://images.everyplate.com/c_fillf_autofl_lossyh_398q_autow_1152/everyplate_s3/image/664bdf835e4dc3c6a6a93bf9-0d42242b.jpeg', 'Watermelon Juice, Pineapple Juice, Lime Juice, Basil Juice'),
('Mint Lemonade Refresher', 8.99, 1, 'Quench your thirst in the most delicious way with these tangy lemon and invigorating mint refreshers.', 'Juice', '150', 'https://images.everyplate.com/c_fillf_autofl_lossyh_398q_autow_1152/everyplate_s3/image/664bdc835e4dc3c6a6a93bf3-b3b9ce31.jpeg', 'Apple Juice, Pineapple Juice, Lemon Juice, Mint Juice, Ascorbic Acid'),
('Watermelon Lime Refresher', 8.99, 1, 'Quench your thirst in the most delicious way with these juicy watermelon and zesty lime refreshers.', 'Juice', '90', 'https://images.everyplate.com/c_fillf_autofl_lossyh_398q_autow_1152/everyplate_s3/image/664bdec96dac4f56a869fe91-928fc0d7.jpeg', 'Watermelon Juice, Pineapple Juice, Lime Juice, Basil Juice'),
('Carrot Orange Ginger Juice', 7.99, 1, 'Stay hydrated while getting a dose of vitamins with a refreshing cold-pressed juice.', 'Juice', '90', 'https://images.everyplate.com/c_fillf_autofl_lossyh_398q_autow_1152/everyplate_s3/image/carrot-orange-ginger-juice-633895cc.jpg', 'Carrot Juice, Apple Juice, Orange Juice, Lemon Juice, Ginger Juice'),
('Pineapple Turmeric Basil Juice', 7.99, 1, 'Wouldn’t it be nice to have a refreshing cold-pressed juice waiting for you in the fridge?', 'Juice', '110', 'https://images.everyplate.com/c_fillf_autofl_lossyh_398q_autow_1152/everyplate_s3/image/pineapple-turmeric-juice-w11-7585adae.jpg', 'Pineapple Juice, Celery Juice, Apple Juice, Basil Juice, Turmeric Juice'),
('Apple Beet Ginger Juice', 7.99, 1, 'Give your day a quick boost with a refreshing cold-pressed juice.', 'Juice', '100', 'https://images.everyplate.com/c_fillf_autofl_lossyh_398q_autow_1152/everyplate_s3/image/apple-beet-ginger-juice-w11-d99f21c7.jpg', 'Apple Juice, Beet Juice, Ginger Juice'),
('Apple Kale Wheatgrass Juice', 7.99, 1, 'It’s easy being green with this refreshing cold-pressed juice.', 'Juice', '110', 'https://images.everyplate.com/c_fillf_autofl_lossyh_398q_autow_1152/everyplate_s3/image/apple-kale-wheatgrass-juice-w11-e4c44848.jpg', 'Apple Juice, Kale Juice, Lemon Juice, Wheatgrass Juice');

