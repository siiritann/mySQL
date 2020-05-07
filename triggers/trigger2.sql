DELIMITER $$

CREATE TRIGGER follower_logic
     BEFORE INSERT ON follows FOR EACH ROW
     BEGIN
          IF NEW.follower_id = NEW.followee_id
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = "Can't follow oneself!";
          END IF;
     END;
$$

DELIMITER ;