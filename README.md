# email-workers

A escalable email worker made with python, redis, nginx and docker.

### running:
```$ bash run.sh ```

### expect:

```
         Name                        Command                State            Ports
------------------------------------------------------------------------------------------
emailworkers_app_1        bash ./app.sh                    Up
emailworkers_db_1         docker-entrypoint.sh postgres    Up         5432/tcp
emailworkers_frontend_1   nginx -g daemon off;             Up         0.0.0.0:4000->80/tcp
emailworkers_queue_1      docker-entrypoint.sh redis ...   Up         6379/tcp
emailworkers_worker_1     bash ./app.sh                    Exit 127
                                  List of databases
     Name     |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
--------------+----------+----------+------------+------------+-----------------------
 email_sender | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 postgres     | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0    | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
              |          |          |            |            | postgres=CTc/postgres
 template1    | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
              |          |          |            |            | postgres=CTc/postgres
(4 rows)

You are now connected to database "email_sender" as user "postgres".
                                    Table "public.emails"
 Column  |            Type             |                      Modifiers
---------+-----------------------------+-----------------------------------------------------
 id      | integer                     | not null default nextval('emails_id_seq'::regclass)
 data    | timestamp without time zone | not null default now()
 subject | character varying(100)      | not null
 message | character varying(250)      | not null
 ```
