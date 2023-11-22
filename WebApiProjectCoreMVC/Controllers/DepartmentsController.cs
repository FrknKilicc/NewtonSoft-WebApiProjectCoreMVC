using Microsoft.AspNetCore.Mvc;
using System.Net.Http;
using Newtonsoft.Json;
using WebApiProjectCoreMVC.Model;
using WebApiProjectCoreMVC.Models;
using System.Collections.Generic;
using System.Security.Permissions;

namespace WebApiProjectCoreMVC.Controllers
{
    public class DepartmentsController : Controller
    {

        public IActionResult Index()
        {
            HttpClient client = new HttpClient();
            var response = client.GetAsync("https://localhost:44325/api/departments").Result;
            List<Departments> departments;
            departments = JsonConvert.DeserializeObject<List<Departments>>(response.Content.ReadAsStringAsync().Result);

            return View(departments);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View(new Departments());
        }
        [HttpPost]
        public IActionResult Create(Departments departments)
        {
            HttpClient httpClient = new HttpClient();
            StringContent content = new StringContent(JsonConvert.SerializeObject(departments), System.Text.Encoding.UTF8, "application/json");
            var response = httpClient.PostAsync("https://localhost:44325/api/departments", content).Result;
            return RedirectToAction("Index");

        }
        [HttpGet]
        public IActionResult Edit(int id)

        {
            HttpClient client = new HttpClient();
            var response = client.GetAsync($"https://localhost:44325/api/departments/{id}").Result;

            var departments = JsonConvert.DeserializeObject<Departments>(response.Content.ReadAsStringAsync().Result);

            return View(departments);
        }
        [HttpPost]

        public IActionResult Edit(Departments departments)
        {
            HttpClient client = new HttpClient();
            StringContent content = new StringContent(JsonConvert.SerializeObject(departments), System.Text.Encoding.UTF8, "application/json");

            var response = client.PutAsync($"https://localhost:44325/api/departments/{departments.DepartmentID}", content).Result;

            return RedirectToAction("Index");
        }

        public IActionResult Delete(int id)
        {
            HttpClient client = new HttpClient();
            var response = client.DeleteAsync($"https://localhost:44325/api/departments/{id}").Result;
            
            return RedirectToAction("Index");
        }

    }
}
