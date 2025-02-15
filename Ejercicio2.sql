/*Creamos una tabla kc_servicio */
/* He utilizado varchar en este modelo entidad para las Primary Keys primando la logica de negocio al ser generado a partir de reglas de negocio, he sopesado el uso de INT considerando su rendimiento y rapidez pero decidi aplicar criterio de negocio en la codificacion. Consideré que el volumen de datos no era elevado en base al tipo de modelo negocio, aunque se escalase el modelo de una manera considerable la estructura de datos podria tolerar esta particularidad a favor de negocio*/
/* No he incluido como datos autoincrementales debido que al generar las bases de datos para simular el modelo entraban en conflicto debido a la relacion entre tablas, lo ideal para un modelo evaluado no simulado( como es este caso) seria tener columnas con datos autogenerados en las columnas ID */
create table kc_servicio (
	ID_SERVICIO varchar primary key,
    FORMATO varchar not null,
    AREA_CONOCIMIENTO varchar not null,
    PLAZAS_LIMITE int null,
    DURACION_HORAS int null,
    TIPO_CLIENTE varchar not null
);


/* Creamos una tabla kc_modulos */
create table kc_modulos (
	ID_MODULO varchar primary key,
    ID_SERVICIO varchar not null,
    DURACION_MODULO int null,
    ID_PROFESOR varchar not null,
	foreign key (ID_SERVICIO) references kc_servicio(ID_SERVICIO),
	foreign key (ID_PROFESOR) references kc_profesores(ID_PROFESOR)
);

/* Creamos una tabla kc_profesores */
create table kc_profesores (
	ID_PROFESOR varchar primary key,
	NAME_PROFESOR varchar not null,
	SURNAME_PROFESOR varchar not null,
	FECHA_ALTA date not null
);

/* Creamos una tabla kc_cliente */
create table kc_clientes (
	ID_CLIENTE varchar primary KEY,
	NAME_CLIENTE varchar not null,
	SURNAME_CLIENTE varchar not null,
	FECHA_ALTA date not null,
	MAIL varchar unique not null,
	PAIS varchar not null
	TIPO_CLIENTE varchar not null
);

/* Creamos la tabla kc_operaciones*/
create table kc_operaciones (
	ID_OPERACION varchar primary key,
	ID_SERVICIO varchar not null,
	ID_CLIENTE varchar not null,
	BONIFICACION_APLICADA varchar null,
	PVP int	null,
	IMPORTE_ABONADO int null,
	FECHA_ABONO DATE null,
	foreign key (ID_SERVICIO) references kc_servicio(ID_SERVICIO),
	foreign key (ID_CLIENTE) references kc_clientes(ID_CLIENTE)
	);

