-- Script generated by Redgate Compare v1.18.2.12220
SET check_function_bodies = false;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.users...';END$$;
CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE public.users ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.travelexpenses_expenseid_seq...';END$$;
CREATE SEQUENCE public.travelexpenses_expenseid_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.travelexpenses...';END$$;
CREATE TABLE public.travelexpenses (
    expenseid integer NOT NULL DEFAULT nextval('public.travelexpenses_expenseid_seq'::regclass),
    expensecategory character varying(50),
    amount numeric,
    receiptimage text,
    status character varying(20)
);
ALTER TABLE public.travelexpenses ADD CONSTRAINT travelexpenses_pkey PRIMARY KEY (expenseid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Altering public.travelexpenses_expenseid_seq...';END$$;
ALTER SEQUENCE public.travelexpenses_expenseid_seq OWNED BY public.travelexpenses.expenseid;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.tasks_taskid_seq...';END$$;
CREATE SEQUENCE public.tasks_taskid_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.tasks...';END$$;
CREATE TABLE public.tasks (
    taskid integer NOT NULL DEFAULT nextval('public.tasks_taskid_seq'::regclass),
    employeeid integer,
    taskdescription text,
    deadline date,
    status character varying(20),
    assignedby integer
);
ALTER TABLE public.tasks ADD CONSTRAINT tasks_pkey PRIMARY KEY (taskid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Altering public.tasks_taskid_seq...';END$$;
ALTER SEQUENCE public.tasks_taskid_seq OWNED BY public.tasks.taskid;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.salary_salaryid_seq...';END$$;
CREATE SEQUENCE public.salary_salaryid_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.salary...';END$$;
CREATE TABLE public.salary (
    salaryid integer NOT NULL DEFAULT nextval('public.salary_salaryid_seq'::regclass),
    employeeid integer,
    month integer,
    year integer,
    totalsalary numeric(10,2),
    deductions numeric(10,2),
    netsalary numeric(10,2)
);
ALTER TABLE public.salary ADD CONSTRAINT salary_pkey PRIMARY KEY (salaryid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Altering public.salary_salaryid_seq...';END$$;
ALTER SEQUENCE public.salary_salaryid_seq OWNED BY public.salary.salaryid;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.leave_leaveid_seq...';END$$;
CREATE SEQUENCE public.leave_leaveid_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.leave...';END$$;
CREATE TABLE public.leave (
    leaveid integer NOT NULL DEFAULT nextval('public.leave_leaveid_seq'::regclass),
    employeeid integer,
    leavetype character varying(50),
    startdate date,
    enddate date,
    status character varying(20)
);
ALTER TABLE public.leave ADD CONSTRAINT leave_pkey PRIMARY KEY (leaveid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Altering public.leave_leaveid_seq...';END$$;
ALTER SEQUENCE public.leave_leaveid_seq OWNED BY public.leave.leaveid;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.employee_employeeid_seq...';END$$;
CREATE SEQUENCE public.employee_employeeid_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.employee...';END$$;
CREATE TABLE public.employee (
    employeeid integer NOT NULL DEFAULT nextval('public.employee_employeeid_seq'::regclass),
    firstname character varying(50),
    lastname character varying(50),
    email character varying(100),
    phone character varying(20),
    address text,
    departmentid integer,
    "position" character varying(50),
    joiningdate date,
    salary numeric(10,2)
);
ALTER TABLE public.employee ADD CONSTRAINT employee_pkey PRIMARY KEY (employeeid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Altering public.employee_employeeid_seq...';END$$;
ALTER SEQUENCE public.employee_employeeid_seq OWNED BY public.employee.employeeid;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.tasks.fk_tasks_employee...';END$$;
ALTER TABLE public.tasks ADD CONSTRAINT fk_tasks_employee FOREIGN KEY (employeeid) REFERENCES public.employee (employeeid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.tasks.fk_tasks_assigned_by...';END$$;
ALTER TABLE public.tasks ADD CONSTRAINT fk_tasks_assigned_by FOREIGN KEY (assignedby) REFERENCES public.employee (employeeid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.salary.fk_salary_employee...';END$$;
ALTER TABLE public.salary ADD CONSTRAINT fk_salary_employee FOREIGN KEY (employeeid) REFERENCES public.employee (employeeid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.leave.fk_leave_employee...';END$$;
ALTER TABLE public.leave ADD CONSTRAINT fk_leave_employee FOREIGN KEY (employeeid) REFERENCES public.employee (employeeid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.department_departmentid_seq...';END$$;
CREATE SEQUENCE public.department_departmentid_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.department...';END$$;
CREATE TABLE public.department (
    departmentid integer NOT NULL DEFAULT nextval('public.department_departmentid_seq'::regclass),
    departmentname character varying(50),
    managerid integer
);
ALTER TABLE public.department ADD CONSTRAINT department_pkey PRIMARY KEY (departmentid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Altering public.department_departmentid_seq...';END$$;
ALTER SEQUENCE public.department_departmentid_seq OWNED BY public.department.departmentid;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.employee.fk_employee_department...';END$$;
ALTER TABLE public.employee ADD CONSTRAINT fk_employee_department FOREIGN KEY (departmentid) REFERENCES public.department (departmentid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.department.fk_department_manager...';END$$;
ALTER TABLE public.department ADD CONSTRAINT fk_department_manager FOREIGN KEY (managerid) REFERENCES public.employee (employeeid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.attendance_attendanceid_seq...';END$$;
CREATE SEQUENCE public.attendance_attendanceid_seq
AS integer
INCREMENT BY 1
MINVALUE 1
MAXVALUE 2147483647
START 1
CACHE 1
NO CYCLE;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.attendance...';END$$;
CREATE TABLE public.attendance (
    attendanceid integer NOT NULL DEFAULT nextval('public.attendance_attendanceid_seq'::regclass),
    employeeid integer,
    date date,
    checkintime time without time zone,
    checkouttime time without time zone
);
ALTER TABLE public.attendance ADD CONSTRAINT attendance_pkey PRIMARY KEY (attendanceid);


DO language plpgsql $$BEGIN RAISE NOTICE 'Altering public.attendance_attendanceid_seq...';END$$;
ALTER SEQUENCE public.attendance_attendanceid_seq OWNED BY public.attendance.attendanceid;


DO language plpgsql $$BEGIN RAISE NOTICE 'Creating public.attendance.fk_attendance_employee...';END$$;
ALTER TABLE public.attendance ADD CONSTRAINT fk_attendance_employee FOREIGN KEY (employeeid) REFERENCES public.employee (employeeid);

SET check_function_bodies = true;

CREATE TABLE book
(
    id                INTEGER NOT NULL,
    title             VARCHAR(255),
    author_first_name VARCHAR(255),
    author_last_name  VARCHAR(255),
    author_email      VARCHAR(255),
    CONSTRAINT pk_book PRIMARY KEY (id)
);

CREATE TABLE votes (
    vote_id INT PRIMARY KEY,
    user_id INT,
    poll_id INT,
    option_id INT,
    voted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);