CREATE DATABASE IF NOT EXISTS `zbyte`;
USE `zbyte`;

ALTER TABLE `users` ADD `vip` int(11) DEFAULT 0;
ALTER TABLE `users` ADD `silver` int(11) DEFAULT 1;
ALTER TABLE `users` ADD `golden` int(11) DEFAULT 1;
ALTER TABLE `users` ADD `diamond` int(11) DEFAULT 1;
ALTER TABLE `users` ADD `freekit` int(11) DEFAULT 1;