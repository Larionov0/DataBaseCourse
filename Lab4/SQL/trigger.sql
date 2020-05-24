CREATE OR REPLACE TRIGGER rate_check BEFORE
    UPDATE ON game_ratings
    FOR EACH ROW
    WHEN ( new.rate < 0 )
BEGIN
    :new.rate := 0;
END;