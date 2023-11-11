
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
INSERT INTO TB_CLIENTES (CLIENTE_ID,  FIRST_NAME, last_name, EMAIL  birthdate,   PROVINCIA_ID) VALUES (2,  'Cliente 2', 'Apellido 2',  'user1@example.com', TO_DATE('1995-05-05', 'YYYY-MM-DD'), 1);
INSERT INTO TB_CLIENTES (CLIENTE_ID,  FIRST_NAME, last_name, EMAIL, birthdate,   PROVINCIA_ID) VALUES (1,  'Cliente 1', 'Apellido 1',  'user2@example.com', TO_DATE('2000-01-01', 'YYYY-MM-DD'), 2);
INSERT INTO TB_CLIENTES (CLIENTE_ID,  FIRST_NAME, last_name, EMAIL, birthdate,   PROVINCIA_ID) VALUES (3,  'Cliente 3', 'Apellido 3',  'user3@example.com', TO_DATE('1988-10-10', 'YYYY-MM-DD'), 3);
INSERT INTO TB_CLIENTES (CLIENTE_ID,  FIRST_NAME, last_name, EMAIL, birthdate,   PROVINCIA_ID) VALUES (4,  'Cliente 4', 'Apellido 4',  'user4@example.com', TO_DATE('1980-12-25', 'YYYY-MM-DD'), 4);


-- Inserts para TB_APPOINTMENTS
INSERT INTO TB_APPOINTMENTS (APPOINTMENT_ID, CLIENTE_ID, ESPECIALISTA_ID, FECHA, HORA, PROVINCIA_ID, ESTADO) VALUES (1, 1, TO_DATE('2023-11-10', 'YYYY-MM-DD'), '10:00 AM', 1, 'Programada');
INSERT INTO TB_APPOINTMENTS (APPOINTMENT_ID, CLIENTE_ID, ESPECIALISTA_ID, FECHA, HORA,  PROVINCIA_ID, ESTADO) VALUES (2, 2, TO_DATE('2023-11-12', 'YYYY-MM-DD'), '02:30 PM', 2, 'Realizada');
INSERT INTO TB_APPOINTMENTS (APPOINTMENT_ID, CLIENTE_ID, ESPECIALISTA_ID, FECHA, HORA, PROVINCIA_ID, ESTADO) VALUES (3, 3, TO_DATE('2023-11-15', 'YYYY-MM-DD'), '11:45 AM', 3, 'Cancelada');
INSERT INTO TB_APPOINTMENTS (APPOINTMENT_ID, CLIENTE_ID, ESPECIALISTA_ID, FECHA, HORA, PROVINCIA_ID, ESTADO) VALUES (4, 4, TO_DATE('2023-11-18', 'YYYY-MM-DD'), '09:00 AM', 4, 'Programada');


-- Inserts para TB_ESPECIALISTAS
INSERT INTO TB_ESPECIALISTAS (ESPECIALISTA_ID, USER_ID, ESPECIALIDAD) VALUES (1, 1, 'Especialidad1');
INSERT INTO TB_ESPECIALISTAS (ESPECIALISTA_ID, USER_ID, ESPECIALIDAD) VALUES (2, 2, 'Especialidad2');
INSERT INTO TB_ESPECIALISTAS (ESPECIALISTA_ID, USER_ID, ESPECIALIDAD) VALUES (3, 3, 'Especialidad3');
INSERT INTO TB_ESPECIALISTAS (ESPECIALISTA_ID, USER_ID, ESPECIALIDAD) VALUES (4, 4, 'Especialidad4');


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
  

-- Inserts para TB_AUDITORIACITAS
INSERT INTO TB_AUDITORIACITAS (AUDITORIA_ID, APPOINTMENT_ID, NOMBRE, DESCRIPCION, FECHA) VALUES (1, 1, '', '', TO_DATE('2023-11-10', 'YYYY-MM-DD'));
INSERT INTO TB_AUDITORIACITAS (AUDITORIA_ID, APPOINTMENT_ID, NOMBRE, DESCRIPCION, FECHA) VALUES (2, 2, '', '', TO_DATE('2023-11-10', 'YYYY-MM-DD'));
INSERT INTO TB_AUDITORIACITAS (AUDITORIA_ID, APPOINTMENT_ID, NOMBRE, DESCRIPCION, FECHA) VALUES (3, 3, '', '', TO_DATE('2023-11-10', 'YYYY-MM-DD'));
INSERT INTO TB_AUDITORIACITAS (AUDITORIA_ID, APPOINTMENT_ID, NOMBRE, DESCRIPCION, FECHA) VALUES (4, 4, '', '', TO_DATE('2023-11-10', 'YYYY-MM-DD'));


