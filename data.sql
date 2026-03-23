-- ============================================
-- SAMPLE DATA: RIDE-HAILING DATABASE
-- ============================================

-- ============================================
-- INSERT RIDERS (15 riders)
-- ============================================
INSERT INTO riders VALUES (1,  'Rahul Sharma',   'Delhi',     '9811001100', '2022-03-15', 45);
INSERT INTO riders VALUES (2,  'Priya Singh',    'Mumbai',    '9822002200', '2021-07-20', 78);
INSERT INTO riders VALUES (3,  'Amit Verma',     'Bangalore', '9833003300', '2023-01-10', 23);
INSERT INTO riders VALUES (4,  'Sneha Patel',    'Delhi',     '9844004400', '2022-11-05', 60);
INSERT INTO riders VALUES (5,  'Rohit Gupta',    'Hyderabad', '9855005500', '2021-05-18', 112);
INSERT INTO riders VALUES (6,  'Anjali Rao',     'Bangalore', '9866006600', '2023-06-30', 15);
INSERT INTO riders VALUES (7,  'Vikas Kumar',    'Delhi',     '9877007700', '2020-09-12', 200);
INSERT INTO riders VALUES (8,  'Meena Joshi',    'Mumbai',    '9888008800', '2022-02-28', 34);
INSERT INTO riders VALUES (9,  'Suresh Nair',    'Chennai',   '9899009900', '2021-12-01', 88);
INSERT INTO riders VALUES (10, 'Divya Menon',    'Hyderabad', '9810001000', '2023-03-14', 9);
INSERT INTO riders VALUES (11, 'Arjun Das',      'Kolkata',   '9821002100', '2022-08-22', 56);
INSERT INTO riders VALUES (12, 'Kavya Iyer',     'Chennai',   '9832003200', '2021-04-17', 143);
INSERT INTO riders VALUES (13, 'Nikhil Shah',    'Mumbai',    '9843004300', '2023-07-01', 7);
INSERT INTO riders VALUES (14, 'Pooja Tiwari',   'Delhi',     '9854005400', '2020-11-30', 234);
INSERT INTO riders VALUES (15, 'Siddharth Bose', 'Kolkata',   '9865006500', '2022-05-09', 41);

-- ============================================
-- INSERT DRIVERS (10 drivers)
-- ============================================
INSERT INTO drivers VALUES (1,  'Ravi Yadav',      'Delhi',     'Mini',  1, '2020-01-10', 520);
INSERT INTO drivers VALUES (2,  'Sunil Mishra',    'Mumbai',    'Sedan', 1, '2019-06-15', 870);
INSERT INTO drivers VALUES (3,  'Deepak Singh',    'Bangalore', 'Auto',  1, '2021-03-22', 310);
INSERT INTO drivers VALUES (4,  'Manoj Tiwari',    'Delhi',     'SUV',   1, '2020-09-01', 415);
INSERT INTO drivers VALUES (5,  'Rajesh Kumar',    'Hyderabad', 'Mini',  0, '2018-11-20', 1200);
INSERT INTO drivers VALUES (6,  'Arun Nair',       'Chennai',   'Sedan', 1, '2022-02-14', 180);
INSERT INTO drivers VALUES (7,  'Santosh Reddy',   'Hyderabad', 'Auto',  1, '2021-07-08', 390);
INSERT INTO drivers VALUES (8,  'Mohan Das',       'Kolkata',   'Mini',  1, '2020-04-25', 650);
INSERT INTO drivers VALUES (9,  'Vinod Sharma',    'Mumbai',    'SUV',   0, '2019-08-30', 980);
INSERT INTO drivers VALUES (10, 'Prakash Pillai',  'Chennai',   'Mini',  1, '2022-12-01', 95);

