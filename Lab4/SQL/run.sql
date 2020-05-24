-- �������� ���������
SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.enable;
    delete_comment(game_id=>2, comment_id=>3);  -- �������� ��������
    delete_comment(game_id=>2, comment_id=>3);  -- Comment3 not found �� �������� - �� ��� ���������
    delete_comment(game_id=>15, comment_id=>3);  -- �� �������� - ���� ���� �������
END;


-- �������� �������
SELECT * FROM TABLE(games_pcg.get_games_with_ratings(0, 0));  -- �� ����
SELECT * FROM TABLE(games_pcg.get_games_with_ratings(1, 0));  -- �� ���� � ����� 1 ������
SELECT * FROM TABLE(games_pcg.get_games_with_ratings(2, 1));  -- �� ���� � ����� 2 ������� � ����� 1 ���������
SELECT * FROM TABLE(games_pcg.get_games_with_ratings(0, 2));  -- �� ���� � ����� 2 ����������


-- �������� ��������
UPDATE Game_Ratings
SET Game_Ratings.rate = -1  -- ������������ ��'���� ��������
WHERE Game_Ratings.user_id=1 AND Game_Ratings.game_id=10;

SELECT Game_Ratings.rate FROM Game_Ratings
WHERE Game_Ratings.user_id=1 AND Game_Ratings.game_id=10;  -- ���� ��������� �� �������� �������� 0, ������ -1