CREATE TABLE TB_USERS(
USER_ID INT PRIMARY KEY,
NAME_USERS VARCHAR(100),
EMAIL VARCHAR(255),
PASSWORD VARCHAR(100),
Rol VARCHAR(20));  -- Puede ser "Cliente" o "Especialista"


CREATE TABLE TB_PROVINCIA(
PROVINCIA_ID INT PRIMARY KEY,
NAME VARCHAR(100));

CREATE TABLE TB_CLIENTES(
CLIENTE_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(255),
last_name VARCHAR(255),
EMAIL VARCHAR(255),
birthdate DATE,
PROVINCIA_ID INT,
FOREIGN KEY (PROVINCIA_ID) REFERENCES TB_PROVINCIA(PROVINCIA_ID));

CREATE TABLE TB_APPOINTMENTS(
APPOINTMENT_ID NUMBER PRIMARY KEY,
CLIENTE_ID INT,
ESPECIALISTA_ID INT,
FECHA DATETIME,
HORA VARCHAR (255),
PROVINCIA_ID INT,
ESTADO VARCHAR(20) DEFAULT 'Programada', -- Puede ser 'Programada', 'Realizada', 'Cancelada', etc.
FOREIGN KEY (CLIENTE_ID) REFERENCES TB_CLIENTES(CLIENTE_ID),
FOREIGN KEY (ESPECIALISTA_ID) REFERENCES TB_USERS(USER_ID),
FOREIGN KEY (TipoCitaID) REFERENCES TiposCitas(TipoCitaID),
FOREIGN KEY (SUCURSAL_ID) REFERENCES TB_SUCURSALES(SUCURSAL_ID)
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
    TIPOCITA_ID INT PRIMARY KEY,
    NOMBRE_TIPOCITA VARCHAR(50));


CREATE TABLE TB_AUDITORIACITAS (
    AUDITORIA_ID INT PRIMARY KEY,
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
    INSERT INTO TB_USERS(USER_ID, NAME_USERS, EMAIL, PASSWORD)
    VALUES (USER_SEQ.NEXTVAL, p_Name, p_Email, p_Password)
    RETURNING USER_ID INTO p_UserID;
END;

-- Borrar Usuario
CREATE OR REPLACE PROCEDURE Delete_User(
    p_UserID NUMBER
) AS
BEGIN
    DELETE FROM TB_USERS
    WHERE USER_ID = p_UserID;
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
    p_UserID NUMBER,
    p_Date DATE,
    p_Time VARCHAR2,
    p_ProvinceID NUMBER,
    p_AppointmentID OUT NUMBER
) AS
BEGIN
    INSERT INTO TB_APPOINTMENTS(APPOINTMENT_ID, ID_SESSIONS, FECHA, HORA, PROVINCIA_ID)
    VALUES (APPOINTMENT_SEQ.NEXTVAL, p_UserID, p_Date, p_Time, p_ProvinceID)
    RETURNING APPOINTMENT_ID INTO p_AppointmentID;
END;

-- Borrar Cita
CREATE OR REPLACE PROCEDURE Cancel_Appointment(
    p_AppointmentID NUMBER
) AS
BEGIN
    DELETE FROM TB_APPOINTMENTS
    WHERE APPOINTMENT_ID = p_AppointmentID;
END;

-- Pagar Cita
-- Crear Secuencia para Pagos
CREATE SEQUENCE PAYMENT_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- Realizar Pago
CREATE OR REPLACE PROCEDURE Make_Payment(
    p_AppointmentID NUMBER,
    p_Detail VARCHAR2,
    p_Total NUMBER,
    p_PaymentID OUT NUMBER
) AS
BEGIN
    INSERT INTO TB_PAYMENTS(ID_PAYMENTS, ID_SESSIONS, DETAIL, TOTAL, PAYMENT_DAY)
    VALUES (PAYMENT_SEQ.NEXTVAL, p_AppointmentID, p_Detail, p_Total, SYSDATE)
    RETURNING ID_PAYMENTS INTO p_PaymentID;
