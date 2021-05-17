-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
    id integer NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    password character varying(100) COLLATE pg_catalog."default" NOT NULL,
    password_repeat character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_id_users" PRIMARY KEY (id),
    CONSTRAINT "UK_email_users" UNIQUE (email)
)

TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to postgres;

-- Table: public.employers

-- DROP TABLE public.employers;

CREATE TABLE public.employers
(
    id integer NOT NULL DEFAULT nextval('omployers_id_seq'::regclass),
    company_name character varying(200) COLLATE pg_catalog."default" NOT NULL,
    website_adress character varying(100) COLLATE pg_catalog."default" NOT NULL,
    company_mail character varying(100) COLLATE pg_catalog."default" NOT NULL,
    phone_number character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_id_employer" PRIMARY KEY (id),
    CONSTRAINT "FK_employer_users" FOREIGN KEY (id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.employers
    OWNER to postgres;

-- Table: public.job_seekers

-- DROP TABLE public.job_seekers;

CREATE TABLE public.job_seekers
(
    id integer NOT NULL DEFAULT nextval('job_seekers_id_seq'::regclass),
    first_name character varying(75) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(75) COLLATE pg_catalog."default" NOT NULL,
    identity_number character varying(11) COLLATE pg_catalog."default" NOT NULL,
    birth_date date NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT "PK_id_job_seekers" PRIMARY KEY (id),
    CONSTRAINT "UK_identity_number" UNIQUE (identity_number),
    CONSTRAINT "FK_job_seekers_users" FOREIGN KEY (id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.job_seekers
    OWNER to postgres;

-- Table: public.positions

-- DROP TABLE public.positions;

CREATE TABLE public.positions
(
    id integer NOT NULL DEFAULT nextval('positions_id_seq'::regclass),
    position_name character varying(200) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_id_positions" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.positions
    OWNER to postgres;

-- Table: public.system_personnel

-- DROP TABLE public.system_personnel;

CREATE TABLE public.system_personnel
(
    id integer NOT NULL DEFAULT nextval('system_personnel_id_seq'::regclass),
    position_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(75) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(75) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_id_system_personnel" PRIMARY KEY (id),
    CONSTRAINT "FK_system_personnel_users" FOREIGN KEY (id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.system_personnel
    OWNER to postgres;

-- Table: public.email_verification

-- DROP TABLE public.email_verification;

CREATE TABLE public.email_verification
(
    id integer NOT NULL DEFAULT nextval('email_verification_id_seq'::regclass),
    user_id integer NOT NULL,
    auth_toke character varying(250) COLLATE pg_catalog."default" NOT NULL,
    is_verified boolean NOT NULL,
    CONSTRAINT "PK_id_email_verification" PRIMARY KEY (id),
    CONSTRAINT "FK_email_verification_users" FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public.email_verification
    OWNER to postgres;


-- Table: public.mernis_verification

-- DROP TABLE public.mernis_verification;

CREATE TABLE public.mernis_verification
(
    id integer NOT NULL DEFAULT nextval('mernis_verification_id_seq'::regclass),
    user_id integer NOT NULL,
    is_verified boolean NOT NULL,
    CONSTRAINT "PK_id_mernis_verification" PRIMARY KEY (id),
    CONSTRAINT "FK_mernis_verification_users" FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.mernis_verification
    OWNER to postgres;


-- Table: public.system_personnel_verification

-- DROP TABLE public.system_personnel_verification;

CREATE TABLE public.system_personnel_verification
(
    id integer NOT NULL DEFAULT nextval('system_personnel_verification_id_seq'::regclass),
    employer_id integer NOT NULL,
    competent_system_personnel_id integer NOT NULL,
    is_verified boolean NOT NULL,
    CONSTRAINT "PK_id_system_personnel_verification" PRIMARY KEY (id),
    CONSTRAINT "FK_system_personnel_verification_employers" FOREIGN KEY (employer_id)
        REFERENCES public.employers (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT system_personnel_verification_system_personnel FOREIGN KEY (competent_system_personnel_id)
        REFERENCES public.system_personnel (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE public.system_personnel_verification
    OWNER to postgres;