/* Incluimos los datos en cada tabla*/
INSERT INTO kc_servicio (id_servicio, formato, area_conocimiento, plazas_limite, duracion_horas) VALUES
('SERVA1XQ', 'CURSO_INDIVIDUAL', 'TECH', 1, 10),
('SERVB2YH', 'BOOTCAMP', 'IA', 30, 250),
('SERVC3ZK', 'FORMACION_ADHOC', 'FUNDAMENTALS', NULL, NULL),
('SERVD4WM', 'WEBINAR', 'WEB&APP', 50, 5),
('SERVE5LP', 'CURSO_INDIVIDUAL', 'FUNDAMENTALS', 1, 15),
('SERVF6NM', 'BOOTCAMP', 'TECH', 40, 350),
('SERVG7YT', 'FORMACION_ADHOC', 'IA', NULL, NULL),
('SERVH8LK', 'WEBINAR', 'TECH', 60, 5),
('SERVI9PV', 'CURSO_INDIVIDUAL', 'IA', 1, 12),
('SERVJ0MH', 'BOOTCAMP', 'WEB&APP', 35, 300),
('SERVK1DN', 'FORMACION_ADHOC', 'TECH', NULL, NULL),
('SERVL2VR', 'WEBINAR', 'FUNDAMENTALS', 40, 5),
('SERVM3TW', 'CURSO_INDIVIDUAL', 'TECH', 1, 14),
('SERVN4GB', 'BOOTCAMP', 'IA', 30, 250),
('SERVO5XZ', 'WEBINAR', 'WEB&APP', 45, 5),
('SERVP6QW', 'CURSO_INDIVIDUAL', 'TECH', 1, 12),
('SERVQ7ER', 'BOOTCAMP', 'IA', 35, 320),
('SERVR8TY', 'FORMACION_ADHOC', 'FUNDAMENTALS', NULL, NULL),
('SERVS9UI', 'WEBINAR', 'WEB&APP', 55, 5),
('SERVT0OP', 'CURSO_INDIVIDUAL', 'FUNDAMENTALS', 1, 14),
('SERVU1AS', 'BOOTCAMP', 'TECH', 38, 330),
('SERVV2DF', 'FORMACION_ADHOC', 'IA', NULL, NULL),
('SERVW3GH', 'WEBINAR', 'TECH', 60, 5),
('SERVX4JK', 'CURSO_INDIVIDUAL', 'IA', 1, 10),
('SERVY5LM', 'BOOTCAMP', 'WEB&APP', 40, 280),
('SERVZ6BN', 'FORMACION_ADHOC', 'TECH', NULL, NULL),
('SERVA7CD', 'WEBINAR', 'FUNDAMENTALS', 45, 5),
('SERVB8EF', 'CURSO_INDIVIDUAL', 'TECH', 1, 15),
('SERVC9GH', 'BOOTCAMP', 'IA', 32, 270),
('SERVD0IJ', 'WEBINAR', 'WEB&APP', 48, 5),
('SERVD1KH', 'CURSO_INDIVIDUAL', 'TECH', 1, 11),
('SERVE2LM', 'BOOTCAMP', 'IA', 32, 310),
('SERVF3NT', 'FORMACION_ADHOC', 'FUNDAMENTALS', NULL, NULL),
('SERVG4OY', 'WEBINAR', 'WEB&APP', 50, 5),
('SERVH5PU', 'CURSO_INDIVIDUAL', 'FUNDAMENTALS', 1, 14),
('SERVI6VC', 'BOOTCAMP', 'TECH', 37, 325),
('SERVJ7XZ', 'FORMACION_ADHOC', 'IA', NULL, NULL),
('SERVK8YR', 'WEBINAR', 'TECH', 55, 5),
('SERVL9QW', 'CURSO_INDIVIDUAL', 'IA', 1, 12),
('SERVM0DS', 'BOOTCAMP', 'WEB&APP', 36, 295),
('SERVN1BG', 'FORMACION_ADHOC', 'TECH', NULL, NULL),
('SERVO2ZF', 'WEBINAR', 'FUNDAMENTALS', 45, 5),
('SERVP3XM', 'CURSO_INDIVIDUAL', 'TECH', 1, 13),
('SERVQ4ND', 'BOOTCAMP', 'IA', 29, 260),
('SERVR5VH', 'WEBINAR', 'WEB&APP', 40, 5);