-- ============================================
-- INSERT TRIPS (25 trips)
-- ============================================
INSERT INTO trips VALUES (1,  1,  1,  'Connaught Place',   'Lajpat Nagar',   '2024-01-05', 8.5,  180.0,  'Completed', 'Mini');
INSERT INTO trips VALUES (2,  2,  2,  'Bandra',            'Andheri',        '2024-01-06', 12.0, 320.0,  'Completed', 'Sedan');
INSERT INTO trips VALUES (3,  3,  3,  'Indiranagar',       'Whitefield',     '2024-01-07', 15.3, 220.0,  'Completed', 'Auto');
INSERT INTO trips VALUES (4,  4,  4,  'Dwarka',            'Noida Sector 18','2024-01-08', 25.0, 650.0,  'Completed', 'SUV');
INSERT INTO trips VALUES (5,  5,  5,  'Banjara Hills',     'HITEC City',     '2024-01-09', 9.2,  200.0,  'Cancelled', 'Mini');
INSERT INTO trips VALUES (6,  6,  6,  'Anna Nagar',        'T. Nagar',       '2024-01-10', 7.5,  150.0,  'Completed', 'Sedan');
INSERT INTO trips VALUES (7,  7,  7,  'Jubilee Hills',     'Madhapur',       '2024-01-11', 5.0,  110.0,  'Completed', 'Auto');
INSERT INTO trips VALUES (8,  8,  8,  'Salt Lake',         'Park Street',    '2024-01-12', 11.0, 240.0,  'Completed', 'Mini');
INSERT INTO trips VALUES (9,  9,  9,  'Juhu',              'Lower Parel',    '2024-01-13', 18.0, 480.0,  'Completed', 'SUV');
INSERT INTO trips VALUES (10, 10, 10, 'Madhapur',          'Secunderabad',   '2024-01-14', 20.0, 350.0,  'Cancelled', 'Mini');
INSERT INTO trips VALUES (11, 11, 1,  'Karol Bagh',        'Saket',          '2024-02-01', 14.0, 310.0,  'Completed', 'Mini');
INSERT INTO trips VALUES (12, 12, 2,  'Powai',             'Dadar',          '2024-02-02', 16.5, 420.0,  'Completed', 'Sedan');
INSERT INTO trips VALUES (13, 13, 3,  'Koramangala',       'Electronic City','2024-02-03', 22.0, 300.0,  'Completed', 'Auto');
INSERT INTO trips VALUES (14, 14, 4,  'Rohini',            'Gurugram',       '2024-02-04', 35.0, 900.0,  'Completed', 'SUV');
INSERT INTO trips VALUES (15, 15, 8,  'Howrah',            'Ballygunge',     '2024-02-05', 13.0, 270.0,  'Completed', 'Mini');
INSERT INTO trips VALUES (16, 1,  6,  'Adyar',             'Velachery',      '2024-02-10', 8.0,  160.0,  'Completed', 'Sedan');
INSERT INTO trips VALUES (17, 2,  7,  'Gachibowli',        'LB Nagar',       '2024-02-11', 19.0, 330.0,  'Completed', 'Auto');
INSERT INTO trips VALUES (18, 3,  1,  'South Extension',   'Vasant Kunj',    '2024-02-12', 10.0, 220.0,  'Completed', 'Mini');
INSERT INTO trips VALUES (19, 4,  2,  'Versova',           'Churchgate',     '2024-02-13', 21.0, 560.0,  'Cancelled', 'Sedan');
INSERT INTO trips VALUES (20, 5,  10, 'Ameerpet',          'Dilsukhnagar',   '2024-02-14', 11.5, 210.0,  'Completed', 'Mini');
INSERT INTO trips VALUES (21, 6,  3,  'HSR Layout',        'MG Road',        '2024-03-01', 9.0,  180.0,  'Completed', 'Auto');
INSERT INTO trips VALUES (22, 7,  4,  'Pitampura',         'Sahibabad',      '2024-03-02', 28.0, 720.0,  'Completed', 'SUV');
INSERT INTO trips VALUES (23, 8,  8,  'New Town',          'Esplanade',      '2024-03-03', 17.0, 360.0,  'Completed', 'Mini');
INSERT INTO trips VALUES (24, 9,  6,  'Nungambakkam',      'Guindy',         '2024-03-04', 12.0, 240.0,  'Completed', 'Sedan');
INSERT INTO trips VALUES (25, 10, 7,  'Kondapur',          'Kukatpally',     '2024-03-05', 7.0,  130.0,  'Completed', 'Auto');

