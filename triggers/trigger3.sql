/*  loo uus duplicate tabel follows tabelist 

CREATE TABLE unfollows (
	follower_id INT NOT NULL,
	followee_id INT NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY (follower_id) REFERENCES users (id),
	FOREIGN KEY (followee_id) REFERENCES users (id),	
	PRIMARY KEY(follower_id, followee_id)
);

*/ 

DELIMITER $$

CREATE TRIGGER delete_follower_logic
     AFTER DELETE ON follows FOR EACH ROW
     BEGIN
          INSERT INTO unfollows 
          /* alternative one (follower_id, followee_id) VALUES (OLD.follower_id, OLD.followee_id) */ 
          /* alternative 2 */
          SET follower_id = OLD.follower_id, 
              followee_id = OLD.followee_id;
     END;
$$

DELIMITER ;


