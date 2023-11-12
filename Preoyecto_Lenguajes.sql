
-- Inserts para TB_USERS
INSERT INTO TB_USERS (USER_ID,  NAME_USERS, EMAIL, PASSWORD, Rol) VALUES (101,  'User 1', 'user1@example.com', 'pass1', 'Cliente');
INSERT INTO TB_USERS (USER_ID,  NAME_USERS, EMAIL, PASSWORD, Rol) VALUES (102,  'User 2', 'user2@example.com', 'pass2', 'Cliente');
INSERT INTO TB_USERS (USER_ID,  NAME_USERS, EMAIL, PASSWORD, Rol) VALUES (103,  'User 3', 'user3@example.com', 'pass3', 'Especialista');
INSERT INTO TB_USERS (USER_ID,  NAME_USERS, EMAIL, PASSWORD, Rol) VALUES (104,  'User 4', 'user4@example.com', 'pass4', 'Especialista');

-- Inserts para TB_PROVINCIA
INSERT INTO TB_PROVINCIA (PROVINCIA_ID, NAME) VALUES (1, 'Province 1');
INSERT INTO TB_PROVINCIA (PROVINCIA_ID, NAME) VALUES (2, 'Province 2');
INSERT INTO TB_PROVINCIA (PROVINCIA_ID, NAME) VALUES (3, 'Province 3');
INSERT INTO TB_PROVINCIA (PROVINCIA_ID, NAME) VALUES (4, 'Province 4');

-- Inserts para TB_CLIENTES
INSERT INTO TB_CLIENTES (CLIENTE_ID,  FIRST_NAME, last_name, EMAIL,  birthdate,   PROVINCIA_ID) VALUES (1,  'Cliente 1', 'Apellido 1',  'user1@example.com', ('1995-05-05'), 1);
INSERT INTO TB_CLIENTES (CLIENTE_ID,  FIRST_NAME, last_name, EMAIL, birthdate,   PROVINCIA_ID) VALUES (2,  'Cliente 2', 'Apellido 2',  'user2@example.com', ('2000-01-01'), 2);
INSERT INTO TB_CLIENTES (CLIENTE_ID,  FIRST_NAME, last_name, EMAIL, birthdate,   PROVINCIA_ID) VALUES (3,  'Cliente 3', 'Apellido 3',  'user3@example.com', ('1988-10-10'), 3);
INSERT INTO TB_CLIENTES (CLIENTE_ID,  FIRST_NAME, last_name, EMAIL, birthdate,   PROVINCIA_ID) VALUES (4,  'Cliente 4', 'Apellido 4',  'user4@example.com', ('1980-12-25'), 4);

-- Inserts para TB_ESPECIALISTAS
INSERT INTO TB_ESPECIALISTAS (ESPECIALISTA_ID, USER_ID, ESPECIALIDAD) VALUES (1, 101, 'Especialidad1');
INSERT INTO TB_ESPECIALISTAS (ESPECIALISTA_ID, USER_ID, ESPECIALIDAD) VALUES (2, 102, 'Especialidad2');
INSERT INTO TB_ESPECIALISTAS (ESPECIALISTA_ID, USER_ID, ESPECIALIDAD) VALUES (3, 103, 'Especialidad3');
INSERT INTO TB_ESPECIALISTAS (ESPECIALISTA_ID, USER_ID, ESPECIALIDAD) VALUES (4, 104, 'Especialidad4');


-- Inserts para TB_SUCURSALES
INSERT INTO TB_SUCURSALES (SUCURSAL_ID, NOMBRE_SUCURSAL, PROVINCIA_ID) VALUES (1, 'Sucursal1', 1);
INSERT INTO TB_SUCURSALES (SUCURSAL_ID, NOMBRE_SUCURSAL, PROVINCIA_ID) VALUES (2, 'Sucursal2', 2);
INSERT INTO TB_SUCURSALES (SUCURSAL_ID, NOMBRE_SUCURSAL, PROVINCIA_ID) VALUES (3, 'Sucursal3', 3);
INSERT INTO TB_SUCURSALES (SUCURSAL_ID, NOMBRE_SUCURSAL, PROVINCIA_ID) VALUES (4, 'Sucursal4', 4);



-- Inserts para TB_TIPOCITAS
INSERT INTO TB_TIPOCITAS (TIPOCITA_ID, NOMBRE_TIPOCITA) VALUES (1, 'Virtual');
INSERT INTO TB_TIPOCITAS (TIPOCITA_ID, NOMBRE_TIPOCITA) VALUES (2, 'Presencial');
INSERT INTO TB_TIPOCITAS (TIPOCITA_ID, NOMBRE_TIPOCITA) VALUES (3, 'Virtual');
INSERT INTO TB_TIPOCITAS (TIPOCITA_ID, NOMBRE_TIPOCITA) VALUES (4, 'Presencial');
  

