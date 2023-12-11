package za.co.employee.model;

import java.time.LocalDate;
import java.util.Date;
import java.util.Objects;




public class Employee {

   private int employee_id;
    private String name;
    private String surname;
    private LocalDate birth_date; 
    private String employee_number;
    private Double salary;
    private String position;
    private String reporting_line_manager;
    private String password;
    private String email;

    public Employee() {
    }

    public Employee(int employee_id, String name, String surname, LocalDate birth_date, String employee_number, Double salary, String position, String reporting_line_manager, String password, String email) {
        this.employee_id = employee_id;
        this.name = name;
        this.surname = surname;
        this.birth_date = birth_date;
        this.employee_number = employee_number;
        this.salary = salary;
        this.position = position;
        this.reporting_line_manager = reporting_line_manager;
        this.password = password;
        this.email = email;
    }

    public Employee(String name, String surname, LocalDate birth_date, String employee_number, Double salary, String position, String reporting_line_manager, String password, String email) {
        this.name = name;
        this.surname = surname;
        this.birth_date = birth_date;
        this.employee_number = employee_number;
        this.salary = salary;
        this.position = position;
        this.reporting_line_manager = reporting_line_manager;
        this.password = password;
        this.email = email;
    }

    public Employee(String name, String surname, LocalDate birth_date, String employee_number, Double salary, String position, String reporting_line_manager, String email) {
        this.name = name;
        this.surname = surname;
        this.birth_date = birth_date;
        this.employee_number = employee_number;
        this.salary = salary;
        this.position = position;
        this.reporting_line_manager = reporting_line_manager;
        this.email = email;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public LocalDate getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(LocalDate birth_date) {
        this.birth_date = birth_date;
    }

    public String getEmployee_number() {
        return employee_number;
    }

    public void setEmployee_number(String employee_number) {
        this.employee_number = employee_number;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getReporting_line_manager() {
        return reporting_line_manager;
    }

    public void setReporting_line_manager(String reporting_line_manager) {
        this.reporting_line_manager = reporting_line_manager;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 79 * hash + this.employee_id;
        hash = 79 * hash + Objects.hashCode(this.name);
        hash = 79 * hash + Objects.hashCode(this.surname);
        hash = 79 * hash + Objects.hashCode(this.birth_date);
        hash = 79 * hash + Objects.hashCode(this.employee_number);
        hash = 79 * hash + Objects.hashCode(this.salary);
        hash = 79 * hash + Objects.hashCode(this.position);
        hash = 79 * hash + Objects.hashCode(this.reporting_line_manager);
        hash = 79 * hash + Objects.hashCode(this.password);
        hash = 79 * hash + Objects.hashCode(this.email);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Employee other = (Employee) obj;
        if (this.employee_id != other.employee_id) {
            return false;
        }
        if (!Objects.equals(this.name, other.name)) {
            return false;
        }
        if (!Objects.equals(this.surname, other.surname)) {
            return false;
        }
        if (!Objects.equals(this.employee_number, other.employee_number)) {
            return false;
        }
        if (!Objects.equals(this.salary, other.salary)) {
            return false;
        }
        if (!Objects.equals(this.position, other.position)) {
            return false;
        }
        if (!Objects.equals(this.reporting_line_manager, other.reporting_line_manager)) {
            return false;
        }
        if (!Objects.equals(this.password, other.password)) {
            return false;
        }
        if (!Objects.equals(this.email, other.email)) {
            return false;
        }
        if (!Objects.equals(this.birth_date, other.birth_date)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Employee{" + "employee_id=" + employee_id + ", name=" + name + ", surname=" + surname + ", birth_date=" + birth_date + ", employee_number=" + employee_number + ", salary=" + salary + ", position=" + position + ", reporting_line_manager=" + reporting_line_manager + ", password=" + password + ", email=" + email + '}';
    }

   

   
}