END;

-- Cancelar Pago
CREATE OR REPLACE PROCEDURE Cancel_Payment(
    p_PaymentID NUMBER
) AS
BEGIN
    DELETE FROM TB_PAYMENTS
    WHERE ID_PAYMENTS = p_PaymentID;
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
    p_Date OUT DATE,
    p_Time OUT VARCHAR2,
    p_ProvinceID OUT NUMBER
) AS
BEGIN
    SELECT FECHA, HORA, PROVINCIA_ID INTO p_Date, p_Time, p_ProvinceID
    FROM TB_APPOINTMENTS
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

-- Obtener Detalles del Pago
CREATE OR REPLACE PROCEDURE Get_Payment_Details(
    p_PaymentID NUMBER,
    p_Detail OUT VARCHAR2,
    p_Total OUT NUMBER,
    p_PaymentDay OUT DATE
) AS
BEGIN
    SELECT DETAIL, TOTAL, PAYMENT_DAY INTO p_Detail, p_Total, p_PaymentDay
    FROM TB_PAYMENTS
    WHERE ID_PAYMENTS = p_PaymentID;
END;

-- Listar Pagos de un Usuario
CREATE OR REPLACE PROCEDURE List_User_Payments(
    p_UserID NUMBER
) AS
BEGIN
    FOR rec IN (SELECT * FROM TB_PAYMENTS WHERE ID_SESSIONS = p_UserID) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Payment ID: ' || rec.ID_PAYMENTS || ', Detail: ' || rec.DETAIL || ', Total: ' || rec.TOTAL);
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

-- Obtener Facturas de un Usuario
CREATE OR REPLACE PROCEDURE List_User_Invoices(
    p_UserID NUMBER
) AS
BEGIN
    FOR rec IN (SELECT f.* 
                FROM TB_FACTURA f
                JOIN TB_SESSIONS s ON f.ID_SESSIONS = s.ID_SESSIONS
                WHERE s.USER_ID_SESSIONS = p_UserID) 
    LOOP
        DBMS_OUTPUT.PUT_LINE('Invoice ID: ' || rec.FACTURA_ID || ', Session ID: ' || rec.ID_SESSIONS || ', Payment ID: ' || rec.ID_PAYMENTS);
    END LOOP;
END;

-- Crear Factura
CREATE OR REPLACE PROCEDURE Create_Invoice(
    p_SessionID NUMBER,
    p_PaymentID NUMBER,
    p_InvoiceID OUT NUMBER
) AS
BEGIN
    INSERT INTO TB_FACTURA(FACTURA_ID, ID_SESSIONS, ID_PAYMENTS)
    VALUES (PAYMENT_SEQ.NEXTVAL, p_SessionID, p_PaymentID)
    RETURNING FACTURA_ID INTO p_InvoiceID;
END;

-- Actualizar Detalles de una Cita
CREATE OR REPLACE PROCEDURE Update_Appointment_Details(
    p_AppointmentID NUMBER,
    p_NewDate DATE,
    p_NewTime VARCHAR2,
    p_NewProvinceID NUMBER
) AS
BEGIN
    UPDATE TB_APPOINTMENTS
    SET FECHA = p_NewDate, HORA = p_NewTime, PROVINCIA_ID = p_NewProvinceID
    WHERE APPOINTMENT_ID = p_AppointmentID;
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

--Vista de Usuarios y Sesiones:
CREATE OR REPLACE VIEW UsersAndSessions AS
SELECT U.ID_SESSIONS, U.NAME_USERS, U.EMAIL, S.DETAIL
FROM TB_USERS U
INNER JOIN TB_SESSIONS S ON U.ID_SESSIONS = S.ID_SESSIONS;