-- Inserts para TB_APPOINTMENTS
INSERT INTO TB_APPOINTMENTS (APPOINTMENT_ID, CLIENTE_ID, ESPECIALISTA_ID, FECHA, HORA, PROVINCIA_ID, SUCURSAL_ID, TIPOCITA_ID, ESTADO) VALUES (1, 1, 1, ('2023-11-10'), '10:00 AM', 1, 1, 1, 'Programada');
INSERT INTO TB_APPOINTMENTS (APPOINTMENT_ID, CLIENTE_ID, ESPECIALISTA_ID, FECHA, HORA, PROVINCIA_ID, SUCURSAL_ID, TIPOCITA_ID, ESTADO) VALUES (2, 2, 2, ('2023-11-12'), '02:30 PM', 2, 2, 2, 'Realizada');
INSERT INTO TB_APPOINTMENTS (APPOINTMENT_ID, CLIENTE_ID, ESPECIALISTA_ID, FECHA, HORA, PROVINCIA_ID, SUCURSAL_ID, TIPOCITA_ID, ESTADO) VALUES (3, 3, 3, ('2023-11-15'), '11:45 AM', 3, 3, 3, 'Cancelada');
INSERT INTO TB_APPOINTMENTS (APPOINTMENT_ID, CLIENTE_ID, ESPECIALISTA_ID, FECHA, HORA, PROVINCIA_ID, SUCURSAL_ID, TIPOCITA_ID, ESTADO) VALUES (4, 4, 4, ('2023-11-18'), '09:00 AM', 4, 4, 4, 'Programada');


-- Inserts para TB_AUDITORIACITAS
INSERT INTO TB_AUDITORIACITAS (AUDITORIA_ID, APPOINTMENT_ID, NOMBRE, DESCRIPCION, FECHA) VALUES (1, 1, '', '',('2023-11-10'));
INSERT INTO TB_AUDITORIACITAS (AUDITORIA_ID, APPOINTMENT_ID, NOMBRE, DESCRIPCION, FECHA) VALUES (2, 2, '', '', ('2023-11-10'));
INSERT INTO TB_AUDITORIACITAS (AUDITORIA_ID, APPOINTMENT_ID, NOMBRE, DESCRIPCION, FECHA) VALUES (3, 3, '', '', ('2023-11-10'));
INSERT INTO TB_AUDITORIACITAS (AUDITORIA_ID, APPOINTMENT_ID, NOMBRE, DESCRIPCION, FECHA) VALUES (4, 4, '', '', ('2023-11-10'));


CREATE TABLE TB_USERS(
USER_ID INT PRIMARY KEY AUTO_INCREMENT,
NAME_USERS VARCHAR(100),
EMAIL VARCHAR(255),
PASSWORD VARCHAR(100),
Rol VARCHAR(20));  -- Puede ser "Cliente" o "Especialista"


CREATE TABLE TB_PROVINCIA(
PROVINCIA_ID INT PRIMARY KEY,
NAME VARCHAR(100));

CREATE TABLE TB_CLIENTES(
CLIENTE_ID INT PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME VARCHAR(255),
last_name VARCHAR(255),
EMAIL VARCHAR(255),
birthdate DATE,
PROVINCIA_ID INT,
FOREIGN KEY (PROVINCIA_ID) REFERENCES TB_PROVINCIA(PROVINCIA_ID));

CREATE TABLE TB_ESPECIALISTAS (
ESPECIALISTA_ID INT PRIMARY KEY,
USER_ID INT,
ESPECIALIDAD VARCHAR(100),
FOREIGN KEY (USER_ID) REFERENCES TB_USERS(USER_ID));

CREATE TABLE TB_SUCURSALES (
SUCURSAL_ID INT PRIMARY KEY,
NOMBRE_SUCURSAL VARCHAR(100),
PROVINCIA_ID INT,
FOREIGN KEY (PROVINCIA_ID) REFERENCES TB_PROVINCIA(PROVINCIA_ID));

CREATE TABLE TB_TIPOCITAS (
    TIPOCITA_ID INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE_TIPOCITA VARCHAR(50));

CREATE TABLE TB_APPOINTMENTS(
APPOINTMENT_ID INT PRIMARY KEY AUTO_INCREMENT,
CLIENTE_ID INT,
ESPECIALISTA_ID INT,
FECHA DATETIME,
HORA VARCHAR (255),
PROVINCIA_ID INT,
SUCURSAL_ID INT,
TIPOCITA_ID INT,
ESTADO VARCHAR(20) DEFAULT 'Programada', -- Puede ser 'Programada', 'Realizada', 'Cancelada', etc.
FOREIGN KEY (CLIENTE_ID) REFERENCES TB_CLIENTES(CLIENTE_ID),
FOREIGN KEY (ESPECIALISTA_ID) REFERENCES TB_ESPECIALISTAS(ESPECIALISTA_ID),
FOREIGN KEY (TIPOCITA_ID) REFERENCES TB_TIPOCITAS(TIPOCITA_ID),
FOREIGN KEY (SUCURSAL_ID) REFERENCES TB_SUCURSALES(SUCURSAL_ID),
FOREIGN KEY (PROVINCIA_ID) REFERENCES TB_PROVINCIA(PROVINCIA_ID));