INSERT INTO kc_modulos (id_modulo, id_servicio, duracion_modulo, id_profesor) VALUES
('MOD001', 'SERVA1XQ', 40, 'PROF003'),
('MOD002', 'SERVB2YH', 50, 'PROF010'),
('MOD003', 'SERVB2YH', 30, 'PROF012'),
('MOD004', 'SERVC3ZK', 25, 'PROF015'),
('MOD005', 'SERVE5LP', 22, 'PROF005'),
('MOD006', 'SERVF6NM', 45, 'PROF002'),
('MOD007', 'SERVG7YT', 38, 'PROF008'),
('MOD008', 'SERVI9PV', 30, 'PROF010'),
('MOD009', 'SERVJ0MH', 50, 'PROF012'),
('MOD010', 'SERVK1DN', 29, 'PROF007'),
('MOD011', 'SERVM3TW', 40, 'PROF004'),
('MOD012', 'SERVN4GB', 36, 'PROF014'),
('MOD013', 'SERVP6QW', 42, 'PROF006'),
('MOD014', 'SERVQ7ER', 50, 'PROF011'),
('MOD015', 'SERVR8TY', 28, 'PROF013'),
('MOD016', 'SERVT0OP', 35, 'PROF016'),
('MOD017', 'SERVU1AS', 47, 'PROF019'),
('MOD018', 'SERVV2DF', 30, 'PROF020'),
('MOD019', 'SERVX4JK', 41, 'PROF022'),
('MOD020', 'SERVY5LM', 39, 'PROF024'),
('MOD021', 'SERVZ6BN', 34, 'PROF027'),
('MOD022', 'SERVB8EF', 45, 'PROF029'),
('MOD023', 'SERVC9GH', 33, 'PROF031'),
('MOD024', 'SERVD1KH', 45, 'PROF021'),
('MOD025', 'SERVE2LM', 40, 'PROF008'),
('MOD026', 'SERVF3NT', 28, 'PROF014'),
('MOD027', 'SERVH5PU', 34, 'PROF017'),
('MOD028', 'SERVI6VC', 48, 'PROF023'),
('MOD029', 'SERVJ7XZ', 32, 'PROF026'),
('MOD030', 'SERVL9QW', 42, 'PROF031'),
('MOD031', 'SERVM0DS', 37, 'PROF034'),
('MOD032', 'SERVN1BG', 33, 'PROF036'),
('MOD033', 'SERVP3XM', 39, 'PROF039'),
('MOD034', 'SERVQ4ND', 31, 'PROF040');

INSERT INTO kc_profesores (id_profesor, name_profesor, surname_profesor, fecha_alta) VALUES
('PROF031', 'Isabel', 'Fernández', '2017-08-12'),
('PROF032', 'Roberto', 'Martínez', '2019-05-09'),
('PROF033', 'Clara', 'Gómez', '2020-02-20'),
('PROF034', 'Ana', 'Sánchez', '2018-11-27'),
('PROF035', 'Javier', 'Díaz', '2016-09-23'),
('PROF036', 'Elena', 'Martínez', '2019-02-10'),
('PROF037', 'Carlos', 'Gómez', '2020-05-22'),
('PROF038', 'Silvia', 'Rodríguez', '2018-07-15'),
('PROF039', 'Fernando', 'Díaz', '2017-10-30'),
('PROF040', 'Paula', 'Fernández', '2016-12-03'),
('PROF041', 'Sergio', 'Herrera', '2018-03-12'),
('PROF042', 'Carolina', 'López', '2019-07-22'),
('PROF043', 'Antonio', 'Ruiz', '2017-10-05'),
('PROF044', 'Victoria', 'González', '2020-11-17'),
('PROF045', 'Daniel', 'Sánchez', '2016-08-30');

INSERT INTO kc_profesores (id_profesor, name_profesor, surname_profesor, fecha_alta) VALUES
('PROF003', 'Antonio', 'González', '2019-05-14'),
('PROF010', 'María', 'Fernández', '2018-12-07'),
('PROF012', 'Luis', 'Martínez', '2021-03-25'),
('PROF015', 'Elena', 'Rodríguez', '2020-09-30'),
('PROF005', 'Carlos', 'Díaz', '2017-07-11'),
('PROF002', 'Isabel', 'Ruiz', '2016-06-20'),
('PROF008', 'Fernando', 'Gómez', '2019-11-03'),
('PROF004', 'Paula', 'López', '2020-02-15'),
('PROF014', 'Javier', 'Sánchez', '2018-08-28'),
('PROF006', 'Silvia', 'Herrera', '2021-06-14'),
('PROF011', 'Alberto', 'Navarro', '2019-10-19'),
('PROF013', 'Carmen', 'Ortega', '2022-01-22'),
('PROF016', 'Roberto', 'Molina', '2017-03-10'),
('PROF019', 'Victoria', 'Delgado', '2020-07-05'),
('PROF020', 'Daniel', 'Castro', '2018-04-29'),
('PROF022', 'Cristina', 'Pérez', '2019-09-18'),
('PROF024', 'Jesús', 'Moreno', '2021-12-31'),
('PROF027', 'Beatriz', 'Jiménez', '2016-05-02'),
('PROF029', 'Francisco', 'Torres', '2020-11-09');

