# Quiz Generator Application - Project Report

## 1. Project Overview
The **Quiz Generator Application** is a web-based application developed using **Java, Servlets, JSP, Hibernate with JPA**, and **MySQL**. The primary goal of this application is to allow students to take quizzes, fetch random questions from the database, calculate scores, and display results dynamically.

## 2. Technologies Used
- **Backend:** Java, Servlets, JSP, Hibernate (JPA)
- **Frontend:** HTML, CSS, JSP
- **Database:** MySQL
- **Build Tool:** Maven
- **IDE:** Eclipse
- **Version Control:** GitHub

## 3. Project Structure
The project follows a structured folder hierarchy. Below is the breakdown:

### **Main Project Directory**
```
TECHPLEMENT/
│-- src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── com.techplement.controller/
│   │   │   ├── com.techplement.dao/
│   │   │   ├── com.techplement.dto/
│   │   ├── resources/
│   │   │   ├── hibernate.cfg.xml
│   │   ├── webapp/
│   │   │   ├── WEB-INF/
│   │   │   │   ├── web.xml
│   │   │   ├── pages/
│   │   │   ├── assets/
│   │   ├── pom.xml
│-- target/
│-- .gitignore
│-- README.md
```

## 4. Detailed Explanation of Files & Folders

### **4.1 WebApp Folder (`src/main/webapp/`)
This folder contains the frontend and configuration files for the application.

- **WEB-INF/web.xml**: Deployment descriptor for the servlet application.
- **pages/**: Contains JSP files for UI components like quiz, results, and authentication.
- **assets/**: Stores static resources like CSS, JavaScript, and images.

### **4.2 DTO Package (`src/main/java/com/techplement/dto/`)
DTO (Data Transfer Objects) are used to map database records to Java objects.

- **QuestionDTO.java**: Represents a question entity with attributes like `id`, `questionText`, `options`, and `correctAnswer`.
- **UserDTO.java**: Represents user-related data such as `id`, `username`, `password`, and `score`.

### **4.3 DAO Package (`src/main/java/com/techplement/dao/`)
DAO (Data Access Objects) handle database operations.

- **QuestionDAO.java**: Contains methods to fetch 10 random questions from the database.
- **UserDAO.java**: Handles user authentication and score management.

### **4.4 Controller Package (`src/main/java/com/techplement/controller/`)
Controllers manage the request-response cycle and business logic.

- **QuizServlet.java**: Handles quiz logic, fetching questions, and evaluating answers.
- **UserServlet.java**: Manages user login and registration.

### **4.5 Configuration - `hibernate.cfg.xml` (`src/main/resources/hibernate.cfg.xml`)
The `hibernate.cfg.xml` file contains Hibernate configuration settings, including database connection details, dialect, and mapping resources.

#### **How Hibernate Works Step by Step:**
1. **Configuration Load:** Hibernate loads `hibernate.cfg.xml` to initialize the configuration settings.
2. **SessionFactory Creation:** Based on the configuration, Hibernate creates a `SessionFactory` object, which acts as a factory for database sessions.
3. **Session Management:** Using the `SessionFactory`, a Hibernate `Session` is opened to interact with the database.
4. **Transaction Handling:** Hibernate manages transactions to ensure consistency during database operations.
5. **Query Execution:** The DAO layer executes queries using Hibernate methods like `save()`, `update()`, `delete()`, and `query()`.
6. **Commit & Close:** After execution, transactions are committed, and the session is closed.

### **4.6 Configuration - `pom.xml`
The **pom.xml** file is used for Maven dependencies and build configurations. It includes:

- Hibernate dependencies for JPA
- MySQL Connector for database interaction
- Servlet and JSP dependencies
- Build plugins for deployment

## 5. Installation & Setup
### **Step 1: Clone the Repository**
```
git clone https://github.com/Shiva-6816/TECHPLEMENT.git
cd TECHPLEMENT
```
### **Step 2: Import into Eclipse**
1. Open **Eclipse**
2. Go to **File → Import → Existing Maven Projects**
3. Select the **TECHPLEMENT** directory and click **Finish**

### **Step 3: Configure Database**
1. Open **MySQL Workbench**
2. Create a database:
   ```sql
   CREATE DATABASE quiz_db;
   ```
3. Update **hibernate.cfg.xml** with database credentials.

### **Step 4: Run the Project**
1. Right-click on the project in Eclipse.
2. Select **Run As → Run on Server**
3. Open browser and go to `http://localhost:8080/TECHPLEMENT/pages/quiz.jsp`

## 6. Conclusion
This project successfully integrates Servlets, JSP, and Hibernate to build a functional quiz system. Future improvements can include an **admin panel**, **timer-based quizzes**, and **user analytics**.

---
**Maintainer:** [Shiva-6816](https://github.com/Shiva-6816/)