CREATE TABLE TB_AUDITORIACITAS (
    AUDITORIA_ID INT PRIMARY KEY AUTO_INCREMENT,
    APPOINTMENT_ID INT,
    NOMBRE VARCHAR(255),
    DESCRIPCION VARCHAR(500),
    FECHA DATETIME,
    FOREIGN KEY (APPOINTMENT_ID) REFERENCES TB_APPOINTMENTS(APPOINTMENT_ID));   

-- Procedimientos Almacenados 

-- Iniciar Sesi�n
CREATE OR REPLACE PROCEDURE Login_User(
    p_Email VARCHAR2,
    p_Password VARCHAR2,
    p_SessionID OUT NUMBER
) AS
BEGIN
    SELECT ID_SESSIONS INTO p_SessionID
    FROM TB_USERS
    WHERE EMAIL = p_Email AND PASSWORD = p_Password;
END;

-- Nuevo Usuario
-- Crear Secuencia para Usuario
CREATE SEQUENCE USER_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- Nuevo Usuario
CREATE OR REPLACE PROCEDURE Create_User(
    p_UserID OUT NUMBER,
    p_Name VARCHAR2,
    p_Email VARCHAR2,
    p_Password VARCHAR2
) AS
BEGIN
    -- Verifica si el usuario ya existe
    IF NOT EXISTS (SELECT 1 FROM TB_USERS WHERE USER_ID = p_UserID)
BEGIN
    INSERT INTO TB_USERS(USER_ID, NAME_USERS, EMAIL, PASSWORD)
    VALUES (USER_SEQ.NEXTVAL, p_Name, p_Email, p_Password)
    RETURNING USER_ID INTO p_UserID;
END
ELSE
BEGIN
    -- El usuario ya existe, realiza acciones adicionales si es necesario.
    PRINT 'El usuario ya existe. Elige otro nombre de usuario.';
    END;
END;

-- Borrar Usuario
CREATE OR REPLACE PROCEDURE Delete_User(
    p_UserID NUMBER
) AS
BEGIN
    -- Verifica si el usuario existe
    IF EXISTS (SELECT 1 FROM TB_USERS WHERE USER_ID = p_UserID)
BEGIN
    DELETE FROM TB_USERS
    WHERE USER_ID = p_UserID;
    PRINT 'Usuario borrado exitosamente.';
END
    ELSE
    BEGIN
        -- El usuario no existe, realiza acciones adicionales si es necesario.
        PRINT 'El usuario no existe. No se pudo realizar la eliminación.';
    END;
END;

-- Actualizar Usuario
CREATE OR REPLACE PROCEDURE Update_User(
    p_UserID NUMBER
    p_Name VARCHAR2,
    p_Email VARCHAR2,
    p_Password VARCHAR2
) AS
BEGIN
    -- Verifica si el usuario existe
    IF EXISTS (SELECT 1 FROM TB_USERS WHERE USER_ID = p_UserID)
BEGIN
    UPDATE INTO TB_USERS(USER_ID, NAME_USERS, EMAIL, PASSWORD)
    VALUES (USER_SEQ.NEXTVAL, p_Name, p_Email, p_Password)
    RETURNING USER_ID INTO p_UserID;
    PRINT 'Usuario actualizado exitosamente.';

END
    ELSE
    BEGIN
        -- El usuario no existe, realiza acciones adicionales si es necesario.
        PRINT 'El usuario no existe. No se pudo realizar la Actualizacion.';
    END;
END;


-- Sacar Cita
-- Crear Secuencia para Citas
CREATE SEQUENCE APPOINTMENT_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;


-- Programar Cita
CREATE OR REPLACE PROCEDURE Schedule_Appointment(
    p_ClienteID NUMBER,
    P_EspecialistaID,
    p_Date DATE,
    p_Time VARCHAR2,
    p_ProvinciaID NUMBER,
    p_SucursalID NUMBER,
    P_TipocitaID NUMBER,
    P_Estado VARCHAR2,
    p_AppointmentID OUT NUMBER
) AS
BEGIN
    -- Verifica si la cita ya existe
    IF NOT EXISTS (SELECT 1 FROM TB_APPOINTMENTS WHERE APPOINTMENT_ID = p_AppointmentID)
