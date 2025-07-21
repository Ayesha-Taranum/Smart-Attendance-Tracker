# College Attendance Management System

A comprehensive web-based attendance management system built with Java, JSP, Servlets, and MySQL. This system facilitates efficient tracking and management of student attendance in educational institutions.

## 🚀 Features

### Core Functionality
- **User Authentication & Authorization**: Secure login system with role-based access control
- **Student Management**: Add, update, view, and manage student records
- **Course Management**: Create and manage courses and subjects
- **Faculty Assignment**: Assign faculty members to specific subjects and courses
- **Attendance Tracking**: Mark and track student attendance for different subjects
- **Semester-wise Attendance**: View attendance reports by semester
- **Profile Management**: Users can view and update their profiles
- **Change Password**: Secure password change functionality

### User Roles
- **Admin**: Complete system access including user management, course setup, and system configuration
- **Faculty**: Mark attendance, view assigned subjects, and generate attendance reports
- **Student**: View personal attendance records and profile information

### Key Features
- **Real-time Attendance Marking**: Faculty can mark attendance for students in real-time
- **Comprehensive Reporting**: Generate detailed attendance reports by student, subject, or semester
- **Email Notifications**: Integrated email functionality for notifications
- **Responsive Design**: User-friendly interface accessible across devices
- **Data Validation**: Robust input validation and error handling
- **Security**: Secure session management and data protection

## 🛠️ Technology Stack

### Backend
- **Java** - Core programming language
- **JSP (JavaServer Pages)** - Dynamic web pages
- **Servlets** - HTTP request handling
- **JDBC** - Database connectivity
- **Maven** - Dependency management and build tool

### Frontend
- **HTML5** - Structure and content
- **CSS3** - Styling and layout
- **JavaScript** - Client-side functionality
- **Bootstrap** - Responsive design framework

### Database
- **MySQL** - Relational database management system

### Dependencies
- **MySQL Connector** (8.0.15) - Database driver
- **Java Servlet API** (3.1.0) - Web application framework
- **Log4j** (1.2.14) - Logging framework
- **JavaMail** (1.4.7) - Email functionality
- **C3P0** (0.9.1.2) - Connection pooling

## 📋 Prerequisites

Before running this application, ensure you have the following installed:

- **Java Development Kit (JDK) 8 or higher**
- **Apache Tomcat 8.5 or higher**
- **MySQL Server 5.7 or higher**
- **Maven 3.6 or higher**
- **IDE** (Eclipse, IntelliJ IDEA, or VS Code)

## ⚙️ Installation and Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd College-Attendance-System
```

### 2. Database Setup
1. Create a MySQL database named `attendance_management`
2. Import the provided SQL file:
   ```sql
   source Database/Attendance.sql
   ```
3. Update database configuration in the application properties

### 3. Configure Database Connection
Update the database connection settings in:
- `src/main/resources/in/co/college/att/mgt/bundle/system.properties`

### 4. Build the Project
```bash
mvn clean compile
mvn package
```

### 5. Deploy to Tomcat
1. Copy the generated WAR file from `target/` directory
2. Deploy to your Tomcat server's `webapps` directory
3. Start the Tomcat server

### 6. Access the Application
Open your web browser and navigate to:
```
http://localhost:8080/College-Attendance-System
```

## 📁 Project Structure

```
College-Attendance-System/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── in/co/college/att/mgt/
│   │   │       ├── bean/          # Data model classes
│   │   │       ├── controller/    # Servlet controllers
│   │   │       ├── exception/     # Custom exception classes
│   │   │       ├── model/         # Business logic layer
│   │   │       └── util/          # Utility classes
│   │   ├── resources/             # Configuration files
│   │   └── webapp/
│   │       ├── jsp/               # JSP view files
│   │       ├── css/               # Stylesheets
│   │       ├── Resources/         # Static resources
│   │       └── WEB-INF/           # Web configuration
│   └── test/                      # Test files
├── Database/                      # Database scripts
├── Report/                        # Project documentation
└── pom.xml                        # Maven configuration
```

## 🎯 Usage

### For Administrators
1. **Login** with admin credentials
2. **Manage Users**: Add faculty and student accounts
3. **Setup Courses**: Create courses and subjects
4. **Assign Faculty**: Assign teachers to subjects
5. **Monitor System**: View overall attendance statistics

### For Faculty
1. **Login** with faculty credentials
2. **View Assigned Subjects**: See courses you're teaching
3. **Mark Attendance**: Record student attendance for classes
4. **Generate Reports**: Create attendance reports for your subjects

### For Students
1. **Login** with student credentials
2. **View Attendance**: Check your attendance records
3. **Update Profile**: Maintain personal information
4. **View Reports**: See semester-wise attendance summary

## 🔧 Configuration

### Database Configuration
Update the following files with your database settings:
- `src/main/resources/in/co/college/att/mgt/bundle/system.properties`

### Email Configuration
Configure email settings for notifications:
- Update SMTP settings in the system properties file

### Logging Configuration
Modify logging levels in:
- `src/main/resources/in/co/college/att/mgt/bundle/log4j.properties`

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is open source and available under the [MIT License](LICENSE).
