-- ============================================================
--  E-Commerce Platform with Warehouse & Delivery Management — INSERT SCRIPTS (PostgreSQL)
--  IT214 - Database Management System
--  Dhirubhai Ambani University | Academic Year 2026
-- ============================================================

-- -------------------------
-- USER
-- -------------------------
INSERT INTO "User" (user_id, name, designation, password) VALUES
(1,  'Aarav Shah',      'customer',   'hash_aarav'),
(2,  'Priya Mehta',     'customer',   'hash_priya'),
(3,  'Rohan Patel',     'customer',   'hash_rohan'),
(4,  'Sneha Joshi',     'customer',   'hash_sneha'),
(5,  'Karan Desai',     'customer',   'hash_karan'),
(6,  'Ananya Rao',      'customer',   'hash_ananya'),
(7,  'Vikram Nair',     'customer',   'hash_vikram'),
(8,  'Pooja Iyer',      'customer',   'hash_pooja'),
(9,  'Arjun Gupta',     'customer',   'hash_arjun'),
(10, 'Meera Sharma',    'customer',   'hash_meera'),
(11, 'Dev Chopra',      'customer',   'hash_dev'),
(12, 'Isha Verma',      'customer',   'hash_isha'),
(13, 'Nikhil Bose',     'customer',   'hash_nikhil'),
(14, 'Tanvi Singh',     'customer',   'hash_tanvi'),
(15, 'Raj Kumar',       'customer',   'hash_raj'),
(16, 'Admin One',       'admin',      'hash_admin1'),
(17, 'Admin Two',       'admin',      'hash_admin2');


-- -------------------------
-- CUSTOMER
-- -------------------------
INSERT INTO customer (customer_id, user_id, email, phone, address, age) VALUES
(1,  1,  'aarav@email.com',   '9000000001', '12 MG Road, Ahmedabad',      24),
(2,  2,  'priya@email.com',   '9000000002', '45 Park St, Mumbai',          31),
(3,  3,  'rohan@email.com',   '9000000003', '7 Lake View, Pune',           27),
(4,  4,  'sneha@email.com',   '9000000004', '89 NH-8, Delhi',              22),
(5,  5,  'karan@email.com',   '9000000005', '3 Ring Rd, Surat',            35),
(6,  6,  'ananya@email.com',  '9000000006', '56 Brigade Rd, Bangalore',    29),
(7,  7,  'vikram@email.com',  '9000000007', '10 Anna Salai, Chennai',      40),
(8,  8,  'pooja@email.com',   '9000000008', '22 Banjara Hills, Hyderabad', 26),
(9,  9,  'arjun@email.com',   '9000000009', '11 Civil Lines, Jaipur',      33),
(10, 10, 'meera@email.com',   '9000000010', '5 Race Course, Indore',       28),
(11, 11, 'dev@email.com',     '9000000011', '67 GT Rd, Kolkata',           45),
(12, 12, 'isha@email.com',    '9000000012', '9 Sector 17, Chandigarh',     23),
(13, 13, 'nikhil@email.com',  '9000000013', '33 MG Marg, Lucknow',         38),
(14, 14, 'tanvi@email.com',   '9000000014', '77 FC Rd, Nagpur',            30),
(15, 15, 'raj@email.com',     '9000000015', '2 Residency Rd, Vadodara',    36);



-- -------------------------
-- ADMIN
-- -------------------------
INSERT INTO admin (admin_id, user_id) VALUES
(1, 16),
(2, 17);



