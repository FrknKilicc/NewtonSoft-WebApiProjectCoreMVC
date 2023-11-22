using Microsoft.AspNetCore.Mvc;
using System.Net.Http;
using Newtonsoft.Json;
using System.Collections.Generic;
using WebApiProjectCoreMVC.Model;
using WebApiProjectCoreMVC.Models;

namespace WebApiProjectCoreMVC.Controllers
{
    public class UniversitiesController : Controller
    {
        
        public IActionResult Index()
        {
            HttpClient client = new HttpClient();
            var response = client.GetAsync("https://localhost:44325/api/universities").Result;
            List<Universities> universities;
            universities = JsonConvert.DeserializeObject<List<Universities>>(response.Content.ReadAsStringAsync().Result);
            return View(universities);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View(new Universities());

        }
        [HttpPost]

        public IActionResult Create(Universities universities)
        {
            HttpClient httpClient = new HttpClient();
            StringContent content = new StringContent(JsonConvert.SerializeObject(universities), System.Text.Encoding.UTF8, "application/json");

            var response = httpClient.PostAsync("https://localhost:44325/api/universities", content).Result;
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            HttpClient httpClient = new HttpClient();
            var response = httpClient.GetAsync($"https://localhost:44325/api/Universities/{id}").Result;

            var transactionss = JsonConvert.DeserializeObject<Universities>(response.Content.ReadAsStringAsync().Result);
            return View(transactionss);
        }

        [HttpPost]
        public IActionResult Edit(Universities universities)
        {
            HttpClient client = new HttpClient();
            StringContent content = new StringContent(JsonConvert.SerializeObject(universities), System.Text.Encoding.UTF8, "application/json");
            var response = client.PutAsync($"https://localhost:44325/api/universities/{universities.UniversityID}", content).Result;
            return RedirectToAction("Index");
        }
        public IActionResult Delete(int id)
        {
            HttpClient httpClient = new HttpClient();

            var response = httpClient.DeleteAsync($"https://localhost:44325/api/universities/{id}").Result;
            return RedirectToAction("Index");
        }
    }
}
