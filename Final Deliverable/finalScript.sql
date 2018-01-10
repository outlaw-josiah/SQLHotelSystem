--1. add hotels "Jay"
exec add_hotel('H1', '500 5th ave', 'New York', 'NY', '9174302828');

exec add_hotel('H2', '200 E Pratt St', 'Baltimore', 'MD', '4102271422');

exec add_hotel('H3', '355 Powell St', 'San Francisco', 'CA', '4154271400');

exec add_hotel('H4', '160 E Pearson St', 'Chicago', 'IL', '3127871440');

exec add_hotel('HH1', '1050 Park Ave', 'New York', 'NY', '3472123250');

exec add_hotel('HH2', '301 Light st', 'Baltimore', 'MD', '4103042200');

--2. find hotels "Jay"
exec PRINT_HOTEL_INSTATE('CA');

exec PRINT_HOTEL_INSTATE('NY');

Insert into ROOMS values(100, 1, 2, 250, sysdate, 'y', 'n', 'single');
Insert into ROOMS values(110, 1, 4, 400, sysdate, 'y', 'n', 'double');
Insert into ROOMS values(120, 1, 4, 500, sysdate, 'y', 'n', 'suite');
Insert into ROOMS values(200, 2, 2, 200, sysdate, 'y', 'n', 'single');
Insert into ROOMS values(210, 2, 4, 350, sysdate, 'y', 'n', 'double');
Insert into ROOMS values(220, 2, 4, 450, sysdate, 'y', 'n', 'suite');
Insert into ROOMS values(300, 3, 2, 250, sysdate, 'y', 'n', 'single');
Insert into ROOMS values(310, 3, 4, 400, sysdate, 'y', 'n', 'double');
Insert into ROOMS values(320, 3, 4, 500, sysdate, 'y', 'n', 'suite');
Insert into ROOMS values(400, 4, 2, 200, sysdate, 'y', 'y', 'single');
Insert into ROOMS values(410, 4, 4, 350, sysdate, 'y', 'y', 'double');
Insert into ROOMS values(420, 4, 4, 450, sysdate, 'y', 'y', 'suite');
Insert into ROOMS values(500, 5, 2, 200, sysdate, 'y', 'n', 'single');
Insert into ROOMS values(510, 5, 4, 350, sysdate, 'y', 'n', 'double');
Insert into ROOMS values(520, 5, 4, 450, sysdate, 'y', 'n', 'suite');
Insert into ROOMS values(600, 6, 2, 200, sysdate, 'y', 'n', 'single');
Insert into ROOMS values(610, 6, 4, 350, sysdate, 'y', 'n', 'double');
Insert into ROOMS values(620, 6, 4, 450, sysdate, 'y', 'n', 'suite');


Insert into GUESTS values(1, 'John', 'Smith', '123 Maple St.', 'Baltimore', 'MD');
Insert into GUESTS values(2, 'Nina', 'Chase', '21 Main St.', 'Columbus', 'OH');
Insert into GUESTS values(3, 'Pierce', 'Borg', '9901 Lance Rd.', 'Oakland', 'MD');
--3. Sell hotels in CA and IL Jay
exec SELL_HOTEL_BYSTATE('CA');
exec SELL_HOTEL_BYSTATE('IL');

Insert into SERVICES values('Daily Restaurant', 250);
Insert into SERVICES values('Pay-Per-View', 9.99);
Insert into SERVICES values('Laundry', 10);

--4. make reservations Grayson
Execute make_reservation(2, 'John', 'Smith', to_date('08-01-2017','mm-dd-yyyy'), to_date('08-10-2017','mm-dd-yyyy'), 'suite', sysdate);

Execute make_reservation(3, 'John', 'Smith', to_date('08-01-2017','mm-dd-yyyy'), to_date('08-10-2017','mm-dd-yyyy'), null, sysdate);

Execute make_reservation(2, 'John', 'Smith', to_date('02-01-2017','mm-dd-yyyy'), to_date('02-10-2017','mm-dd-yyyy'), 'single', sysdate);

Execute make_reservation(6, 'Nina', 'Chase', to_date('08-01-2017','mm-dd-yyyy'), to_date('08-10-2017','mm-dd-yyyy'), 'double', sysdate);

Execute make_reservation(4, 'Pierce', 'Borg', to_date('02-01-2017','mm-dd-yyyy'), to_date('02-10-2017','mm-dd-yyyy'), 'suite', sysdate);

Execute make_reservation(4, 'Pierce', 'Borg', to_date('03-01-2017','mm-dd-yyyy'), to_date('03-10-2017','mm-dd-yyyy'), 'suite', sysdate);

--5. Find described reservations Josiah
begin
dbms_output.put_line(to_char(FINDRESERVATIONS('Smith',to_date('08-01-2017','mm-dd-yyyy'))));
end;