-- -------------------------
-- VENDOR
-- -------------------------
INSERT INTO vendor (vendor_id, email, phone, bank_info, rating) VALUES
(1,  'vendor_alpha@biz.com',   '8000000001', 'HDFC-ACC-1001', 4.5),
(2,  'vendor_beta@biz.com',    '8000000002', 'ICICI-ACC-1002', 4.2),
(3,  'vendor_gamma@biz.com',   '8000000003', 'SBI-ACC-1003',   3.8),
(4,  'vendor_delta@biz.com',   '8000000004', 'AXIS-ACC-1004',  4.7),
(5,  'vendor_epsilon@biz.com', '8000000005', 'HDFC-ACC-1005',  4.0),
(6,  'vendor_zeta@biz.com',    '8000000006', 'PNB-ACC-1006',   3.5),
(7,  'vendor_eta@biz.com',     '8000000007', 'BOB-ACC-1007',   4.9),
(8,  'vendor_theta@biz.com',   '8000000008', 'SBI-ACC-1008',   4.1),
(9,  'vendor_iota@biz.com',    '8000000009', 'ICICI-ACC-1009', 3.9),
(10, 'vendor_kappa@biz.com',   '8000000010', 'HDFC-ACC-1010',  4.6),
(11, 'vendor_lambda@biz.com',  '8000000011', 'AXIS-ACC-1011',  4.3),
(12, 'vendor_mu@biz.com',      '8000000012', 'SBI-ACC-1012',   3.7),
(13, 'vendor_nu@biz.com',      '8000000013', 'PNB-ACC-1013',   4.8),
(14, 'vendor_xi@biz.com',      '8000000014', 'BOB-ACC-1014',   4.4),
(15, 'vendor_omicron@biz.com', '8000000015', 'HDFC-ACC-1015',  4.0);



-- -------------------------
-- CATEGORY
-- -------------------------
INSERT INTO category (category_id, cat_name, parent_cat_id) VALUES
(1,  'Electronics',       NULL),
(2,  'Clothing',          NULL),
(3,  'Grocery',           NULL),
(4,  'Furniture',         NULL),
(5,  'Sports',            NULL),
(6,  'Mobile Phones',     1),
(7,  'Laptops',           1),
(8,  'Headphones',        1),
(9,  'Men\'s Wear',       2),
(10, 'Women\'s Wear',     2),
(11, 'Dairy',             3),
(12, 'Snacks',            3),
(13, 'Office Furniture',  4),
(14, 'Home Furniture',    4),
(15, 'Cricket',           5),
(16, 'Football',          5);



-- -------------------------
-- PRODUCT
-- -------------------------
INSERT INTO product (product_id, p_name, description, base_price, current_price, category_id, vendor_id) VALUES
(1,  'Samsung Galaxy S24',    '6.2" AMOLED, 256GB',          65000, 62000, 6,  1),
(2,  'iPhone 15',             '6.1" Super Retina, 128GB',     79000, 76000, 6,  2),
(3,  'Dell XPS 15',           '15" OLED, i7, 16GB RAM',       115000,109000, 7, 3),
(4,  'MacBook Air M3',        '13" Liquid Retina, 8GB RAM',   99000, 95000, 7,  4),
(5,  'Sony WH-1000XM5',       'ANC Wireless Headphones',      25000, 22000, 8,  5),
(6,  'Levi\'s 511 Jeans',     'Slim Fit, Dark Blue',          3500,  3000,  9,  6),
(7,  'Nike Running Shoes',    'Air Zoom, Size 8-12',          8000,  7200,  5,  7),
(8,  'Amul Butter 500g',      'Pasteurised Salted Butter',    280,   265,   11, 8),
(9,  'Lay\'s Classic 100g',   'Salted Potato Chips',          20,    18,    12, 9),
(10, 'Office Chair Ergo',     'Mesh back, Adjustable',        12000, 10500, 13, 10),
(11, 'Wooden Dining Table',   '6-seater, Teak Wood',          35000, 32000, 14, 11),
(12, 'SG Cricket Bat',        'Kashmir Willow, Full Size',    2500,  2200,  15, 12),
(13, 'Adidas Football',       'Size 5, FIFA Approved',        1800,  1600,  16, 13),
(14, 'Zara Women Kurti',      'Cotton, Floral Print',         1500,  1300,  10, 14),
(15, 'boAt Airdopes 141',     'TWS Earbuds, 42hr Battery',    1299,  1099,  8,  15),
(16, 'OnePlus 12',            '6.82" LTPO, 256GB',            64999, 61000, 6,  1),
(17, 'HP Pavilion 15',        '15.6" FHD, Ryzen 5, 8GB',     55000, 51000, 7,  2),
(18, 'Peter England Shirt',   'Formal, Full Sleeve',          1800,  1500,  9,  6),
(19, 'Tata Salt 1kg',         'Iodised Salt',                 20,    18,    3,  8),
(20, 'Godrej Bookshelf',      '5-shelf, Metal Frame',         8000,  7000,  13, 10);