--Vista de Clientes y Provincias:
CREATE OR REPLACE VIEW ClientsAndPROVINCIA_ID AS
SELECT C.ID_SESSIONS, C.FIRST_NAME, C.LAST_NAME, C.BIRTHDAY, P.NAME AS PROVINCE_NAME
FROM TB_CLIENTES C
INNER JOIN TB_PROVINCIA P ON C.PROVINCIA_ID = P.ID;


--Vista de Sesiones y Citas:
CREATE OR REPLACE VIEW SessionsAndAppointments AS
SELECT S.ID_SESSIONS, S.DETAIL, A.FECHA, A.HORA
FROM TB_SESSIONS S
INNER JOIN TB_APPOINTMENTS A ON S.ID_SESSIONS = A.ID_SESSIONS;

--Vista de Usuarios con Detalles de Sesiones:
CREATE OR REPLACE VIEW UsersWithSessionDetails AS
SELECT U.NAME_USERS, U.EMAIL, S.DETAIL
FROM TB_USERS U
LEFT JOIN TB_SESSIONS S ON U.ID_SESSIONS = S.ID_SESSIONS;


--Vista de Clientes con Informaci�n de Pagos:
CREATE OR REPLACE VIEW ClientsWithPayments AS
SELECT C.FIRST_NAME, C.LAST_NAME, P.DETAIL, P.TOTAL
FROM TB_CLIENTES C
LEFT JOIN TB_PAYMENTS P ON C.ID_SESSIONS = P.ID_SESSIONS;

--Vista de Citas por Provincia:
CREATE OR REPLACE VIEW AppointmentsByProvince AS
SELECT A.FECHA, A.HORA, P.NAME AS PROVINCE_NAME
FROM TB_APPOINTMENTS A
INNER JOIN TB_PROVINCIA P ON A.PROVINCIA_ID = P.ID;


--Vista de Facturas con Detalles de Pagos:
CREATE OR REPLACE VIEW InvoicesWithPaymentDetails AS
SELECT F.ID_SESSIONS, F.ID_PAYMENTS, P.DETAIL, P.TOTAL
FROM TB_FACTURA F
LEFT JOIN TB_PAYMENTS P ON F.ID_PAYMENTS = P.ID_PAYMENTS;

--Vista de Sesiones con Usuarios y Clientes:
CREATE OR REPLACE VIEW SessionsWithUsersAndClients AS
SELECT S.ID_SESSIONS, S.DETAIL, U.NAME_USERS, C.FIRST_NAME, C.LAST_NAME
FROM TB_SESSIONS S
LEFT JOIN TB_USERS U ON S.ID_SESSIONS = U.ID_SESSIONS
LEFT JOIN TB_CLIENTES C ON S.ID_SESSIONS = C.ID_SESSIONS;

--Vista de Sesiones y Usuarios sin Clientes:
CREATE OR REPLACE VIEW SessionsWithUsersWithoutClients AS
SELECT S.ID_SESSIONS, S.DETAIL, U.NAME_USERS
FROM TB_SESSIONS S
LEFT JOIN TB_USERS U ON S.ID_SESSIONS = U.ID_SESSIONS
WHERE S.ID_SESSIONS NOT IN (SELECT ID_SESSIONS FROM TB_CLIENTES);


--Vista de Sesiones y Provincias de los Clientes:
CREATE OR REPLACE VIEW SessionsWithClientPROVINCIA_ID AS
SELECT S.ID_SESSIONS, S.DETAIL, P.NAME AS PROVINCE_NAME
FROM TB_SESSIONS S
INNER JOIN TB_CLIENTES C ON S.ID_SESSIONS = C.ID_SESSIONS
INNER JOIN TB_PROVINCIA P ON C.PROVINCIA_ID = P.ID;

--Funciones

--Funci�n para Calcular la Edad de un Cliente a partir de su Fecha de Nacimiento:
CREATE OR REPLACE FUNCTION CalculateAge(p_Birthday DATE) RETURN NUMBER IS
    v_Age NUMBER;
BEGIN
    v_Age := TRUNC(MONTHS_BETWEEN(SYSDATE, p_Birthday) / 12);
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

--Funci�n para Calcular el Total de Pagos de un Cliente:
CREATE OR REPLACE FUNCTION CalculateTotalPayments(p_ID_SESSIONS NUMBER) RETURN NUMBER IS
    v_Total NUMBER;
