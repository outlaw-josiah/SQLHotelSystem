DROP TABLE STAFF;
DROP TABLE TRANSACTIONS;
DROP TABLE RESERVATIONS;
DROP TABLE ROOMS;
DROP table GUESTS;
DROP TABLE HOTELS;


CREATE TABLE GUESTS (
GUEST_ID number,
Guest_first_name varchar2(50),
guest_last_name varchar2(50),
GUEST_ADDRESS varchar2(50),
GUEST_CITY varchar2(50),
GUEST_STATE char(2),
PRIMARY KEY(GUEST_ID)
);

CREATE TABLE HOTELS(
HOTEL_ID number,
HOTEL_NAME varchar2(50),
HOTEL_ADDRESS varchar2(50),
HOTEL_CITY varchar2(50),
HOTEL_STATE char(2),
HOTEL_PHONE char(10),
PRIMARY KEY(HOTEL_ID)
);

CREATE TABLE ROOMS(
ROOM_ID number,
HOTEL_ID number,
ROOM_CAPACITY int,
ROOM_RATE number,
READY date,
CLEANED char(1),
SMOKING CHAR(1),
ROOM_TYPE varchar2(50),
PRIMARY KEY(ROOM_ID),
FOREIGN KEY(HOTEL_ID) references HOTELS(HOTEL_ID)
);


CREATE TABLE RESERVATIONS (
RESERVATION_ID number,
ROOM_ID number,
RESERVATION_DATE date,
RESERVATION_CHECK_IN date,
RESERVATION_CHECK_OUT date,
LENGTH_OF_STAY int,
PRIMARY KEY(RESERVATION_ID),
FOREIGN KEY(ROOM_ID) references ROOMS(ROOM_ID)
);


CREATE TABLE TRANSACTIONS(
TRANSACTION_ID number,
GUEST_ID number,
RESERVATION_ID number,
CREDIT_CARD number,
TRANSACTION_TOTAL number,
TRANSACTION_DATE date,
PRIMARY KEY(TRANSACTION_ID),
FOREIGN KEY(GUEST_ID) references GUESTS(GUEST_ID),
FOREIGN KEY(RESERVATION_ID) references RESERVATIONS(RESERVATION_ID)
);



CREATE TABLE STAFF (
STAFF_ID NUMBER    	NOT NULL,
HOTEL_ID NUMBER    	NOT NULL,
STAFF_FIRST_NAME VARCHAR2(50)   NOT NULL,
STAFF_LAST_NAME VARCHAR2(50)	NOT NULL,
STAFF_DEPARTMENT VARCHAR2(50)	NOT NULL,
PRIMARY KEY(STAFF_ID),
FOREIGN KEY(HOTEL_ID) REFERENCES HOTELS(HOTEL_ID)
);




INSERT INTO HOTELS VALUES(1, 'Baltimore Suite', '4500 Old National Pk', 'Baltimore', 'MD', '2405505000');

INSERT INTO HOTELS VALUES(2, 'Oceanside Inn', '156 Baltimore Ave', 'Ocean City', 'MD', '3107705000');

INSERT INTO HOTELS VALUES(3, 'Fredericktowne Inn', '3200 Buckeystown Pk', 'Frederick', 'MD', '3017555000');

INSERT INTO HOTELS VALUES(4, 'Philadelphia Suites', '2500 Liberty Ave', 'Philadelphia', 'PA', '2305555000');


INSERT INTO ROOMS VALUES(101, 1, 4, 300, to_date('2017-10-30','yyyy-mm-dd'), 'y', 'y', 'business');

INSERT INTO ROOMS VALUES(102, 1, 2, 200, to_date('2017-10-31','yyyy-mm-dd'), 'y', 'n', 'economy');

INSERT INTO ROOMS VALUES(103, 2, 4, 300, to_date('2017-11-03','yyyy-mm-dd'), 'y', 'n', 'economy');

INSERT INTO ROOMS VALUES(104, 4, 1, 150, to_date('2017-10-29','yyyy-mm-dd'), 'y', 'n', 'economy');


INSERT INTO STAFF VALUES(601, 1, 'Steve', 'Jenkins', 'Accounting');

INSERT INTO STAFF VALUES(602, 2, 'Ron', 'Babkoff', 'Parks and Rec');

INSERT INTO STAFF VALUES(603, 3, 'Jeremy', 'Jones', 'Human Resources');

INSERT INTO STAFF VALUES(604, 4, 'Jenny', 'Craig', 'Custodial');


INSERT INTO GUESTS VALUES(1, 'Robert', 'Smith', '123 Maple St', 'Philadelphia', 'PA');

INSERT INTO GUESTS VALUES(2, 'Faith', 'Wilson', '9 Main St', 'Mexico', 'MD');

INSERT INTO GUESTS VALUES(3, 'True', 'Grit', '1000 Hilltop Cir', 'Baltimore', 'MD');

INSERT INTO GUESTS VALUES(4, 'Jamie', 'Jefferson', '9301 Dollyhyde Rd', 'Mt. Airy', 'MD');


INSERT INTO RESERVATIONS VALUES(301, 101, to_date('2017-10-01','yyyy-mm-dd'), to_date('2018-01-31','yyyy-mm-dd'), to_date('2018-02-04','yyyy-mm-dd'), 5);

INSERT INTO RESERVATIONS VALUES(302, 102, to_date('2017-10-01','yyyy-mm-dd'), to_date('2018-01-31','yyyy-mm-dd'), to_date('2018-02-04','yyyy-mm-dd'), 8);

INSERT INTO RESERVATIONS VALUES(303, 103, to_date('2017-10-01','yyyy-mm-dd'), to_date('2018-01-31','yyyy-mm-dd'), to_date('2018-02-04','yyyy-mm-dd'), 2);

INSERT INTO RESERVATIONS VALUES(304, 104, to_date('2017-10-01','yyyy-mm-dd'), to_date('2018-01-31','yyyy-mm-dd'), to_date('2018-02-04','yyyy-mm-dd'), 6);



INSERT INTO TRANSACTIONS VALUES(501, 1, 301, 9986, 600, to_date('2017-10-01','yyyy-mm-dd'));

INSERT INTO TRANSACTIONS VALUES(502, 2, 302, 8852, 400, to_date('2017-10-25','yyyy-mm-dd'));

INSERT INTO TRANSACTIONS VALUES(503, 3, 303, 9968, 900, to_date('2017-10-10','yyyy-mm-dd'));

INSERT INTO TRANSACTIONS VALUES(504, 4, 304, 2273, 100, to_date('2017-10-30','yyyy-mm-dd'));
