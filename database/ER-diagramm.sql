CREATE TABLE `users` (
  `id` BIGSERIAL PRIMARY KEY,
  `FIO` TEXT NOT NULL,
  `Birthday` DATE NOT NULL,
  `Login` TEXT NOT NULL,
  `Password` TEXT NOT NULL
);

CREATE INDEX idx_user_FIO ON users (FIO);
CREATE INDEX idx_user_Birthday ON users (Birthday);
CREATE INDEX idx_user_Login ON users (Login);

CREATE TABLE `chats` (
  `id` BIGSERIAL PRIMARY KEY,
  `history` TEXT NOT NULL,
  `user_id` BIGSERIAL,
  `image` TEXT,
  `created_at` TIMESTAMP
);

CREATE INDEX idx_chat_id ON chats (id);
CREATE INDEX idx_chat_created_at ON chats (created_at);

CREATE TABLE `Image` (
  `hash` TEXT PRIMARY KEY,
  `path` TEXT NOT NULL,
);

CREATE INDEX idx_Image_path ON Image (path);

ALTER TABLE `chats` ADD CONSTRAINT `user_chats` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
ALTER TABLE `Image` ADD CONSTRAINT `charts_image` FOREIGN KEY (`hash`) REFERENCES `chats` (`image`);