BEGIN
    SELECT SUM(TOTAL) INTO v_Total
    FROM TB_PAYMENTS
    WHERE ID_SESSIONS = p_ID_SESSIONS;
    RETURN v_Total;
END;

--Funci�n para Encontrar el Pr�ximo Disponible en una Cita:
CREATE OR REPLACE FUNCTION FindNextAvailableAppointment(p_ID_SESSIONS NUMBER) RETURN DATE IS
    v_NextAppointment DATE;
BEGIN
    SELECT MIN(FECHA) INTO v_NextAppointment
    FROM TB_APPOINTMENTS
    WHERE ID_SESSIONS = p_ID_SESSIONS AND FECHA > SYSDATE;
    RETURN v_NextAppointment;
END;

--Funci�n para Calcular el Total de Facturas Pendientes para un Cliente:
CREATE OR REPLACE FUNCTION CalculateOutstandingInvoices(p_ID_SESSIONS NUMBER) RETURN NUMBER IS
    v_OutstandingTotal NUMBER;
BEGIN
    SELECT SUM(P.TOTAL)
    INTO v_OutstandingTotal
    FROM TB_FACTURA F
    JOIN TB_PAYMENTS P ON F.ID_PAYMENTS = P.ID_PAYMENTS
    WHERE F.ID_SESSIONS = p_ID_SESSIONS;
    RETURN v_OutstandingTotal;
END;

--Funci�n para Verificar si una Sesi�n Tiene Usuarios Asociados:
CREATE OR REPLACE FUNCTION HasAssociatedUsers(p_ID_SESSIONS NUMBER) RETURN BOOLEAN IS
    v_Count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_Count
    FROM TB_USERS
    WHERE ID_SESSIONS = p_ID_SESSIONS;
    RETURN v_Count > 0;
END;

--Funci�n para Calcular la Cantidad de Citas de un Cliente en una Fecha Espec�fica:
CREATE OR REPLACE FUNCTION CountAppointmentsOnDate(p_ID_SESSIONS NUMBER, p_Date DATE) RETURN NUMBER IS
    v_Count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_Count
    FROM TB_APPOINTMENTS
    WHERE ID_SESSIONS = p_ID_SESSIONS AND FECHA = p_Date;
    RETURN v_Count;
END;

--Funci�n para Calcular el Promedio de Edades de los Clientes en una Provincia:
CREATE OR REPLACE FUNCTION CalculateAverageAgeInProvince(p_ProvinceID NUMBER) RETURN NUMBER IS
    v_AvgAge NUMBER;
BEGIN
    SELECT AVG(CalculateAge(C.BIRTHDAY)) INTO v_AvgAge
    FROM TB_CLIENTES C
    WHERE C.PROVINCIA_ID = p_ProvinceID;
    RETURN v_AvgAge;
END;

--Funci�n para Encontrar el �ltimo Pago Realizado por un Cliente:
CREATE OR REPLACE FUNCTION FindLastPayment(p_ID_SESSIONS NUMBER) RETURN DATE IS
    v_LastPaymentDate DATE;
BEGIN
    SELECT MAX(PAYMENT_DAY) INTO v_LastPaymentDate
    FROM TB_PAYMENTS
    WHERE ID_SESSIONS = p_ID_SESSIONS;
    RETURN v_LastPaymentDate;
END;

--Funci�n para Calcular la Cantidad de Clientes por Provincia:
CREATE OR REPLACE FUNCTION CountClientsInProvince(p_ProvinceID NUMBER) RETURN NUMBER IS
    v_Count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_Count
    FROM TB_CLIENTES
    WHERE PROVINCIA_ID = p_ProvinceID;
    RETURN v_Count;
END;

--Funci�n para Verificar si un Cliente tiene Facturas Pendientes:
CREATE OR REPLACE FUNCTION HasOutstandingInvoices(p_ID_SESSIONS NUMBER) RETURN BOOLEAN IS
    v_Count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_Count
    FROM TB_FACTURA
    WHERE ID_SESSIONS = p_ID_SESSIONS;
    RETURN v_Count > 0;
END;


