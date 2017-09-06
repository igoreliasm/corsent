create database email_sender;

\c email_sender

create table emails (
    id serial not null,
    data timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    subject varchar(100) not null,
    message varchar(250) not null
);