BEGIN
    INSERT INTO TB_APPOINTMENTS (APPOINTMENT_ID, CLIENTE_ID, ESPECIALISTA_ID, FECHA, HORA, PROVINCIA_ID, SUCURSAL_ID, TIPOCITA_ID, ESTADO)
    VALUES (APPOINTMENT_SEQ.NEXTVAL, p_ClienteID, p_Date, p_Time, p_ProvinciaID, p_SucursalID, p_TipocitaID, p_Estado)
    RETURNING APPOINTMENT_ID INTO p_AppointmentID;
END
ELSE
BEGIN
    -- La cita ya existe, realiza acciones adicionales si es necesario.
    PRINT 'La cita ya existe.';
END;
END;

-- Borrar Cita
CREATE OR REPLACE PROCEDURE Cancel_Appointment(
    p_AppointmentID NUMBER
) AS
BEGIN
    -- Verifica si la cita existe
    IF EXISTS (SELECT 1 FROM TB_APPOINTMENTS WHERE APPOINTMENT_ID = p_AppointmentID)
BEGIN
    DELETE FROM TB_APPOINTMENTS
    WHERE APPOINTMENT_ID = p_AppointmentID;
END
    ELSE
    BEGIN
        -- La cita no existe, realiza acciones adicionales si es necesario.
        PRINT 'La cita  no existe. No se pudo realizar la eliminación.';
    END;
END;

-- Actualiza Cita
CREATE OR REPLACE PROCEDURE Update_Appointment(
    p_ClienteID NUMBER,
    P_EspecialistaID,
    p_Date DATE,
    p_Time VARCHAR2,
    p_ProvinciaID NUMBER,
    p_SucursalID NUMBER,
    P_TipocitaID NUMBER,
    P_Estado VARCHAR2,
    p_AppointmentID OUT NUMBER
) AS
BEGIN
    -- Verifica si la cita ya existe
    IF NOT EXISTS (SELECT 1 FROM TB_APPOINTMENTS WHERE APPOINTMENT_ID = p_AppointmentID)
BEGIN
    UPDATE INTO TB_APPOINTMENTS (APPOINTMENT_ID, CLIENTE_ID, ESPECIALISTA_ID, FECHA, HORA, PROVINCIA_ID, SUCURSAL_ID, TIPOCITA_ID, ESTADO)
    VALUES (APPOINTMENT_SEQ.NEXTVAL, p_ClienteID, p_Date, p_Time, p_ProvinciaID, p_SucursalID, p_TipocitaID, p_Estado)
    RETURNING APPOINTMENT_ID INTO p_AppointmentID;
END
ELSE
BEGIN
    -- La cita no existe, realiza acciones adicionales si es necesario..
    PRINT 'La cita no existe, no se puede actualizar.';
END;
END;



-- Obtener Informaci�n del Usuario
CREATE OR REPLACE PROCEDURE Get_User_Info(
    p_UserID NUMBER,
    p_Name OUT VARCHAR2,
    p_Email OUT VARCHAR2
) AS
BEGIN
    SELECT NAME_USERS, EMAIL INTO p_Name, p_Email
    FROM TB_USERS
    WHERE USER_ID = p_UserID;
END;

-- Listar Citas de un Usuario
CREATE OR REPLACE PROCEDURE List_User_Appointments(
    p_UserID NUMBER
) AS
BEGIN
    FOR rec IN (SELECT * FROM TB_APPOINTMENTS WHERE ID_SESSIONS = p_UserID) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Appointment ID: ' || rec.APPOINTMENT_ID || ', Date: ' || rec.FECHA || ', Time: ' || rec.HORA);
    END LOOP;
END;

-- Actualizar Informaci�n del Usuario
CREATE OR REPLACE PROCEDURE Update_User_Info(
    p_UserID NUMBER,
    p_NewName VARCHAR2,
    p_NewEmail VARCHAR2
) AS
BEGIN
    UPDATE TB_USERS
    SET NAME_USERS = p_NewName, EMAIL = p_NewEmail
    WHERE USER_ID = p_UserID;
END;

-- Obtener Detalles de una Cita
CREATE OR REPLACE PROCEDURE Get_Appointment_Details(
    p_AppointmentID NUMBER,
    p_ClienteID NUMBER,
    P_EspecialistaID,
    p_Date DATE,
    p_Time VARCHAR2,
    p_ProvinciaID NUMBER,
    p_SucursalID NUMBER,
    P_TipocitaID NUMBER,
    P_Estado VARCHAR2,
) AS
BEGIN
    SELECT CLIENTE_ID, ESPECIALISTA_ID, FECHA, HORA, PROVINCIA_ID, SUCURSAL_ID, TIPOCITA_ID, ESTADO INTO p_ClienteID, P_EspecialistaID p_Date, p_Time, p_ProvinciaID, p_SucursalID, p_TipocitaID, p_Estado    FROM TB_APPOINTMENTS
    WHERE APPOINTMENT_ID = p_AppointmentID;
