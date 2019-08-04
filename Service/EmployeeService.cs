using EFDataAccess;
using Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public class EmployeeService : IEmployeeService
    {
        public bool DeleteEmployeeById(int id)
        {
            using (var context = new MVC_CRUDEntities())
            {
                var employee = context.Employees.Where(x => x.Id == id).FirstOrDefault();
                context.Employees.Remove(employee);
                context.SaveChanges();
            }
            return true;
        }

        public List<Department> GetAllDepartments()
        {
            List<Department> departments = new List<Department>();

            using (var context = new MVC_CRUDEntities())
            {
                departments = context.Departments.ToList();
            }

            return departments;
        }

        public List<Employee> GetAllEmployees()
        {
            List<Employee> employees = new List<Employee>();

            using (var context = new MVC_CRUDEntities())
            {
                employees = context.Employees.Include(s => s.Department).ToList();
            }

            return employees;
        }

        public Employee GetEmployeeById(int id)
        {
            Employee employee = new Employee();
            using (var context = new MVC_CRUDEntities())
            {
                employee = context.Employees.Where(x => x.Id == id).FirstOrDefault();
            }
            return employee;
        }

        public int SaveEmployee(Employee employee)
        {
            using (var context = new MVC_CRUDEntities())
            {
                context.Entry(employee).State = employee.Id == 0 ? EntityState.Added : EntityState.Modified;

                context.SaveChanges();
            }
            return employee.Id;
        }





    }
}
