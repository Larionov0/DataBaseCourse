DECLARE
    start_ INTEGER:= 10;
    end_ INTEGER:= 100;
BEGIN
    INSERT INTO Developer(id, name) VALUES(333, 'GOD');
    FOR i IN start_ .. end_
    LOOP
        INSERT INTO Game(id, name, developer_id) VALUES (i, 'game' || TO_CHAR(i), 333);
    END LOOP;
END;