begin
dbms_output.put_line(to_char(FINDRESERVATIONS('Smith',to_date('02-01-2017','mm-dd-yyyy'))));
end;

begin
dbms_output.put_line(to_char(FINDRESERVATIONS('Borg',to_date('03-01-2017','mm-dd-yyyy'))));
end;
--6. show reservation details for reservations Josiah
begin
PRINTRESERVATION(1);
end;
begin
PRINTRESERVATION(2);
end; 
begin
PRINTRESERVATION(0);
end;
--7. Change reservation date Josiah
begin
CHANGERESERVATION(1,to_date('08-20-17','MM-DD-YY'),to_date('08-25-17','MM-DD-YY'));
end; 
begin
CHANGERESERVATION(2,to_date('09-20-17','MM-DD-YY'),to_date('09-25-17','MM-DD-YY'));
end;

--8. Show reservation details Josiah
begin
PRINTRESERVATION(1);
end;
begin 
PRINTRESERVATION(2);
end;
begin 
PRINTRESERVATION(0);
end;

--9. Cancel Reservations Josiah
begin
CANCELRESERVATION(3);
end;

--10. Cancel Reservation Josiah
begin
CANCELRESERVATION(0);
end;

--11. Add services Grayson
Execute add_service(1, 'Daily Restaurant');

Execute add_service(3, 'Pay-Per-View');

Execute add_service(5, 'Laundry');

--12. Show reservation details Josiah
begin
PRINTRESERVATION(1);
end;
begin
PRINTRESERVATION(2);
end;
begin
PRINTRESERVATION(0);
end;

--13. Change reservation room type Charles
Exec Change_Room_Type(1,'double');

Exec Change_Room_Type(2,'double');

--14. Reservation Details for reservations Josiah
begin
PRINTRESERVATION(1);
end;
begin
PRINTRESERVATION(2);
end;

--15. Show available suite rooms Charles
Exec room_available(2, 'suite', to_date('2017-07-01','yyyy-mm-dd'), to_date('2017-07-30','yyyy-mm-dd'));
--16. Charles 
Exec room_available(2, 'double', to_date('2017-08-01','yyyy-mm-dd'), to_date('2017-08-30','yyyy-mm-dd'));
--17. Charles
Exec room_available(2, 'All', to_date('2017-08-01','yyyy-mm-dd'), to_date('2017-08-30','yyyy-mm-dd'));	


--18 Room Checkout reciept Jay FIX
exec room_checkout_reciept(1);

--19 Room Checkout reciept Jay FIX
exec room_checkout_reciept(2);

--20 Room checkout reciept Jay FIX
exec room_checkout_reciept(4);

--21 Show sold hotels Luvneet
exec Sold_Hotel_Information;

--22 Show cancelations Charles
exec SHOW_CANCELATIONS; 

--23 Specific hotel reports Grayson
Execute specifichotelreport(2,to_date('01-01-2000','mm-dd-yyyy'), to_date('01-01-2020','mm-dd-yyyy'));

Execute specifichotelreport(3,to_date('01-01-2000','mm-dd-yyyy'), to_date('01-01-2020','mm-dd-yyyy'));

Execute specifichotelreport(4,to_date('01-01-2000','mm-dd-yyyy'), to_date('01-01-2020','mm-dd-yyyy'));

Execute specifichotelreport(5,to_date('01-01-2000','mm-dd-yyyy'), to_date('01-01-2020','mm-dd-yyyy'));

Execute specifichotelreport(6,to_date('01-01-2000','mm-dd-yyyy'), to_date('01-01-2020','mm-dd-yyyy'));


--24 Total Clariot Monthly Josiah 
Exec TOTALCLARIOTTMONTHLYREPORT(to_date('02-01-2017','MM-DD-YYYY'),to_date('02-28-2017','MM-DD-YYYY'));

Exec TOTALCLARIOTTMONTHLYREPORT(to_date('08-01-2017','MM-DD-YYYY'),to_date('08-31-2017','MM-DD-YYYY'));

Exec TOTALCLARIOTTMONTHLYREPORT(to_date('01-01-2017','MM-DD-YYYY'),to_date('01-31-2017','MM-DD-YYYY'));

Exec TOTALCLARIOTTMONTHLYREPORT(to_date('09-01-2017','MM-DD-YYYY'),to_date('09-30-2017','MM-DD-YYYY'));



--25 Total Clariot State report Grayson FIX
Execute totalclariotstatereport('NY');
Execute totalclariotstatereport('MD');
Execute totalclariotstatereport('CA');
Execute totalclariotstatereport('IL');

--26 Change one reservation date Josiah
execute CHANGERESERVATION(2,to_date('07-21-17','MM-DD-YY'),to_date('07-26-17','MM-DD-YY'));

--27 Total Clariot sales report Grayson
Execute totalclariotstatereport('NY');
Execute totalclariotstatereport('MD');
Execute totalclariotstatereport('CA');
Execute totalclariotstatereport('IL');