END;

-- Listar Todas las Citas
CREATE OR REPLACE PROCEDURE List_All_Appointments AS
BEGIN
    FOR rec IN (SELECT * FROM TB_APPOINTMENTS) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Appointment ID: ' || rec.APPOINTMENT_ID || ', Date: ' || rec.FECHA || ', Time: ' || rec.HORA);
    END LOOP;
END;


-- Obtener Detalles de una Factura
CREATE OR REPLACE PROCEDURE Get_Invoice_Details(
    p_InvoiceID NUMBER,
    p_SessionID OUT NUMBER,
    p_PaymentID OUT NUMBER
) AS
BEGIN
    SELECT ID_SESSIONS, ID_PAYMENTS INTO p_SessionID, p_PaymentID
    FROM TB_FACTURA
    WHERE FACTURA_ID = p_InvoiceID;
END;

-- Obtener Todas las Facturas
CREATE OR REPLACE PROCEDURE List_All_Invoices AS
BEGIN
    FOR rec IN (SELECT * FROM TB_FACTURA) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Invoice ID: ' || rec.FACTURA_ID || ', Session ID: ' || rec.ID_SESSIONS || ', Payment ID: ' || rec.ID_PAYMENTS);
    END LOOP;
END;


-- Obtener Detalles de un Usuario por Correo Electr�nico
CREATE OR REPLACE PROCEDURE Get_User_DetailsByEmail(
    p_Email VARCHAR2,
    p_UserID OUT NUMBER,
    p_Name OUT VARCHAR2
) AS
BEGIN
    SELECT USER_ID, NAME_USERS INTO p_UserID, p_Name
    FROM TB_USERS
    WHERE EMAIL = p_Email;
END;

-- Obtener Detalles de una Cita por Fecha
CREATE OR REPLACE PROCEDURE Get_Appointment_DetailsByDate(
    p_Date DATE
) AS
BEGIN
    FOR rec IN (SELECT * FROM TB_APPOINTMENTS WHERE FECHA = p_Date) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Appointment ID: ' || rec.APPOINTMENT_ID || ', Date: ' || rec.FECHA || ', Time: ' || rec.HORA);
    END LOOP;
END;

-- Obtener Citas Programadas para Hoy
CREATE OR REPLACE PROCEDURE Get_AppointmentsForToday AS
BEGIN
    FOR rec IN (SELECT * FROM TB_APPOINTMENTS WHERE FECHA = TRUNC(SYSDATE)) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Appointment ID: ' || rec.APPOINTMENT_ID || ', Date: ' || rec.FECHA || ', Time: ' || rec.HORA);
    END LOOP;
END;

--vistas

--Vista de Usuarios y  Clientes:
CREATE OR REPLACE VIEW UsersAndSessions AS
SELECT U.USER_ID, U.NAME_USERS, U.EMAIL, C.CLIENTE_ID
FROM TB_USERS U
INNER JOIN TB_CLIENTES C ON U.CLIENTE_ID = C.CLIENTE_ID;

--Vista de Clientes y Provincias:
CREATE OR REPLACE VIEW ClientsAndPROVINCIA_ID AS
SELECT C.CLIENTE_ID, C.FIRST_NAME, C.LAST_NAME, C.BIRTHDATE, P.NAME AS PROVINCIA_NAME
FROM TB_CLIENTES C
INNER JOIN TB_PROVINCIA P ON C.PROVINCIA_ID = P.PROVINCIA_ID;


--Vista de Clientes y Citas:
CREATE OR REPLACE VIEW ClientssAndAppointments AS
SELECT C.CLIENTE_ID, C.FIRST_NAME, A.FECHA, A.HORA
FROM TB_CLIENTES C
INNER JOIN TB_APPOINTMENTS A ON C.CLIENTE_ID = A.CLIENTE_ID;

--Vista de Usuarios con Detalles de Citas:
CREATE OR REPLACE VIEW UsersWithAppointmentDetails AS
SELECT U.NAME_USERS, U.EMAIL, AU.DESCRIPCION
FROM TB_USERS U
LEFT JOIN TB_AUDITORIACITAS AU ON U.DESCRIPCION = AU.DESCRIPCION;


--Vista de Clientes con Informaci�n de Tipo citas:
CREATE OR REPLACE VIEW ClientsWithAppointmentType AS
SELECT C.FIRST_NAME, C.LAST_NAME, T.TIPOCITA_ID, T.NOMBRE_TIPOCITA
FROM TB_CLIENTES C
LEFT JOIN TB_TIPOCITAS T ON C.NOMBRE_TIPOCITA = T.NOMBRE_TIPOCITA;

