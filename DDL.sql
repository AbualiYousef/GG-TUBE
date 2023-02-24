CREATE sequence channel_id_seq START WITH 1 increment BY 1;
CREATE sequence playlist_id_seq START WITH 1 increment BY 1;
CREATE sequence video_id_seq START WITH 1 increment BY 1;
CREATE sequence comment_id_seq START WITH 1 increment BY 1;
CREATE TABLE channel (
	channel_id INTEGER PRIMARY KEY,
	email VARCHAR ( 50 ) NOT NULL UNIQUE CHECK ( email LIKE '%_@%.%' ),
	PASSWORD VARCHAR ( 25 ) NOT NULL,
	channel_name VARCHAR ( 30 ) NOT NULL UNIQUE,
	birth_date DATE NOT NULL,
	gender VARCHAR ( 6 ) CHECK (
	gender IN ( 'male', 'female' )) NOT NULL,
	region VARCHAR ( 20 ) NOT NULL,
	date_of_registration TIMESTAMP ( 0 ) NOT NULL,
	profile_picture_path clob DEFAULT '#' NOT NULL 
);
CREATE TABLE video (
	video_id INTEGER PRIMARY KEY,
	title VARCHAR ( 100 ) NOT NULL,
	description clob NOT NULL,
	source_video_path clob DEFAULT '#' NOT NULL,
	thumbnail_path clob DEFAULT '#' NOT NULL,
	date_of_uploading TIMESTAMP ( 0 ) NOT NULL,
	video_privacy_status number ( 1 ) DEFAULT 1 CHECK (
	video_privacy_status IN ( 0, 1 )) NOT NULL,
	channel_id INTEGER,
	CONSTRAINT video_channel_fk FOREIGN KEY ( channel_id ) REFERENCES channel ( channel_id ) ON DELETE CASCADE 
);
CREATE TABLE playlist (
	playlist_id INTEGER PRIMARY KEY,
	playlist_name VARCHAR ( 40 ) NOT NULL,
	date_of_creation TIMESTAMP ( 0 ) NOT NULL,
	playlist_privacy_status number ( 1 ) DEFAULT 0 CHECK (
	playlist_privacy_status IN ( 0, 1 )) NOT NULL,
	channel_id INTEGER,
	CONSTRAINT playlist_channel_fk FOREIGN KEY ( channel_id ) REFERENCES channel ( channel_id ) ON DELETE CASCADE 
);
CREATE TABLE video_comment (
	comment_id INTEGER PRIMARY KEY,
	comment_text clob NOT NULL,
	commenting_date TIMESTAMP ( 0 ) NOT NULL,
	channel_id INTEGER,
	video_id INTEGER,
	CONSTRAINT comment_channel_fk FOREIGN KEY ( channel_id ) REFERENCES channel ( channel_id ) ON DELETE CASCADE,
	CONSTRAINT comment_video_fk FOREIGN KEY ( video_id ) REFERENCES video ( video_id ) ON DELETE CASCADE 
);
CREATE TABLE CONTAINS (
	video_id INTEGER,
	playlist_id INTEGER,
	CONSTRAINT contains_pk PRIMARY KEY ( video_id, playlist_id ),
	CONSTRAINT contains_video_fk FOREIGN KEY ( video_id ) REFERENCES video ( video_id ) ON DELETE CASCADE,
	CONSTRAINT contains_playlist_fk FOREIGN KEY ( playlist_id ) REFERENCES playlist ( playlist_id ) ON DELETE CASCADE 
);
CREATE TABLE views (
	channel_id INTEGER,
	video_id INTEGER,
	view_date TIMESTAMP ( 0 ),
	CONSTRAINT views_channel_fk FOREIGN KEY ( channel_id ) REFERENCES channel ( channel_id ) ON DELETE CASCADE,
	CONSTRAINT views_video_fk FOREIGN KEY ( video_id ) REFERENCES video ( video_id ) ON DELETE CASCADE 
);
CREATE TABLE likes (
	channel_id INTEGER,
	video_id INTEGER,
	like_date TIMESTAMP ( 0 ),
	CONSTRAINT likes_pk PRIMARY KEY ( channel_id, video_id ),
	CONSTRAINT likes_channel_fk FOREIGN KEY ( channel_id ) REFERENCES channel ( channel_id ) ON DELETE CASCADE,
	CONSTRAINT likes_video_fk FOREIGN KEY ( video_id ) REFERENCES video ( video_id ) ON DELETE CASCADE 
);
CREATE TABLE subscribes (
	subscriber_id INTEGER,
	subscribed_to_id INTEGER,
	subscription_date TIMESTAMP ( 0 ),
	CONSTRAINT subscribes_pk PRIMARY KEY ( subscriber_id, subscribed_to_id ),
	CONSTRAINT subscriber_channel_fk FOREIGN KEY ( subscriber_id ) REFERENCES channel ( channel_id ) ON DELETE CASCADE,
	CONSTRAINT subscribed_to_channel_fk FOREIGN KEY ( subscribed_to_id ) REFERENCES channel ( channel_id ) ON DELETE CASCADE,
CONSTRAINT subscribes_chk CHECK ( subscriber_id <> subscribed_to_id ) 
);