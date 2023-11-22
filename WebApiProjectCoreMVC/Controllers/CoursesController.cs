using Microsoft.AspNetCore.Mvc;
using System.Net.Http;
using Newtonsoft.Json;
using System.Net.Http.Json;
using System.Net.Http.Headers;
using WebApiProjectCoreMVC.Model;
using System.Collections.Generic;

namespace WebApiProjectCoreMVC.Controllers
{
    public class CoursesController : Controller
    {
        [HttpGet]
        public IActionResult Index()
        {
            HttpClient client = new HttpClient();
            var response = client.GetAsync("https://localhost:44325/api/courses").Result;
            List<Courses> courses;
            courses = JsonConvert.DeserializeObject<List<Courses>>(response.Content.ReadAsStringAsync().Result);


            return View(courses);
        }
        [HttpGet]
        public IActionResult Create()
        {
            return View(new Courses());
        }
        [HttpPost]
        public IActionResult Create(Courses courses)
        {
            HttpClient httpClient = new HttpClient();
            StringContent content = new StringContent(JsonConvert.SerializeObject(courses), System.Text.Encoding.UTF8, "application/json");
            var response = httpClient.PostAsync("https://localhost:44325/api/courses", content).Result;
            return RedirectToAction("Index");
        }
        [HttpGet]
        public IActionResult Edit(int id)
        {
            HttpClient client = new HttpClient();
            var response = client.GetAsync($"https://localhost:44325/api/courses/{id}").Result;
            var coursesss = JsonConvert.DeserializeObject<Courses>(response.Content.ReadAsStringAsync().Result);
            return View(coursesss);
        }
        [HttpPost]
        public IActionResult Edit(Courses courses)
        {
            HttpClient client = new HttpClient();
            StringContent content = new StringContent(JsonConvert.SerializeObject(courses), System.Text.Encoding.UTF8, "application/json");
            var response = client.PutAsync($"https://localhost:44325/api/courses/{courses.CourseID}", content).Result;

            return RedirectToAction("Index");
        }
        public IActionResult Delete (int id)
        {
            HttpClient client = new HttpClient();
            var response = client.DeleteAsync($"https://localhost:44325/api/courses/{id}").Result;
            return RedirectToAction("Index");

        }
    }
}