--Vista de Citas por Provincia:
CREATE OR REPLACE VIEW AppointmentsByProvince AS
SELECT A.FECHA, A.HORA, P.NAME AS PROVINCIA_NAME
FROM TB_APPOINTMENTS A
INNER JOIN TB_PROVINCIA P ON A.PROVINCIA_ID = P.PROVINCIA_ID;

--Vista de citas con Usuarios y Clientes:
CREATE OR REPLACE VIEW SessionsWithUsersAndClients AS
SELECT AU.AUDITORIA_ID, AU.DESCRIPCION, U.NAME_USERS, C.FIRST_NAME, C.LAST_NAME
FROM TB_AUDITORIACITAS AU
LEFT JOIN TB_USERS U ON AU.AUDITORIA_ID = U.AUDITORIA_ID
LEFT JOIN TB_CLIENTES C ON AU.AUDITORIA_ID = C.AUDITORIA_ID;

--Vista de citas y Usuarios sin Clientes:
CREATE OR REPLACE VIEW SessionsWithUsersWithoutClients AS
SELECT AU.AUDITORIA_ID, AU.DESCRIPCION, U.NAME_USERS
FROM TB_AUDITORIACITAS AU
LEFT JOIN TB_USERS U ON AU.AUDITORIA_ID = U.AUDITORIA_ID
WHERE AU.AUDITORIA_ID NOT IN (SELECT AUDITORIA_ID FROM TB_CLIENTES);


--Vista de Auditoriacitas y Provincias de los Clientes:
CREATE OR REPLACE VIEW SessionsWithClientPROVINCIA_ID AS
SELECT AU.AUDITORIA_ID, AU.DESCRIPCION, P.NAME AS PROVINCIA_NAME
FROM TB_AUDITORIACITAS AU
INNER JOIN TB_CLIENTES C ON AU.AUDITORIA_ID = C.AUDITORIA_ID
INNER JOIN TB_PROVINCIA P ON C.PROVINCIA_ID = P.PROVINCIA_ID;

--Funciones

--Funci�n para Calcular la Edad de un Cliente a partir de su Fecha de Nacimiento:
CREATE OR REPLACE FUNCTION CalculateAge(p_Birthdate DATE) RETURN NUMBER IS
    v_Age NUMBER;
BEGIN
    v_Age := TRUNC(MONTHS_BETWEEN(SYSDATE, p_Birthdate) / 12);
    RETURN v_Age;
END;


--Funci�n para Verificar si un Usuario Existe por su Correo Electr�nico:
CREATE OR REPLACE FUNCTION UserExists(p_Email VARCHAR2) RETURN BOOLEAN IS
    v_Count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_Count
    FROM TB_USERS
    WHERE EMAIL = p_Email;
    RETURN v_Count > 0;
END;


--Funci�n para Encontrar el Pr�ximo Disponible en una Cita:
CREATE OR REPLACE FUNCTION FindNextAvailableAppointment(p_AppointmentID NUMBER) RETURN DATE IS
    v_NextAppointment DATE;
BEGIN
    SELECT MIN(FECHA) INTO v_NextAppointment
    FROM TB_APPOINTMENTS
    WHERE APPOINTMENT_ID = p_AppointmentID AND FECHA > SYSDATE;
    RETURN v_NextAppointment;
END;


--Funci�n para Calcular la Cantidad de Citas de un Cliente en una Fecha Espec�fica:
CREATE OR REPLACE FUNCTION CountAppointmentsOnDate(p_AppointmentID NUMBER, p_Date DATE) RETURN NUMBER IS
    v_Count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_Count
    FROM TB_APPOINTMENTS
    WHERE APPOINTMENT_ID = p_AppointmentID AND FECHA = p_Date;
    RETURN v_Count;
END;

--Funci�n para Calcular el Promedio de Edades de los Clientes en una Provincia:
CREATE OR REPLACE FUNCTION CalculateAverageAgeInProvince(p_ProvinciaID NUMBER) RETURN NUMBER IS
    v_AvgAge NUMBER;
BEGIN
    SELECT AVG(CalculateAge(C.BIRTHDATE)) INTO v_AvgAge
    FROM TB_CLIENTES C
    WHERE C.PROVINCIA_ID = p_ProvinciaID;
    RETURN v_AvgAge;
END;

--Funci�n para Calcular la Cantidad de Clientes por Provincia:
CREATE OR REPLACE FUNCTION CountClientsInProvince(p_ProvincIAID NUMBER) RETURN NUMBER IS
    v_Count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_Count
    FROM TB_CLIENTES
    WHERE PROVINCIA_ID = p_ProvinciaID;
    RETURN v_Count;
END;