-- -------------------------
-- WAREHOUSE
-- -------------------------
INSERT INTO warehouse (warehouse_id, w_name, location, region) VALUES
(1,  'WH North Delhi',    'Rohini, Delhi',          'North'),
(2,  'WH South Mumbai',   'Worli, Mumbai',           'West'),
(3,  'WH East Kolkata',   'Salt Lake, Kolkata',      'East'),
(4,  'WH South Chennai',  'Guindy, Chennai',         'South'),
(5,  'WH Central Nagpur', 'Sitabuldi, Nagpur',       'Central'),
(6,  'WH West Surat',     'Udhna, Surat',            'West'),
(7,  'WH North Jaipur',   'Mansarovar, Jaipur',      'North'),
(8,  'WH South Bangalore','Electronic City, Blore',  'South'),
(9,  'WH East Bhubaneswar','Patia, Bhubaneswar',     'East'),
(10, 'WH Central Indore', 'Vijay Nagar, Indore',     'Central'),
(11, 'WH North Chandigarh','Industrial Area, Chd',   'North'),
(12, 'WH West Ahmedabad', 'Naroda, Ahmedabad',       'West'),
(13, 'WH South Hyderabad','Medchal, Hyderabad',      'South'),
(14, 'WH East Guwahati',  'Beltola, Guwahati',       'East'),
(15, 'WH Central Bhopal', 'Govindpura, Bhopal',      'Central');



-- -------------------------
-- WAREHOUSE_MANAGER
-- -------------------------
INSERT INTO warehouse_manager (mgr_id, mgr_email, warehouse_id) VALUES
(1,  'mgr.delhi@wms.com',      1),
(2,  'mgr.mumbai@wms.com',     2),
(3,  'mgr.kolkata@wms.com',    3),
(4,  'mgr.chennai@wms.com',    4),
(5,  'mgr.nagpur@wms.com',     5),
(6,  'mgr.surat@wms.com',      6),
(7,  'mgr.jaipur@wms.com',     7),
(8,  'mgr.bangalore@wms.com',  8),
(9,  'mgr.bhubaneswar@wms.com',9),
(10, 'mgr.indore@wms.com',     10),
(11, 'mgr.chandigarh@wms.com', 11),
(12, 'mgr.ahmedabad@wms.com',  12),
(13, 'mgr.hyderabad@wms.com',  13),
(14, 'mgr.guwahati@wms.com',   14),
(15, 'mgr.bhopal@wms.com',     15);



-- -------------------------
-- INVENTORY
-- -------------------------
INSERT INTO inventory (product_id, warehouse_id, stock) VALUES
(1,  1, 120), (1,  2, 80),  (1,  8, 60),
(2,  2, 95),  (2,  4, 45),  (2, 13, 30),
(3,  1, 40),  (3,  3, 25),
(4,  2, 55),  (4,  8, 70),
(5,  5, 200), (5,  6, 150),
(6,  1, 300), (6,  7, 250), (6, 12, 180),
(7,  7, 400), (7,  8, 320),
(8,  3, 600), (8,  9, 500), (8, 14, 450),
(9,  5, 1000),(9, 10, 800), (9, 15, 750),
(10, 1, 50),  (10, 2, 35),
(11, 4, 20),  (11, 8, 15),
(12, 7, 180), (12,11, 150),
(13, 6, 220), (13,12, 190),
(14, 4, 260), (14,13, 210),
(15, 2, 500), (15, 6, 420), (15,12, 380),
(16, 1, 90),  (16, 8, 75),
(17, 3, 60),  (17, 9, 48),
(18, 7, 340), (18,11, 290),
(19, 5, 2000),(19,10, 1800),
(20, 2, 30),  (20, 4, 22);



