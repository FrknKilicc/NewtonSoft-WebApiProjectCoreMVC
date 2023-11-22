using Microsoft.AspNetCore.Mvc;
using WebApiProjectCoreMVC.Model;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Xml.Schema;

namespace WebApiProjectCoreMVC.Controllers
{
    public class StudentController : Controller
    {
        public IActionResult Index()
        {
            HttpClient client = new HttpClient();
            var response = client.GetAsync("https://localhost:44325/api/students").Result;
            List<Students> students;
            students = JsonConvert.DeserializeObject<List<Students>>(response.Content.ReadAsStringAsync().Result);
            return View(students);
        }
        public IActionResult Create()
        {
            return View(new Students());
        }
        [HttpPost]
        public IActionResult Create(Students students)
        {
            HttpClient client = new HttpClient();
            StringContent content = new StringContent(JsonConvert.SerializeObject(students), System.Text.Encoding.UTF8, "application/json");
            var response = client.PostAsync($"https://localhost:44325/api/students/", content).Result;
            return RedirectToAction("Index");

        }
        public IActionResult Edit(int id)
        {
            HttpClient httpClient = new HttpClient();
            var response = httpClient.GetAsync($"https://localhost:44325/api/students/{id}").Result;
            var studentss = JsonConvert.DeserializeObject<Courses>(response.Content.ReadAsStringAsync().Result);
            return View(studentss);
        }

        [HttpPost]
        public IActionResult Edit (Students students)
        {
            HttpClient client = new HttpClient();
            StringContent content = new StringContent(JsonConvert.SerializeObject(students), System.Text.Encoding.UTF8, "application/json");

            var response = client.PutAsync($"https://localhost:44325/api/courses/{students.StudentID}",content).Result;

            return RedirectToAction("Index");
        }

        public ActionResult Delete (int id)
        {
            HttpClient client = new HttpClient();
            var response = client.DeleteAsync($"https://localhost:44325/api/students/{id}").Result;

            return RedirectToAction("Index");
        }
    }
}
