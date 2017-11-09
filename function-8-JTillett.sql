CREATE OR REPLACE PROCEDURE CancelReservation(res_id IN number) IS
CURSOR reservation_cursor IS
  SELECT * FROM reservations WHERE res_id = reservations.reservation_id;
r_row reservation_cursor%rowtype;
no_record_found EXCEPTION;
BEGIN
OPEN reservation_cursor;
LOOP
  FETCH reservation_cursor INTO r_row;
  IF r_row.reservation_id IS NULL THEN
    RAISE no_record_found;
  END IF;
EXIT WHEN reservation_cursor%notfound;
UPDATE reservations
  SET reservation_check_in = NULL, reservation_check_out = NULL, length_of_stay = NULL;
  WHERE reservation_id = r_row.reservation_id;
END LOOP;
EXCEPTION
  WHEN no_record_found THEN
  dbms_output.put_line('No reservation found with the id: ' || to_char(res_id));
END;
