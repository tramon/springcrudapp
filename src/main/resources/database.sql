-- Sequence: public.hibernate_sequence
CREATE SEQUENCE public.hibernate_sequence
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 180
  CACHE 1;

-- Sequence: public.roles_id_seq
CREATE SEQUENCE public.roles_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 3
  CACHE 1;

-- Sequence: public.users_id_seq
CREATE SEQUENCE public.users_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 10
  CACHE 1;

-- Table: public.users
CREATE TABLE public.users
(
  id integer NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  username character varying(255) NOT NULL,
  password character varying(255) NOT NULL,
  CONSTRAINT users_pkey PRIMARY KEY (id)
);

-- Table: public.roles
CREATE TABLE public.roles
(
  id integer NOT NULL DEFAULT nextval('roles_id_seq'::regclass),
  name character varying(100) NOT NULL,
  CONSTRAINT roles_pkey PRIMARY KEY (id)
);

-- Table: public.user_roles
CREATE TABLE public.user_roles
(
  user_id integer NOT NULL,
  role_id integer NOT NULL,
  CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id)
      REFERENCES public.roles (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id)
      REFERENCES public.users (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT user_roles_user_id_role_id_key UNIQUE (user_id, role_id)
);

-- Table: public.products
CREATE TABLE public.products
(
  id integer NOT NULL,
  brand character varying(255),
  model character varying(255) NOT NULL,
  description character varying(255),
  cost integer,
  CONSTRAINT id PRIMARY KEY (id)
);

INSERT INTO users VALUES (1, 'root', '12345678');
INSERT INTO users VALUES (2, 'admin', '12345678');
INSERT INTO users VALUES (3, 'user', '12345678');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);
INSERT INTO user_roles VALUES (2, 2);
INSERT INTO user_roles VALUES (3, 1);


