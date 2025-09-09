# OURBANK - Online Banking System

OURBANK is a simple **Java Servlet & JSP** based web application that simulates basic banking operations like account creation, deposit, withdrawal, balance inquiry, transfer, and account closure.  
It uses **MySQL** for database storage and follows the MVC pattern (Servlets as controllers, JSPs as views, JDBC for database).

---

## 🚀 Features
- **Account Creation** – Open a new account with user details.
- **Balance Inquiry** – Check balance by logging in with account number & password.
- **Deposit & Withdrawal** – Add or withdraw money securely.
- **Fund Transfer** – Transfer money between accounts.
- **Close Account** – Option to close an existing account.
- **Authentication** – Login verification before transactions.
- **Responsive UI** – JSP pages styled with CSS.

---

## 🛠️ Tech Stack
- **Frontend:** JSP, HTML, CSS, JavaScript  
- **Backend:** Java Servlets, JDBC  
- **Database:** MySQL  
- **Server:** Apache Tomcat 9+  
- **IDE (Recommended):** IntelliJ IDEA / Eclipse  

---

## 📂 Project Structure
OURBANK/
│── src/com/ourbank/servlet/
│ ├── CreateServlet.java
  ├── DBIntializer.java
│ ├── Details.java
│ ├── MyListener.java
│ ├── GetCon.java
│ ├── LoginServlet.java
│ ├── RegisterUser.java
│ └── verifyLogin1.java
│── src/com/ourbank/config/
│ └──DBUtil.java
│
│── WebContent/
│ ├── index.html
│ ├── create.html
│ ├── balance1.jsp
│ ├── deposit1.jsp
│ ├── withdraw1.jsp
│ ├── transfer1.jsp
│ ├── closeac1.jsp
│ ├── about.jsp
│ ├── css/style.css
│ └── images/
│
│── web.xml (Servlet configurations)
│── README.md


## ⚙️ Database Setup
1. Install **MySQL** and create database:
   ```sql
   CREATE DATABASE ourbank;
   
2. Update DB credentials in DBIntializer.java:
String DRIVER = "com.mysql.cj.jdbc.Driver";
String CON_STRING = "jdbc:mysql://localhost:3306/ourbank?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
String USERNAME = "root";
String PASSWORD = "";

3. The table NEW_ACCOUNT is auto-created by MyListener on project startup:
CREATE TABLE IF NOT EXISTS NEW_ACCOUNT (
    ACCOUNTNO INT PRIMARY KEY,
    USERNAME VARCHAR(255) NOT NULL,
    PASSWORD VARCHAR(255) NOT NULL,
    REPASSWORD VARCHAR(255),
    AMOUNT DECIMAL(15,2),
    ADDRESS VARCHAR(255),
    PHONE BIGINT
);

▶️ Run the Project
Install & configure Apache Tomcat 9+ in your IDE.
Import the project into IntelliJ IDEA / Eclipse.
Deploy the project to Tomcat server.
Start the server and visit: http://localhost:8080/OURBANK/

📌 Future Enhancements
Add password hashing for security.
Use Hibernate/JPA instead of raw JDBC.
Improve UI with Bootstrap/Angular/React.
Add role-based authentication (Admin/User).
Integrate email/SMS notifications.
