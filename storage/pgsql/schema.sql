create sequence table_name_id_seq
    as integer;

alter sequence table_name_id_seq owner to jc;

create table student
(
    id         integer not null primary key,
    first_name varchar(255) not null,
    last_name  varchar(255) not null,
    email      varchar(255) not null
);

alter table student
    owner to jc;

create table class
(
    id   integer default nextval('table_name_id_seq'::regclass) not null
        constraint table_name_pk
            primary key,
    name varchar(255)                                           not null
);

alter table class
    owner to jc;

alter sequence table_name_id_seq owned by class.id;

create table student_class
(
    id         serial,
    period     integer,
    start_time time with time zone,
    end_time   time with time zone,
    student_id integer,
    teacher_id integer,
    class_id   integer
);

alter table student_class
    owner to jc;

create table assignment
(
    ascender_grade          double precision,
    canvas_grade            double precision,
    ascender_due_date       timestamp with time zone,
    canvas_due_date         timestamp with time zone,
    canvas_turned_in_date   timestamp with time zone,
    ascender_turned_in_date timestamp with time zone,
    id                      serial
        constraint assignment_pk
            primary key,
    student_class_id        integer,
    name                    varchar(255) not null,
    description             text,
    ascender_id             integer,
    canvas_id               integer
);

alter table assignment
    owner to jc;

