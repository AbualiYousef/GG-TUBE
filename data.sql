INSERT INTO channel ( channel_id, email, PASSWORD, channel_name, birth_date, gender, region, date_of_registration, profile_picture_path )
VALUES
	( channel_id_seq.NEXTVAL, 'user1@example.com', 'password123', 'User 1', '01-01-2000', 'male', 'USA', sysdate, '#' );
INSERT INTO channel ( channel_id, email, PASSWORD, channel_name, birth_date, gender, region, date_of_registration, profile_picture_path )
VALUES
	( channel_id_seq.NEXTVAL, 'user2@example.com', 'password1234', 'User 2', '01-02-2000', 'male', 'UK', sysdate, '#' );
INSERT INTO channel ( channel_id, email, PASSWORD, channel_name, birth_date, gender, region, date_of_registration, profile_picture_path )
VALUES
	( channel_id_seq.NEXTVAL, 'user3@example.com', 'password154', 'User 3', '01-03-2000', 'female', 'UK', sysdate, '#' );
INSERT INTO video ( video_id, title, description, source_video_path, thumbnail_path, date_of_uploading, video_privacy_status, channel_id )
VALUES
	( video_id_seq.NEXTVAL, 'My First Video', 'This is my first video ever!', 'video/myfirstvideo.mp4', 'video/myfirstvideo_thumbnail.jpg', sysdate, 1, 1 );
INSERT INTO video ( video_id, title, description, source_video_path, thumbnail_path, date_of_uploading, video_privacy_status, channel_id )
VALUES
	( video_id_seq.NEXTVAL, 'How to Bake a Cake', 'Learn how to bake a delicious cake from scratch', 'video/bakeacake.mp4', 'video/bakeacake_thumbnail.jpg', sysdate, 1, 2 );
INSERT INTO video ( video_id, title, description, source_video_path, thumbnail_path, date_of_uploading, video_privacy_status, channel_id )
VALUES
	( video_id_seq.NEXTVAL, '10 Easy Yoga Poses for Beginners', 'Try these easy yoga poses to start your practice', 'video/yogaforbeginners.mp4 ', 'video/yogaforbeginners_thumbnail.jpg', sysdate, 0, 2 );
INSERT INTO video_comment ( comment_id, comment_text, commenting_date, channel_id, video_id )
VALUES
	( comment_id_seq.NEXTVAL, 'This is a great video!', sysdate, 3, 1 );
INSERT INTO video_comment ( comment_id, comment_text, commenting_date, channel_id, video_id )
VALUES
	( comment_id_seq.NEXTVAL, 'I agree, this is really informative', sysdate, 2, 1 );
INSERT INTO playlist ( playlist_id, playlist_name, date_of_creation, playlist_privacy_status, channel_id )
VALUES
	( playlist_id_seq.nextval, 'GG', sysdate, 0, 1 );
INSERT INTO playlist ( playlist_id, playlist_name, date_of_creation, playlist_privacy_status, channel_id )
VALUES
	( playlist_id_seq.nextval, 'cook', sysdate, 0, 2 );
INSERT INTO playlist ( playlist_id, playlist_name, date_of_creation, playlist_privacy_status, channel_id )
VALUES
	( playlist_id_seq.nextval, 'mylist', sysdate, 1, 3 );
INSERT INTO subscribes
VALUES
	( 1, 2, sysdate );
INSERT INTO subscribes
VALUES
	( 1, 3, sysdate );
INSERT INTO subscribes
VALUES
	( 2, 3, sysdate );
INSERT INTO views ( channel_id, video_id, view_date )
VALUES
	( 1, 1, sysdate );
INSERT INTO views ( channel_id, video_id, view_date )
VALUES
	( 3, 2, sysdate );
INSERT INTO views ( channel_id, video_id, view_date )
VALUES
	( 3, 1, sysdate );
INSERT INTO CONTAINS ( video_id, playlist_id )
VALUES
	( 1, 1 );
INSERT INTO CONTAINS ( video_id, playlist_id )
VALUES
	( 1, 2 );
INSERT INTO CONTAINS ( video_id, playlist_id )
VALUES
	( 2, 1 );
INSERT INTO likes ( channel_id, video_id, like_date )
VALUES
	( 2, 3, sysdate );
INSERT INTO likes ( channel_id, video_id, like_date )
VALUES
	( 1, 3, sysdate );
INSERT INTO likes ( channel_id, video_id, like_date )
VALUES
	( 1, 2, sysdate );