-- -------------------------
-- ORDERS
-- -------------------------
INSERT INTO orders (order_id, order_date, status, total_amount, customer_id) VALUES
(1,  '2025-01-05', 'delivered',  62000,  1),
(2,  '2025-01-12', 'delivered',  76000,  2),
(3,  '2025-01-20', 'delivered',  109000, 3),
(4,  '2025-02-03', 'delivered',  3000,   4),
(5,  '2025-02-14', 'delivered',  22000,  5),
(6,  '2025-02-22', 'cancelled',  7200,   6),
(7,  '2025-03-01', 'delivered',  2200,   7),
(8,  '2025-03-10', 'delivered',  265,    8),
(9,  '2025-03-18', 'returned',   10500,  9),
(10, '2025-03-25', 'delivered',  32000,  10),
(11, '2025-04-02', 'delivered',  1099,   11),
(12, '2025-04-10', 'processing', 61000,  12),
(13, '2025-04-11', 'shipped',    51000,  13),
(14, '2025-04-12', 'processing', 1600,   14),
(15, '2025-04-13', 'pending',    18,     15),
(16, '2025-01-28', 'delivered',  95000,  1),
(17, '2025-02-08', 'delivered',  1300,   2),
(18, '2025-02-19', 'delivered',  1500,   3),
(19, '2025-03-05', 'returned',   62000,  4),
(20, '2025-03-30', 'delivered',  7000,   5);



-- -------------------------
-- ORDER_ITEM
-- -------------------------
INSERT INTO order_item (order_id, item_no, product_id, quantity, unit_price) VALUES
(1,  1, 1,  1, 62000),
(2,  1, 2,  1, 76000),
(3,  1, 3,  1, 109000),
(4,  1, 6,  1, 3000),
(5,  1, 5,  1, 22000),
(6,  1, 7,  1, 7200),
(7,  1, 12, 1, 2200),
(8,  1, 8,  1, 265),
(9,  1, 10, 1, 10500),
(10, 1, 11, 1, 32000),
(11, 1, 15, 1, 1099),
(12, 1, 16, 1, 61000),
(13, 1, 17, 1, 51000),
(14, 1, 13, 1, 1600),
(15, 1, 9,  1, 18),
(16, 1, 4,  1, 95000),
(17, 1, 14, 1, 1300),
(18, 1, 18, 1, 1500),
(19, 1, 1,  1, 62000),
(20, 1, 20, 1, 7000),
(1,  2, 15, 2, 1099),
(3,  2, 5,  1, 22000),
(10, 2, 6,  2, 3000),
(16, 2, 15, 3, 1099);



-- -------------------------
-- PAYMENT
-- -------------------------
INSERT INTO payment (payment_id, method, status, amount, paid_at, order_id) VALUES
(1,  'UPI',          'completed', 62000,  '2025-01-05 10:15:00', 1),
(2,  'Credit Card',  'completed', 76000,  '2025-01-12 14:22:00', 2),
(3,  'Net Banking',  'completed', 109000, '2025-01-20 09:05:00', 3),
(4,  'UPI',          'completed', 3000,   '2025-02-03 11:30:00', 4),
(5,  'Debit Card',   'completed', 22000,  '2025-02-14 16:45:00', 5),
(6,  'UPI',          'refunded',  7200,   '2025-02-22 13:00:00', 6),
(7,  'Credit Card',  'completed', 2200,   '2025-03-01 08:20:00', 7),
(8,  'COD',          'completed', 265,    '2025-03-10 17:10:00', 8),
(9,  'Net Banking',  'refunded',  10500,  '2025-03-18 12:00:00', 9),
(10, 'UPI',          'completed', 32000,  '2025-03-25 15:30:00', 10),
(11, 'UPI',          'completed', 1099,   '2025-04-02 10:00:00', 11),
(12, 'Credit Card',  'pending',   61000,  '2025-04-10 09:00:00', 12),
(13, 'Debit Card',   'completed', 51000,  '2025-04-11 11:45:00', 13),
(14, 'UPI',          'pending',   1600,   '2025-04-12 14:00:00', 14),
(15, 'COD',          'pending',   18,     '2025-04-13 08:00:00', 15),
(16, 'Credit Card',  'completed', 95000,  '2025-01-28 10:30:00', 16),
(17, 'UPI',          'completed', 1300,   '2025-02-08 12:00:00', 17),
(18, 'Net Banking',  'completed', 1500,   '2025-02-19 09:15:00', 18),
(19, 'Credit Card',  'refunded',  62000,  '2025-03-05 10:00:00', 19),
(20, 'UPI',          'completed', 7000,   '2025-03-30 16:00:00', 20);



