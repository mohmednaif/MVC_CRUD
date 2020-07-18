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

        public List<Domain.Department> GetAllDepartments()
        {
            List<Domain.Department> departments = new List<Domain.Department>();

            using (var context = new MVC_CRUDEntities())
            {
                departments = context.Departments.Select(x => new Domain.Department { DepartmentName = x.DepartmentName, Id = x.Id }).ToList();
            }

            return departments;
        }

        public List<Domain.Employee> GetAllEmployees()
        {
            List<Domain.Employee> employees = new List<Domain.Employee>();

            using (var context = new MVC_CRUDEntities())
            {
                employees = context.Employees.Include(s => s.Department)
                    .Select(x => new Domain.Employee
                    {
                        Address = x.Address,
                        DepartmentId = x.DepartmentId,
                        BirthDate = x.BirthDate,
                        Email = x.Email,
                        FirstName = x.FirstName,
                        Gender = x.Gender,
                        Id = x.Id,
                        LastName = x.LastName,
                        Phone = x.Phone,
                        Department = new Domain.Department
                        {
                            DepartmentName = x.Department.DepartmentName,
                            Id = x.Department.Id
                        }
                    }).ToList();
            }

            return employees;
        }

        public Domain.Employee GetEmployeeById(int id)
        {
            Domain.Employee employee = new Domain.Employee();
            using (var context = new MVC_CRUDEntities())
            {
                employee = context.Employees.Where(x => x.Id == id)
                                        .Select(x => new Domain.Employee
                                        {
                                            Address = x.Address,
                                            DepartmentId = x.DepartmentId,
                                            BirthDate = x.BirthDate,
                                            Email = x.Email,
                                            FirstName = x.FirstName,
                                            Gender = x.Gender,
                                            Id = x.Id,
                                            LastName = x.LastName,
                                            Phone = x.Phone,
                                            Department = new Domain.Department
                                            {
                                                DepartmentName = x.Department.DepartmentName,
                                                Id = x.Department.Id
                                            }
                                        }).FirstOrDefault();
            }
            return employee;
        }

        public int SaveEmployee(Domain.Employee employee)
        {
            Employee employeeData;
            using (var context = new MVC_CRUDEntities())
            {
                //context.Entry(employee).State = employee.Id == 0 ? EntityState.Added : EntityState.Modified;


                if (employee.Id != 0)
                {
                    employeeData = context.Employees.Where(x => x.Id == employee.Id).FirstOrDefault();
                }
                else
                {
                    employeeData = new Employee();

                    context.Employees.Add(employeeData);
                }

                if (employeeData != null)
                {
                    employeeData.Address = employee.Address;
                    employeeData.BirthDate = employee.BirthDate;
                    employeeData.DepartmentId = employee.DepartmentId;
                    employeeData.Email = employee.Email;
                    employeeData.FirstName = employee.FirstName;
                    employeeData.Gender = employee.Gender;
                    employeeData.LastName = employee.LastName;
                    employeeData.Phone = employee.Phone;
                }

                context.SaveChanges();
            }
            return employeeData.Id;
        }


    }
}
