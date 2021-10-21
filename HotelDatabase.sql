DROP TABLE cancellations;
DROP TABLE reservations;
DROP TABLE services;
DROP TABLE h_customers;
DROP TABLE rooms;
DROP TABLE hotels;

DROP SEQUENCE hotel_seq;
DROP SEQUENCE room_seq;
DROP SEQUENCE cust_seq;
DROP SEQUENCE reserv_seq;
DROP SEQUENCE serv_seq;
DROP SEQUENCE cancel_seq;


CREATE TABLE hotels
(
    hotel_id            number          NOT NULL,
    hotel_address       VARCHAR2(64)    NOT NULL,
    hotel_city          VARCHAR2(64)    NOT NULL,
             hotel_state         VARCHAR2(32)    NOT NULL,
    hotel_zipcode       VARCHAR2(32)    NOT NULL,
    hotel_phone         VARCHAR2(32),
    hotel_is_sold       NUMBER(1),
    hotel_name          VARCHAR2(64),
    Single_room        NUMBER,
    Double_room        NUMBER,
    Suite_room        NUMBER,
    Conference_room    NUMBER,
    Single_available    number,
    Double_available    number,
    Suite_available    number,
    Conference_available number,

    PRIMARY KEY(hotel_id)
);

--CREATE SEQUENCE hotel_seq INCREMENT BY 1 START WITH 1;

CREATE TABLE rooms
(   
    room_id             NUMBER          NOT NULL,
    room_type           VARCHAR2(35)    NOT NULL,
    room_rate           NUMBER,
    room_available      NUMBER(1)    DEFAULT 0,
    hotel_id            NUMBER          NOT NULL,
    PRIMARY KEY(room_id),
    FOREIGN KEY(hotel_id) REFERENCES hotels(hotel_id)
);

--CREATE SEQUENCE room_seq INCREMENT BY 1 START WITH 100;

CREATE TABLE h_customers
(
    customer_id         NUMBER          NOT NULL,
    customer_first_name VARCHAR2(64),
    customer_last_name  VARCHAR2(64),
    customer_address    VARCHAR2(100),
    customer_phone      VARCHAR2(32),
    PRIMARY KEY(customer_id)
);

--CREATE SEQUENCE cust_seq INCREMENT BY 1 START WITH 1;


CREATE TABLE reservations
(
    reservation_id          NUMBER          NOT NULL,
    hotel_id                NUMBER,
    customer_id             NUMBER,
    room_id                 NUMBER,
    --service_id              NUMBER,
    reservation_date        DATE            NOT NULL,
    start_date              DATE            NOT NULL,
    end_date                DATE            NOT NULL,
    reservation_price       NUMBER,
customer_paid           NUMBER,
    reservation_discount    NUMBER    DEFAULT 0,
    reservation_status varchar2(100)    DEFAULT 'active',
    discount_price NUMBER,
    PRIMARY KEY(reservation_id),
    FOREIGN KEY(hotel_id) REFERENCES hotels(hotel_id),
    FOREIGN KEY(customer_id) REFERENCES h_customers(customer_id),
    FOREIGN KEY(room_id) REFERENCES rooms(room_id)
);

--CREATE SEQUENCE reserv_seq INCREMENT BY 1 START WITH 1;

CREATE TABLE services
(
    service_id          NUMBER          NOT NULL,
    service_type        VARCHAR2(32)    NOT NULL,
    service_price       NUMBER,
    service_date        DATE,
    reservation_id NUMBER,
    FOREIGN KEY (reservation_id) REFERENCES reservations (reservation_id),
    --link services to a reservation
    PRIMARY KEY(service_id)
);

--CREATE SEQUENCE serv_seq INCREMENT BY 1 START WITH 1;


CREATE TABLE cancellations
(
    cancellation_id         NUMBER          NOT NULL,
    reservation_id          NUMBER          NOT NULL,
    hotel_id                NUMBER          NOT NULL,
    customer_id             NUMBER          NOT NULL,
    cancellation_date       DATE            NOT NULL,
    PRIMARY KEY(cancellation_id),
    FOREIGN KEY(reservation_id) REFERENCES reservations(reservation_id),
    FOREIGN KEY(hotel_id) REFERENCES hotels(hotel_id),
    FOREIGN KEY(customer_id) REFERENCES h_customers(customer_id)
);

--CREATE SEQUENCE cancel_seq INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE hotel_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE room_seq INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE cust_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE serv_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE reserv_seq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE cancel_seq INCREMENT BY 1 START WITH 1;


Insert into HOTELS
(hotel_id, hotel_address, hotel_city, hotel_state, hotel_zipcode, hotel_phone, hotel_is_sold, hotel_name)
VALUES (hotel_seq.nextVal, '123 Alpha Street', 'Las Vegas', 'NV', '12345', '321-466-8429', 0, 'The Gambling Den');
INSERT INTO hotels
VALUES(hotel_seq.nextVal, '1000 Beach Dr', 'Wilmington', 'NC', '21250', '301-222-4444', 0, 'Beach Place');
INSERT INTO hotels
VALUES(hotel_seq.nextVal, '1332 Southview Ave', 'Miami', 'FL', '20030', '546-234-8986', 0, 'South Beach Inn');
INSERT INTO hotels
VALUES(hotel_seq.nextVal, '1546 Creek Dr', 'Chicago', 'IL', '32156', '430-789-1290', 0, 'City Stay');

--select * from hotels;


--ROOM ROWS (0 = available, 1 = not available)