-- -------------------------
-- DELIVERY_AGENT
-- -------------------------
INSERT INTO delivery_agent (agent_id, ag_name, phone, vehicle_type, region) VALUES
(1,  'Ravi Tiwari',    '7000000001', 'Bike',   'North'),
(2,  'Suresh Patil',   '7000000002', 'Van',    'West'),
(3,  'Ajay Das',       '7000000003', 'Truck',  'East'),
(4,  'Mohan Reddy',    '7000000004', 'Bike',   'South'),
(5,  'Sanjay Sharma',  '7000000005', 'Van',    'Central'),
(6,  'Deepak Yadav',   '7000000006', 'Bike',   'West'),
(7,  'Rahul Verma',    '7000000007', 'Truck',  'North'),
(8,  'Anil Kumar',     '7000000008', 'Bike',   'South'),
(9,  'Vikas Singh',    '7000000009', 'Van',    'East'),
(10, 'Pramod Jha',     '7000000010', 'Truck',  'Central'),
(11, 'Sachin More',    '7000000011', 'Bike',   'West'),
(12, 'Kartik Rao',     '7000000012', 'Van',    'South'),
(13, 'Dinesh Gupta',   '7000000013', 'Bike',   'North'),
(14, 'Bharat Mishra',  '7000000014', 'Truck',  'East'),
(15, 'Lokesh Nair',    '7000000015', 'Van',    'Central');



-- -------------------------
-- DELIVERY
-- -------------------------
INSERT INTO delivery (delivery_id, status, est_time, actual_time, tracking_no, order_id, agent_id) VALUES
(1,  'delivered', '2025-01-08 18:00:00', '2025-01-08 17:30:00', 'TRK100001', 1,  1),
(2,  'delivered', '2025-01-15 18:00:00', '2025-01-16 10:00:00', 'TRK100002', 2,  2),
(3,  'delivered', '2025-01-23 18:00:00', '2025-01-23 15:00:00', 'TRK100003', 3,  3),
(4,  'delivered', '2025-02-06 18:00:00', '2025-02-06 14:00:00', 'TRK100004', 4,  4),
(5,  'delivered', '2025-02-17 18:00:00', '2025-02-17 16:30:00', 'TRK100005', 5,  5),
(6,  'cancelled', '2025-02-25 18:00:00', NULL,                  'TRK100006', 6,  6),
(7,  'delivered', '2025-03-04 18:00:00', '2025-03-04 12:00:00', 'TRK100007', 7,  7),
(8,  'delivered', '2025-03-13 18:00:00', '2025-03-13 11:00:00', 'TRK100008', 8,  8),
(9,  'returned',  '2025-03-21 18:00:00', '2025-03-21 09:00:00', 'TRK100009', 9,  9),
(10, 'delivered', '2025-03-28 18:00:00', '2025-03-28 14:00:00', 'TRK100010', 10, 10),
(11, 'delivered', '2025-04-05 18:00:00', '2025-04-05 13:00:00', 'TRK100011', 11, 11),
(12, 'in_transit','2025-04-13 18:00:00', NULL,                  'TRK100012', 12, 1),
(13, 'shipped',   '2025-04-14 18:00:00', NULL,                  'TRK100013', 13, 2),
(14, 'pending',   '2025-04-15 18:00:00', NULL,                  'TRK100014', 14, 3),
(15, 'pending',   '2025-04-16 18:00:00', NULL,                  'TRK100015', 15, 4),
(16, 'delivered', '2025-01-31 18:00:00', '2025-01-31 15:00:00', 'TRK100016', 16, 5),
(17, 'delivered', '2025-02-11 18:00:00', '2025-02-11 11:00:00', 'TRK100017', 17, 6),
(18, 'delivered', '2025-02-22 18:00:00', '2025-02-22 13:30:00', 'TRK100018', 18, 7),
(19, 'returned',  '2025-03-08 18:00:00', '2025-03-08 10:00:00', 'TRK100019', 19, 8),
(20, 'delivered', '2025-04-02 18:00:00', '2025-04-02 16:00:00', 'TRK100020', 20, 9);