INSERT INTO kc_profesores (id_profesor, name_profesor, surname_profesor, fecha_alta) VALUES
('PROF007', 'Miguel', 'Hernández', '2018-04-17'),
('PROF017', 'Laura', 'Paredes', '2019-06-23'),
('PROF021', 'Pablo', 'Núñez', '2017-09-11'),
('PROF023', 'Andrea', 'Mendoza', '2020-02-05'),
('PROF026', 'Santiago', 'Ramírez', '2021-08-14');

INSERT INTO kc_clientes (id_cliente, name_cliente, surname_cliente, fecha_alta, mail, pais) VALUES
('CLI0501', 'Laura', 'García', '2021-04-10', 'lgarcia@gmail.com', 'ESPAÑA'),
('CLI0502', 'David', 'Pérez', '2022-06-18', 'dperez@gmail.com', 'MÉXICO'),
('CLI0503', 'Empresa_78', 'EMPRESA', '2023-01-15', 'empresa_78@empresa.com', 'CHILE'),
('CLI0504', 'Ana', 'Rodríguez', '2020-11-23', 'arodriguez@gmail.com', 'ANDORRA'),
('CLI0505', 'Marta', 'Fernández', '2018-05-30', 'mfernandez@gmail.com', 'ARGENTINA'),
('CLI0511', 'Javier', 'Ramírez', '2018-02-19', 'jramirez@gmail.com', 'MÉXICO'),
('CLI0512', 'Sofía', 'Martínez', '2019-07-04', 'smartinez@gmail.com', 'ESPAÑA'),
('CLI0513', 'Empresa_83', 'EMPRESA', '2021-12-15', 'empresa_83@empresa.com', 'CHILE'),
('CLI0514', 'Luis', 'Pérez', '2017-05-30', 'lperez@gmail.com', 'ARGENTINA'),
('CLI0515', 'Beatriz', 'Díaz', '2022-09-08', 'bdiaz@gmail.com', 'ANDORRA'),
('CLI0516', 'Andrés', 'Fernández', '2020-10-01', 'afernandez@gmail.com', 'ESPAÑA'),
('CLI0517', 'Carolina', 'Sánchez', '2023-03-11', 'csanchez@gmail.com', 'MÉXICO'),
('CLI0518', 'Empresa_95', 'EMPRESA', '2022-06-22', 'empresa_95@empresa.com', 'CHILE'),
('CLI0519', 'Alejandro', 'López', '2021-11-29', 'alopez@gmail.com', 'ESPAÑA'),
('CLI0520', 'Mariana', 'García', '2019-04-20', 'mgarcia@gmail.com', 'ARGENTINA'),
('CLI0521', 'Adrián', 'Herrera', '2019-06-15', 'aherrera@gmail.com', 'MÉXICO'),
('CLI0522', 'Sofía', 'Núñez', '2021-10-11', 'snunez@gmail.com', 'ESPAÑA'),
('CLI0523', 'Empresa_120', 'EMPRESA', '2022-05-08', 'empresa_120@empresa.com', 'CHILE'),
('CLI0524', 'Luis', 'Morales', '2018-08-23', 'lmorales@gmail.com', 'ARGENTINA'),
('CLI0525', 'Elena', 'Paredes', '2023-01-05', 'eparedes@gmail.com', 'ANDORRA'),
('CLI0526', 'Andrés', 'Ramírez', '2020-09-14', 'aramirez@gmail.com', 'ESPAÑA'),
('CLI0527', 'Cristina', 'Rojas', '2022-02-27', 'crojas@gmail.com', 'MÉXICO'),
('CLI0528', 'Empresa_132', 'EMPRESA', '2023-07-18', 'empresa_132@empresa.com', 'CHILE'),
('CLI0529', 'Alejandro', 'Castillo', '2021-03-06', 'acastillo@gmail.com', 'ESPAÑA'),
('CLI0530', 'Mariana', 'Duarte', '2019-04-30', 'mduarte@gmail.com', 'ARGENTINA');