Insert into ROOMS 
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'double', 200, 0, 1);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'double', 200, 0, 1);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'single', 100, 0, 1);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'single', 100, 1, 1);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'suite', 500, 0, 1);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'suite', 500, 0, 1);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'conf. room', 1000, 1, 1);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'conf. room', 1000, 0, 1);



Insert into ROOMS 
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'double', 200, 1, 2);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'double', 200, 0, 2);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'single', 100, 0, 2);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'single', 100, 1, 2);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'suite', 500, 1, 2);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'suite', 500, 0, 2);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'conf. room', 1000, 1, 2);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'conf. room', 1000, 0, 2);

Insert into ROOMS 
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'double', 200, 1, 3);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'double', 200, 0, 4);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'single', 100, 0, 3);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'single', 100, 1, 4);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'suite', 500, 1, 3);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'suite', 500, 0, 4);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'conf. room', 1000, 1, 3);
Insert into ROOMS
(room_id, room_type, room_rate, room_available, hotel_id)
VALUES (room_seq.nextVal, 'conf. room', 1000, 0, 4);


--H_CUSTOMERS ROWS
Insert into H_CUSTOMERS
(customer_id, customer_first_name, customer_last_name, customer_address, customer_phone)
VALUES (cust_seq.nextVal, 'Jim', 'Bob', '543 Charlie Street', '123-456-9870');
Insert into H_CUSTOMERS
(customer_id, customer_first_name, customer_last_name, customer_address, customer_phone)
VALUES (cust_seq.nextVal, 'Mary', 'Maryland', '896 Turtle Avenue', '984-322-9621');
Insert into H_CUSTOMERS
(customer_id, customer_first_name, customer_last_name, customer_address, customer_phone)
VALUES (cust_seq.nextVal, 'Lee', 'Antonios', '195 Street', '090-910-8959');


----updated reservation and service inserts

--RESERVATION ROWS
Insert into RESERVATIONS
(reservation_id, hotel_id, customer_id, room_id, reservation_date, start_date, end_date, reservation_price, reservation_discount)
VALUES(reserv_seq.nextVal, 1, 1, 101, TO_DATE('20-JAN-14', 'DD-MON-YY'), TO_DATE('20-MAR-14', 'DD-MON-YY'), TO_DATE('22-MAR-14', 'DD-MON-YY'), 360, 10);
--double room, price 200 per night; reserved 2 months ahead, 10% --discount

Insert into RESERVATIONS
(reservation_id, hotel_id, customer_id, room_id, reservation_date, start_date, end_date, reservation_price, reservation_discount)
VALUES(reserv_seq.nextVal, 1, 2, 101, TO_DATE('20-JAN-14', 'DD-MON-YY'), TO_DATE('25-MAR-14', 'DD-MON-YY'), TO_DATE('27-MAR-14', 'DD-MON-YY'), 360, 10);
--double room, price 200 per night; reserved 2 months ahead, 10% --discount

Insert into RESERVATIONS
(reservation_id, hotel_id, customer_id, room_id, reservation_date, start_date, end_date, reservation_price, reservation_discount)
VALUES(reserv_seq.nextVal, 1, 1, 105, TO_DATE('10-FEB-14', 'DD-MON-YY'), TO_DATE('19-MAR-14', 'DD-MON-YY'), TO_DATE('23-MAR-14', 'DD-MON-YY'), 2000, 0);
--suite room, price 500 per night; NOT reserved 2 months ahead, no discount

Insert into RESERVATIONS
(reservation_id, hotel_id, customer_id, room_id, reservation_date, start_date, end_date, reservation_price, reservation_discount)
VALUES(reserv_seq.nextVal, 2, 3, 109, TO_DATE('10-JUL-14', 'DD-MON-YY'), TO_DATE('12-JUL-14', 'DD-MON-YY'), TO_DATE('21-JUL-14', 'DD-MON-YY'), 4000, 0);
--double room, price 200 per night (during MAY-AUG; $500 per night); NOT reserved 2 months ahead, no discount


--SERVICES ROWS
Insert into SERVICES
(service_id, service_type, service_price, service_date, reservation_id)
VALUES (serv_seq.nextVal, 'Restaurant Services', 20, TO_DATE('21-MAR-14', 'DD-MON-YY'), 1);
Insert into SERVICES
(service_id, service_type, service_price, service_date, reservation_id)
VALUES (serv_seq.nextVal, 'Restaurant Services', 20, TO_DATE('21-MAR-14', 'DD-MON-YY'), 3);
Insert into SERVICES
(service_id, service_type, service_price, service_date, reservation_id)
VALUES (serv_seq.nextVal, 'Pay-per-view movie', 5, TO_DATE('26-MAR-14', 'DD-MON-YY'), 2);
Insert into SERVICES
(service_id, service_type, service_price, service_date, reservation_id)
VALUES (serv_seq.nextVal, 'Laundry Services', 10, TO_DATE('20-JUL-14', 'DD-MON-YY'), 4);
Insert into SERVICES
(service_id, service_type, service_price, service_date, reservation_id)
VALUES (serv_seq.nextVal, 'Restaurant Services', 20, TO_DATE('18-JUL-14', 'DD-MON-YY'), 4);



--CANCELLATIONS ROWS
Insert into CANCELLATIONS
(cancellation_id, reservation_id, hotel_id, customer_id, cancellation_date)
VALUES (cancel_seq.nextVal, 2, 1, 1, TO_DATE('12-MAY-14', 'DD-MON-YY'));
