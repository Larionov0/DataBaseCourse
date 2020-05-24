CREATE or REPLACE TRIGGER country_check BEFORE INSERT
    ON project FOR EACH ROW
    WHEN ( new.country IS NULL )

BEGIN
    :new.country := 'Unknown';
END;