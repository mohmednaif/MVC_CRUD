using Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_CRUD.Controllers
{
    public class HomeController : Controller
    {
        private readonly IEmployeeService employeeService;

        public HomeController(IEmployeeService employeeService)
        {
            this.employeeService = employeeService;
        }


        public ActionResult Index()
        {
            var r = employeeService.GetAllDepartments();

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}