--Funci�n para Calcular el Promedio de Pagos Mensuales de un Cliente:
CREATE OR REPLACE FUNCTION CalculateAvgMonthlyPayments(p_ID_SESSIONS NUMBER) RETURN NUMBER IS
    v_AvgPayments NUMBER;
BEGIN
    SELECT AVG(TOTAL) INTO v_AvgPayments
    FROM TB_PAYMENTS
    WHERE ID_SESSIONS = p_ID_SESSIONS;
    RETURN v_AvgPayments;
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
        JOIN TB_CLIENTES C ON A.ID_SESSIONS = C.ID_SESSIONS
        GROUP BY C.FIRST_NAME || ' ' || C.LAST_NAME
    );
    RETURN v_ClientName;
END;


--Funci�n para Verificar si una Sesi�n Tiene Citas Programadas:
CREATE OR REPLACE FUNCTION HasAppointments(p_ID_SESSIONS NUMBER) RETURN BOOLEAN IS
    v_Count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_Count
    FROM TB_APPOINTMENTS
    WHERE ID_SESSIONS = p_ID_SESSIONS;
    RETURN v_Count > 0;
END;

--Funci�n para Calcular la Deuda Total de un Cliente:
CREATE OR REPLACE FUNCTION CalculateTotalDebt(p_ID_SESSIONS NUMBER) RETURN NUMBER IS
    v_TotalDebt NUMBER;
BEGIN
    v_TotalDebt := CalculateOutstandingInvoices(p_ID_SESSIONS) + CalculateTotalPayments(p_ID_SESSIONS);
    RETURN v_TotalDebt;
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
        DBMS_OUTPUT.PUT_LINE('ID_SESSIONS: ' || user_rec.ID_SESSIONS);
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
        JOIN TB_APPOINTMENTS A ON U.USER_ID = A.ID_SESSIONS;
BEGIN
    FOR rec IN user_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE('User ID: ' || rec.USER_ID || ', Name: ' || rec.NAME_USERS || ', Email: ' || rec.EMAIL);
    END LOOP;
END;

--Cursor para Listar Citas de una Provincia
CREATE OR REPLACE PROCEDURE List_Appointments_By_Province_Cursor(
    p_ProvinceID NUMBER
) AS
    CURSOR appointment_cursor IS
        SELECT *
        FROM TB_APPOINTMENTS
        WHERE PROVINCIA_ID = p_ProvinceID;
BEGIN
    FOR rec IN appointment_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE('Appointment ID: ' || rec.APPOINTMENT_ID || ', Date: ' || rec.FECHA || ', Time: ' || rec.HORA);
    END LOOP;
END;

--Cursor para Listar Usuarios de una Provincia
CREATE OR REPLACE PROCEDURE List_Users_By_Province_Cursor(
    p_ProvinceID NUMBER
) AS
    CURSOR user_cursor IS
        SELECT U.*
        FROM TB_USERS U
        JOIN TB_CLIENTES C ON U.USER_ID = C.User_idParent
        WHERE C.PROVINCIA_ID = p_ProvinceID;
BEGIN
    FOR rec IN user_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE('User ID: ' || rec.USER_ID || ', Name: ' || rec.NAME_USERS || ', Email: ' || rec.EMAIL);
    END LOOP;
END;

--Cursor para Cancelar Pago
CREATE OR REPLACE PROCEDURE Cancel_Payment_Cursor(
    p_PaymentID NUMBER
) AS
    CURSOR payment_cursor IS
        SELECT * FROM TB_PAYMENTS
        WHERE ID_PAYMENTS = p_PaymentID
        FOR UPDATE;
BEGIN
    FOR rec IN payment_cursor
    LOOP
        DELETE FROM TB_PAYMENTS
        WHERE CURRENT OF payment_cursor;
    END LOOP;
    COMMIT;
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

--Cursor para Obtener Detalles de una Factura
CREATE OR REPLACE PROCEDURE Get_Invoice_Details_Cursor(
    p_InvoiceID NUMBER,
    p_SessionID OUT NUMBER,
    p_PaymentID OUT NUMBER
) AS
    CURSOR invoice_cursor IS
        SELECT ID_SESSIONS, ID_PAYMENTS
        INTO p_SessionID, p_PaymentID
        FROM TB_FACTURA
        WHERE FACTURA_ID = p_InvoiceID;