--Funci�n para Encontrar el Cliente con M�s Citas Programadas:
CREATE OR REPLACE FUNCTION FindClientWithMostAppointments RETURN VARCHAR2 IS
    v_ClientName VARCHAR2(100);
    v_MaxAppointments NUMBER;
BEGIN
    SELECT MAX(AppointmentCount), ClientName
    INTO v_MaxAppointments, v_ClientName
    FROM (
        SELECT COUNT(*) AS AppointmentCount, C.FIRST_NAME || ' ' || C.LAST_NAME AS ClientName
        FROM TB_APPOINTMENTS A
        JOIN TB_CLIENTES C ON A.APPOINTMENT_ID = C.APPOINTMENT_ID
        GROUP BY C.FIRST_NAME || ' ' || C.LAST_NAME
    );
    RETURN v_ClientName;
END;


--Funci�n para Verificar si un usuario Tiene Citas Programadas:
CREATE OR REPLACE FUNCTION HasAppointments(p_UserID NUMBER) RETURN BOOLEAN IS
    v_Count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_Count
    FROM TB_APPOINTMENTS
    WHERE USER_ID = p_UserID;
    RETURN v_Count > 0;
END;



--triggers

CREATE TABLE Audit_Log (
    Log_ID NUMBER PRIMARY KEY,
    Table_Name VARCHAR2(50),
    Action VARCHAR2(10),
    Action_Date DATE);

--Un trigger que se activa antes de insertar un nuevo registro en la tabla TB_USERS y registra la fecha y hora de la acci�n en otra tabla.

CREATE OR REPLACE TRIGGER User_Insert_Trigger
BEFORE INSERT ON TB_USERS
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Table_Name, Action, Action_Date)
    VALUES ('TB_USERS', 'INSERT', SYSDATE);
END;
/

--Un trigger que se activa antes de eliminar un registro en la tabla TB_USERS y registra la fecha y hora de la acci�n en otra tabla.
CREATE OR REPLACE TRIGGER User_Delete_Trigger
BEFORE DELETE ON TB_USERS
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Table_Name, Action, Action_Date)
    VALUES ('TB_USERS', 'DELETE', SYSDATE);
END;

--Un trigger que se activa antes de insertar un nuevo registro en la tabla TB_CLIENTES y registra la fecha y hora de la acci�n en otra tabla.
CREATE OR REPLACE TRIGGER Cliente_Insert_Trigger
BEFORE INSERT ON TB_CLIENTES
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Table_Name, Action, Action_Date)
    VALUES ('TB_CLIENTES', 'INSERT', SYSDATE);
END;


--Un trigger que se activa antes de actualizar un registro en la tabla TB_CLIENTES y registra la fecha y hora de la acci�n en otra tabla.
CREATE OR REPLACE TRIGGER Cliente_Update_Trigger
BEFORE UPDATE ON TB_CLIENTES
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Table_Name, Action, Action_Date)
    VALUES ('TB_CLIENTES', 'UPDATE', SYSDATE);
END;

--Un trigger que se activa antes de eliminar un registro en la tabla TB_CLIENTES y registra la fecha y hora de la acci�n en otra tabla.
CREATE OR REPLACE TRIGGER Cliente_Delete_Trigger
BEFORE DELETE ON TB_CLIENTES
FOR EACH ROW
BEGIN
    INSERT INTO Audit_Log (Table_Name, Action, Action_Date)
    VALUES ('TB_CLIENTES', 'DELETE', SYSDATE);
END;

--Cursor

--Cursor Simple para Seleccionar Todos los Usuarios
DECLARE
    CURSOR user_cursor IS
        SELECT * FROM TB_USERS;
BEGIN
    FOR user_rec IN user_cursor LOOP
        -- Procesa los registros aqu�
        -- Por ejemplo, puedes imprimir informaci�n sobre cada registro:
        DBMS_OUTPUT.PUT_LINE('USER_ID: ' || user_rec.USER_ID);
        DBMS_OUTPUT.PUT_LINE('NAME_USERS: ' || user_rec.NAME_USERS);
        DBMS_OUTPUT.PUT_LINE('EMAIL: ' || user_rec.EMAIL);
        
    END LOOP;
END;

--Cursor para Listar Citas Pendientes
CREATE OR REPLACE PROCEDURE List_Pending_Appointments_Cursor AS
    CURSOR appointment_cursor IS
        SELECT *
        FROM TB_APPOINTMENTS
        WHERE FECHA > SYSDATE;
BEGIN
    FOR rec IN appointment_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE('Appointment ID: ' || rec.APPOINTMENT_ID || ', Date: ' || rec.FECHA || ', Time: ' || rec.HORA);
    END LOOP;
END;