INSERT INTO kc_clientes (id_cliente, name_cliente, surname_cliente, fecha_alta, mail, pais, tipo_cliente) VALUES
('CLI0012', 'Manuel', 'Domínguez', '2020-01-10', 'manuel.dominguez@mail.com', 'ESPAÑA', 'PARTICULAR'),
('CLI0023', 'Raquel', 'Santos', '2021-03-15', 'raquel.santos@mail.com', 'MÉXICO', 'PARTICULAR'),
('CLI0045', 'Gabriel', 'Morales', '2019-06-22', 'gabriel.morales@mail.com', 'CHILE', 'EMPRESA'),
('CLI0031', 'Patricia', 'Reyes', '2018-09-30', 'patricia.reyes@mail.com', 'ARGENTINA', 'PARTICULAR'),
('CLI0056', 'Fernando', 'Ortega', '2022-11-07', 'fernando.ortega@mail.com', 'ANDORRA', 'EMPRESA');




INSERT INTO kc_operaciones (id_operacion, id_servicio, id_cliente, bonificacion_aplicada, pvp, importe_abonado, fecha_abono) VALUES
('OPER001', 'SERVB2YH', 'CLI0012', 'BECA', 5000, 3500, '2021-06-01'),
('OPER002', 'SERVA1XQ', 'CLI0023', 'DESC_FIDELIZACION', 200, 170, '2020-11-15'),
('OPER003', 'SERVC3ZK', 'CLI0045', NULL, NULL, 5000, '2022-08-22'),
('OPER004', 'SERVN4GB', 'CLI0031', NULL, 250, 250, '2019-12-30'),
('OPER005', 'SERVI9PV', 'CLI0056', 'BECA', 150, 105, '2021-07-08'),
('OPER006', 'SERVQ7ER', 'CLI0511', 'BECA', 4800, 3360, '2022-02-14'),
('OPER007', 'SERVP6QW', 'CLI0512', 'DESC_FIDELIZACION', 210, 178, '2021-09-17'),
('OPER008', 'SERVR8TY', 'CLI0513', NULL, NULL, 5200, '2023-05-30'),
('OPER009', 'SERVX4JK', 'CLI0514', NULL, 230, 230, '2020-06-19'),
('OPER010', 'SERVY5LM', 'CLI0515', 'BECA', 120, 84, '2021-03-08'),
('OPER011', 'SERVT0OP', 'CLI0516', 'DESC_FIDELIZACION', 200, 170, '2019-12-20'),
('OPER012', 'SERVU1AS', 'CLI0517', 'BECA', 5000, 3500, '2022-10-01'),
('OPER013', 'SERVV2DF', 'CLI0518', NULL, NULL, 6000, '2023-07-12'),
('OPER014', 'SERVW3GH', 'CLI0519', 'DESC_FIDELIZACION', 150, 127, '2020-05-14'),
('OPER015', 'SERVZ6BN', 'CLI0520', 'BECA', 250, 175, '2021-08-09');

/* Añadimos las tablas creadas a un nuevo schema para tenerlas diferenciadas*/

alter table kc_servicio set schema kc_schema;
alter table kc_profesores set schema kc_schema;
alter table kc_operaciones set schema kc_schema;
alter table kc_modulos set schema kc_schema;
alter table kc_clientes set schema kc_schema;