-- ============================================
-- INSERT PAYMENTS
-- ============================================
INSERT INTO payments VALUES (1,  1,  'UPI',    180.0, 'Success', '2024-01-05');
INSERT INTO payments VALUES (2,  2,  'Card',   320.0, 'Success', '2024-01-06');
INSERT INTO payments VALUES (3,  3,  'Cash',   220.0, 'Success', '2024-01-07');
INSERT INTO payments VALUES (4,  4,  'UPI',    650.0, 'Success', '2024-01-08');
INSERT INTO payments VALUES (5,  5,  'Wallet', 200.0, 'Failed',  '2024-01-09');
INSERT INTO payments VALUES (6,  6,  'UPI',    150.0, 'Success', '2024-01-10');
INSERT INTO payments VALUES (7,  7,  'Cash',   110.0, 'Success', '2024-01-11');
INSERT INTO payments VALUES (8,  8,  'Card',   240.0, 'Success', '2024-01-12');
INSERT INTO payments VALUES (9,  9,  'UPI',    480.0, 'Success', '2024-01-13');
INSERT INTO payments VALUES (10, 10, 'Wallet', 350.0, 'Pending', '2024-01-14');
INSERT INTO payments VALUES (11, 11, 'UPI',    310.0, 'Success', '2024-02-01');
INSERT INTO payments VALUES (12, 12, 'Card',   420.0, 'Success', '2024-02-02');
INSERT INTO payments VALUES (13, 13, 'Cash',   300.0, 'Success', '2024-02-03');
INSERT INTO payments VALUES (14, 14, 'UPI',    900.0, 'Success', '2024-02-04');
INSERT INTO payments VALUES (15, 15, 'Cash',   270.0, 'Success', '2024-02-05');
INSERT INTO payments VALUES (16, 16, 'UPI',    160.0, 'Success', '2024-02-10');
INSERT INTO payments VALUES (17, 17, 'Wallet', 330.0, 'Success', '2024-02-11');
INSERT INTO payments VALUES (18, 18, 'UPI',    220.0, 'Success', '2024-02-12');
INSERT INTO payments VALUES (19, 19, 'Card',   560.0, 'Failed',  '2024-02-13');
INSERT INTO payments VALUES (20, 20, 'UPI',    210.0, 'Success', '2024-02-14');
INSERT INTO payments VALUES (21, 21, 'Cash',   180.0, 'Success', '2024-03-01');
INSERT INTO payments VALUES (22, 22, 'UPI',    720.0, 'Success', '2024-03-02');
INSERT INTO payments VALUES (23, 23, 'Card',   360.0, 'Success', '2024-03-03');
INSERT INTO payments VALUES (24, 24, 'UPI',    240.0, 'Success', '2024-03-04');
INSERT INTO payments VALUES (25, 25, 'Wallet', 130.0, 'Success', '2024-03-05');

-- ============================================
-- INSERT RATINGS
-- ============================================
INSERT INTO ratings VALUES (1,  1,  4.5, 4.0, 'Smooth ride');
INSERT INTO ratings VALUES (2,  2,  5.0, 4.5, 'Excellent driver');
INSERT INTO ratings VALUES (3,  3,  3.5, 4.0, 'Average experience');
INSERT INTO ratings VALUES (4,  4,  4.0, 3.5, 'Good but took longer route');
INSERT INTO ratings VALUES (6,  6,  5.0, 5.0, 'Perfect!');
INSERT INTO ratings VALUES (7,  7,  4.0, 4.5, 'Very punctual');
INSERT INTO ratings VALUES (8,  8,  3.0, 3.5, 'Car was not clean');
INSERT INTO ratings VALUES (9,  9,  4.5, 4.0, 'Comfortable SUV');
INSERT INTO ratings VALUES (11, 11, 4.0, 4.0, 'Good experience');
INSERT INTO ratings VALUES (12, 12, 5.0, 4.5, 'Very professional');
INSERT INTO ratings VALUES (13, 13, 3.5, 3.0, 'Driver was rude');
INSERT INTO ratings VALUES (14, 14, 4.5, 5.0, 'Best ride ever!');
INSERT INTO ratings VALUES (15, 15, 4.0, 4.0, 'Comfortable');
INSERT INTO ratings VALUES (16, 16, 5.0, 4.5, 'On time');
INSERT INTO ratings VALUES (17, 17, 4.0, 3.5, 'Okay ride');
INSERT INTO ratings VALUES (18, 18, 4.5, 4.0, 'Clean car');
INSERT INTO ratings VALUES (20, 20, 3.5, 4.0, 'Little late');
INSERT INTO ratings VALUES (21, 21, 4.0, 4.5, 'Smooth');
INSERT INTO ratings VALUES (22, 22, 5.0, 5.0, 'Wonderful experience');
INSERT INTO ratings VALUES (23, 23, 4.0, 4.0, 'Good');
INSERT INTO ratings VALUES (24, 24, 4.5, 4.5, 'Great driver');
INSERT INTO ratings VALUES (25, 25, 3.0, 3.5, 'Okay');
