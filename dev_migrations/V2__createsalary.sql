CREATE TABLE salary
(
    salaryid    INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    employeeid  INTEGER,
    month       INTEGER,
    year        INTEGER,
    totalsalary numeric(10, 2),
    deductions  numeric(10, 2),
    netsalary   numeric(10, 2),
    CONSTRAINT salary_pkey PRIMARY KEY (salaryid)
);