BEGIN
    OPEN invoice_cursor;
    FETCH invoice_cursor INTO p_SessionID, p_PaymentID;
    CLOSE invoice_cursor;
END;

--Cursor para Listar Pagos de un Usuario
CREATE OR REPLACE PROCEDURE List_User_Payments_Cursor(
    p_UserID NUMBER
) AS
    CURSOR payment_cursor IS
        SELECT * FROM TB_PAYMENTS
        WHERE ID_SESSIONS = p_UserID;
BEGIN
    OPEN payment_cursor;
    FOR rec IN payment_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE('Payment ID: ' || rec.ID_PAYMENTS || ', Detail: ' || rec.DETAIL || ', Total: ' || rec.TOTAL);
    END LOOP;
    CLOSE payment_cursor;
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

--Cursor para Obtener Detalles del Pago
CREATE OR REPLACE PROCEDURE Get_Payment_Details_Cursor(
    p_PaymentID NUMBER,
    p_Detail OUT VARCHAR2,
    p_Total OUT NUMBER,
    p_PaymentDay OUT DATE
) AS
    CURSOR payment_cursor IS
        SELECT DETAIL, TOTAL, PAYMENT_DAY
        INTO p_Detail, p_Total, p_PaymentDay
        FROM TB_PAYMENTS
        WHERE ID_PAYMENTS = p_PaymentID;
BEGIN
    OPEN payment_cursor;
    FETCH payment_cursor INTO p_Detail, p_Total, p_PaymentDay;
    CLOSE payment_cursor;
END;


--Cursor para Obtener Detalles de una Cita
CREATE OR REPLACE PROCEDURE Get_Appointment_Details_Cursor(
    p_AppointmentID NUMBER,
    p_Date OUT DATE,
    p_Time OUT VARCHAR2,
    p_ProvinceID OUT NUMBER
) AS
    CURSOR appointment_cursor IS
        SELECT FECHA, HORA, PROVINCIA_ID 
        INTO p_Date, p_Time, p_ProvinceID
        FROM TB_APPOINTMENTS
        WHERE APPOINTMENT_ID = p_AppointmentID;
BEGIN
    OPEN appointment_cursor;
    FETCH appointment_cursor INTO p_Date, p_Time, p_ProvinceID;
    CLOSE appointment_cursor;
END;

--Cursor para Listar Todas las Facturas
CREATE OR REPLACE PROCEDURE List_All_Invoices_Cursor AS
    CURSOR invoice_cursor IS
        SELECT * FROM TB_FACTURA;
BEGIN
    FOR rec IN invoice_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE('Invoice ID: ' || rec.FACTURA_ID || ', Session ID: ' || rec.ID_SESSIONS || ', Payment ID: ' || rec.ID_PAYMENTS);
    END LOOP;
END;

--Cursor para Listar Usuarios con Citas Programadas para Hoy
CREATE OR REPLACE PROCEDURE List_Users_With_Appointments_Today_Cursor AS
    CURSOR user_cursor IS
        SELECT DISTINCT U.*
        FROM TB_USERS U
        JOIN TB_APPOINTMENTS A ON U.USER_ID = A.ID_SESSIONS
        WHERE TRUNC(A.FECHA) = TRUNC(SYSDATE);
BEGIN
    FOR rec IN user_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE('User ID: ' || rec.USER_ID || ', Name: ' || rec.NAME_USERS || ', Email: ' || rec.EMAIL);
    END LOOP;
END;

--Cursor para Listar Pagos de un Usuario
CREATE OR REPLACE PROCEDURE List_User_Payments_Cursor(
    p_UserID NUMBER
) AS
    CURSOR payment_cursor IS
        SELECT * FROM TB_PAYMENTS
        WHERE ID_SESSIONS = p_UserID;
BEGIN
    OPEN payment_cursor;
    FOR rec IN payment_cursor
    LOOP
        DBMS_OUTPUT.PUT_LINE('Payment ID: ' || rec.ID_PAYMENTS || ', Detail: ' || rec.DETAIL || ', Total: ' || rec.TOTAL);
    END LOOP;
    CLOSE payment_cursor;
END;