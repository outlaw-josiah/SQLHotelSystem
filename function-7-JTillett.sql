CREATE OR REPLACE PROCEDURE FindReservation(res_id IN number) IS
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
dbms_output.put_line('ID:                  ' || to_char(r_row.reservation_id));
dbms_output.put_line('Room Number:         ' || to_char(r_row.room_id));
dbms_output.put_line('Reservation Made On: ' || to_char(r_row.reservation_date));
dbms_output.put_line('Checking In:         ' || to_char(r_row.reservation_check_in));
dbms_output.put_line('Checking Out:        ' || to_char(r_row.reservation_check_out));
dbms_output.put_line('Duration of Stay:    ' || to_char(r_row.length_of_stay));
END LOOP;
EXCEPTION
  WHEN no_record_found THEN
  dbms_output.put_line('No reservation found with the id: ' || to_char(res_id));
END;

END LOOP;
EXCEPTION
  WHEN no_record_found THEN
  dbms_output.put_line('No reservation found with the id: ' || to_char(res_id));
END;