-- -------------------------
-- REVIEW
-- -------------------------
INSERT INTO review (review_id, rating, comment, reviewed_on, customer_id, product_id) VALUES
(1,  5, 'Excellent phone, great camera!',         '2025-01-10', 1,  1),
(2,  4, 'Good iPhone but pricey.',                '2025-01-18', 2,  2),
(3,  5, 'Best laptop I have ever used.',          '2025-01-25', 3,  3),
(4,  4, 'MacBook is sleek and fast.',             '2025-02-01', 1,  4),
(5,  5, 'Amazing noise cancellation.',            '2025-02-20', 5,  5),
(6,  3, 'Jeans quality is average.',              '2025-02-10', 4,  6),
(7,  4, 'Comfortable for running.',               '2025-03-05', 6,  7),
(8,  5, 'Fresh and tasty butter.',                '2025-03-15', 8,  8),
(9,  3, 'Chips are okay, nothing special.',       '2025-03-22', 9,  9),
(10, 4, 'Chair is very comfortable for work.',    '2025-03-28', 9,  10),
(11, 5, 'Solid dining table, worth the price.',   '2025-04-01', 10, 11),
(12, 4, 'Good bat for practice.',                 '2025-04-05', 7,  12),
(13, 3, 'Ball loses air quickly.',                '2025-04-06', 14, 13),
(14, 5, 'Beautiful kurti, perfect fit.',          '2025-02-12', 2,  14),
(15, 4, 'Good earbuds for the price.',            '2025-04-07', 11, 15),
(16, 4, 'OnePlus 12 is flagship level.',          '2025-04-12', 12, 16),
(17, 3, 'HP Pavilion heats up quickly.',          '2025-04-12', 13, 17),
(18, 5, 'Love the Peter England shirt.',          '2025-02-25', 3,  18),
(19, 5, 'Standard salt, good quality.',           '2025-01-22', 15, 19),
(20, 4, 'Bookshelf is sturdy and spacious.',      '2025-04-03', 5,  20);




-- -------------------------
-- RETURN_REQUEST
-- -------------------------
INSERT INTO return_request (return_id, reason, status, requested_on, order_id) VALUES
(1,  'Product was defective',         'approved',  '2025-03-20', 9),
(2,  'Wrong item delivered',          'approved',  '2025-03-07', 19),
(3,  'Changed my mind',               'rejected',  '2025-02-25', 6),
(4,  'Item not as described',         'pending',   '2025-04-11', 13),
(5,  'Damaged during delivery',       'approved',  '2025-04-01', 7),
(6,  'Duplicate order placed',        'pending',   '2025-04-12', 14),
(7,  'Better price found elsewhere',  'rejected',  '2025-03-15', 4),
(8,  'Product stopped working',       'approved',  '2025-02-18', 5),
(9,  'Size issue',                    'pending',   '2025-04-10', 17),
(10, 'Packaging was torn',            'approved',  '2025-03-28', 8),
(11, 'Not compatible with device',    'rejected',  '2025-01-30', 2),
(12, 'Color mismatch',                'pending',   '2025-04-13', 20),
(13, 'Expired product',               'approved',  '2025-04-05', 11),
(14, 'Missing accessories',           'pending',   '2025-04-08', 16),
(15, 'Received broken item',          'approved',  '2025-02-06', 3);