--Cursor para Listar Usuarios con Citas Pendientes
CREATE OR REPLACE PROCEDURE List_Users_With_Pending_Appointments_Cursor AS
    CURSOR user_cursor IS
        SELECT U.*
        FROM TB_USERS U
        JOIN TB_APPOINTMENTS A ON U.USER_ID = A.APPOINTMENT_ID;
BEGIN
    FOR rec IN user_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE('User ID: ' || rec.USER_ID || ', Name: ' || rec.NAME_USERS || ', Email: ' || rec.EMAIL);
    END LOOP;
END;

--Cursor para Listar Citas de una Provincia
CREATE OR REPLACE PROCEDURE List_Appointments_By_Province_Cursor(
    p_ProvinciaID NUMBER
) AS
    CURSOR appointment_cursor IS
        SELECT *
        FROM TB_APPOINTMENTS
        WHERE PROVINCIA_ID = p_ProvinciaID;
BEGIN
    FOR rec IN appointment_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE('Appointment ID: ' || rec.APPOINTMENT_ID || ', Date: ' || rec.FECHA || ', Time: ' || rec.HORA);
    END LOOP;
END;

--Cursor para Listar Usuarios de una Provincia
CREATE OR REPLACE PROCEDURE List_Users_By_Province_Cursor(
    p_ProvinciaID NUMBER
) AS
    CURSOR user_cursor IS
        SELECT U.*
        FROM TB_USERS U
        JOIN TB_CLIENTES C ON U.USER_ID = C.User_idParent
        WHERE C.PROVINCIA_ID = p_ProvinciaID;
BEGIN
    FOR rec IN user_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE('User ID: ' || rec.USER_ID || ', Name: ' || rec.NAME_USERS || ', Email: ' || rec.EMAIL);
    END LOOP;
END;


--Cursor para Actualizar Informaci�n del Usuario:
CREATE OR REPLACE PROCEDURE Update_User_Info_Cursor(
    p_UserID NUMBER,
    p_NewName VARCHAR2,
    p_NewEmail VARCHAR2
) AS
    CURSOR user_cursor IS
        SELECT * FROM TB_USERS
        WHERE USER_ID = p_UserID
        FOR UPDATE;
BEGIN
    FOR rec IN user_cursor
    LOOP
        UPDATE TB_USERS
        SET NAME_USERS = p_NewName, EMAIL = p_NewEmail
        WHERE CURRENT OF user_cursor;
    END LOOP;
    COMMIT;
END;


--Cursor para Obtener Informaci�n del Usuario
CREATE OR REPLACE PROCEDURE Get_User_Info_Cursor(
    p_UserID NUMBER,
    p_Name OUT VARCHAR2,
    p_Email OUT VARCHAR2
) AS
    CURSOR user_cursor IS
        SELECT NAME_USERS, EMAIL
        INTO p_Name, p_Email
        FROM TB_USERS
        WHERE USER_ID = p_UserID;
BEGIN
    OPEN user_cursor;
    FETCH user_cursor INTO p_Name, p_Email;
    CLOSE user_cursor;
END;

--Cursor para Obtener Detalles de una Cita
CREATE OR REPLACE PROCEDURE Get_Appointment_Details_Cursor(
    p_AppointmentID NUMBER,
    p_ClienteID NUMBER,
    P_EspecialistaID,
    p_Date DATE,
    p_Time VARCHAR2,
    p_ProvinciaID NUMBER,
    p_SucursalID NUMBER,
    P_TipocitaID NUMBER,
    P_Estado VARCHAR2
) AS
    CURSOR appointment_cursor IS
        SELECT APPOINTMENT_ID, CLIENTE_ID, ESPECIALISTA_ID, FECHA, HORA, PROVINCIA_ID, SUCURSAL_ID, TIPOCITA_ID, ESTADO 
        INTO p_AppointmentID, p_ClienteID, P_EspecialistaID, p_Date, p_Time, p_ProvinciaID, p_SucursalID, p_TipocitaID, p_Estado
        FROM TB_APPOINTMENTS
        WHERE APPOINTMENT_ID = p_AppointmentID;
BEGIN
    OPEN appointment_cursor;
    FETCH appointment_cursor INTO p_Date, p_Time, p_ProvinciaID;
    CLOSE appointment_cursor;
END;


--Cursor para Listar Usuarios con Citas Programadas para Hoy
CREATE OR REPLACE PROCEDURE List_Users_With_Appointments_Today_Cursor AS
    CURSOR user_cursor IS
        SELECT DISTINCT U.*
        FROM TB_USERS U
        JOIN TB_APPOINTMENTS A ON U.USER_ID = A.USER_ID
        WHERE TRUNC(A.FECHA) = TRUNC(SYSDATE);
BEGIN
    FOR rec IN user_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE('User ID: ' || rec.USER_ID || ', Name: ' || rec.NAME_USERS || ', Email: ' || rec.EMAIL);
    END LOOP;
END;