-- -------------------------
-- REFUND
-- -------------------------
INSERT INTO refund (refund_id, amount, status, processed_on, return_id) VALUES
(1,  10500, 'completed', '2025-03-25', 1),
(2,  62000, 'completed', '2025-03-12', 2),
(3,  2200,  'completed', '2025-04-05', 5),
(4,  22000, 'completed', '2025-02-24', 8),
(5,  265,   'completed', '2025-04-01', 10),
(6,  1099,  'processing','2025-04-10', 13),
(7,  109000,'processing','2025-04-06', 15),
(8,  95000, 'pending',   NULL,         14),
(9,  1300,  'pending',   NULL,         9),
(10, 7000,  'pending',   NULL,         12);




-- -------------------------
-- COUPON
-- -------------------------
INSERT INTO coupon (coupon_id, code, discount_pct, valid_from, valid_to) VALUES
(1,  'SAVE10',    10.0, '2025-01-01', '2025-03-31'),
(2,  'FLAT20',    20.0, '2025-01-15', '2025-02-28'),
(3,  'FEST25',    25.0, '2025-02-01', '2025-02-15'),
(4,  'SUMMER15',  15.0, '2025-03-01', '2025-05-31'),
(5,  'WELCOME5',   5.0, '2025-01-01', '2025-12-31'),
(6,  'TECH30',    30.0, '2025-01-01', '2025-01-31'),
(7,  'MONSOON10', 10.0, '2025-06-01', '2025-08-31'),
(8,  'DIWALI20',  20.0, '2025-10-01', '2025-10-31'),
(9,  'NEWYR50',   50.0, '2024-12-25', '2025-01-05'),
(10, 'FLASH40',   40.0, '2025-04-10', '2025-04-15'),
(11, 'LOYALTY12', 12.0, '2025-01-01', '2025-12-31'),
(12, 'GROCERY8',   8.0, '2025-01-01', '2025-12-31'),
(13, 'MOBILE18',  18.0, '2025-03-01', '2025-04-30'),
(14, 'FASHION22', 22.0, '2025-02-01', '2025-04-30'),
(15, 'CLEARANCE35',35.0,'2025-04-01', '2025-04-20');




-- -------------------------
-- CAMPAIGN
-- -------------------------
INSERT INTO campaign (campaign_id, c_name, start_date, end_date, target_segment) VALUES
(1,  'New Year Blast',       '2025-01-01', '2025-01-10', 'all'),
(2,  'Valentine Special',    '2025-02-10', '2025-02-15', 'couples'),
(3,  'Tech Week',            '2025-01-20', '2025-01-27', 'tech_buyers'),
(4,  'Summer Sale',          '2025-03-01', '2025-05-31', 'all'),
(5,  'Fashion Fiesta',       '2025-02-01', '2025-02-28', 'fashion_lovers'),
(6,  'Grocery Deals',        '2025-01-01', '2025-12-31', 'household'),
(7,  'Sports Season',        '2025-03-15', '2025-04-15', 'sports_fans'),
(8,  'Monsoon Madness',      '2025-06-01', '2025-08-31', 'all'),
(9,  'Diwali Dhamaka',       '2025-10-01', '2025-10-31', 'all'),
(10, 'Flash Friday',         '2025-04-10', '2025-04-11', 'premium'),
(11, 'Loyalty Rewards',      '2025-01-01', '2025-12-31', 'loyal_customers'),
(12, 'Back to School',       '2025-06-01', '2025-06-30', 'students'),
(13, 'Mobile Mania',         '2025-03-01', '2025-04-30', 'mobile_buyers'),
(14, 'Home Makeover',        '2025-04-01', '2025-04-30', 'home_buyers'),
(15, 'Clearance Carnival',   '2025-04-01', '2025-04-20', 'all');



-- ============================================================
-- END OF INSERT SCRIPTS
-- ============================================================