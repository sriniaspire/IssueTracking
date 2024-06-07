using IssueTracking.Web.UI.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Diagnostics;
using System.Text;

namespace IssueTracking.Web.UI.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public async Task<IActionResult> IndexAsync()
        {
            HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Accept.Clear();
            httpClient.DefaultRequestHeaders.Add("Accept", "application/json");
            httpClient.BaseAddress = new Uri("https://localhost:7094");

            HttpResponseMessage httpResponse = await httpClient.GetAsync("api/issues");
            httpResponse.EnsureSuccessStatusCode();
            TempData["Title"] = "Vasan";
            var x = TempData.Peek("Title");
            if (httpResponse.IsSuccessStatusCode)
            {
                var issues = await httpResponse.Content.ReadFromJsonAsync<IEnumerable<IssueDto>>();
                return View(issues);
            }
            else
            {
                return View();
            }            
        }
        public async Task<IActionResult> Details(int id)
        {
            HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Accept.Clear();
            httpClient.DefaultRequestHeaders.Add("Accept", "application/json");
            httpClient.BaseAddress = new Uri("https://localhost:7094");

            HttpResponseMessage httpResponse = await httpClient.GetAsync("api/issues/id?id=" + id);
            httpResponse.EnsureSuccessStatusCode();
            if (httpResponse.IsSuccessStatusCode)
            {
                ViewData["test"] = "Srini";
                
                var issue = await httpResponse.Content.ReadFromJsonAsync<IssueDto>();
                return View(issue);
            }
            else
            {
                return View();
            }
        }
        public IActionResult AddNew()
        {
            return View(new IssueDto());
        }
        public async Task<IActionResult> Edit(int id)
        {
            HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Accept.Clear();
            httpClient.DefaultRequestHeaders.Add("Accept", "application/json");
            httpClient.BaseAddress = new Uri("https://localhost:7094");

            HttpResponseMessage httpResponse = await httpClient.GetAsync("api/issues/id?id=" + id);
            httpResponse.EnsureSuccessStatusCode();
            if (httpResponse.IsSuccessStatusCode)
            {
                var issue = await httpResponse.Content.ReadFromJsonAsync<IssueDto>();
                return View(issue);
            }
            else
            {
                return View();
            }
        }
        public async Task<IActionResult> Update(int id,IssueDto issueDto)
        {
            HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Accept.Clear();
            httpClient.DefaultRequestHeaders.Add("Accept", "application/json");
            httpClient.BaseAddress = new Uri("https://localhost:7094");
            var jsonSting = JsonConvert.SerializeObject(issueDto);
            var httpContent = new StringContent(jsonSting, Encoding.UTF8, "application/json");


            HttpResponseMessage httpResponse = await httpClient.PutAsync("api/issues/id?id=" + id, httpContent);
            httpResponse.EnsureSuccessStatusCode();
            if (httpResponse.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }
        public async Task<IActionResult> Create(IssueDto issueDto)
        {
            HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Accept.Clear();
            httpClient.DefaultRequestHeaders.Add("Accept", "application/json");
            httpClient.BaseAddress = new Uri("https://localhost:7094");
            var jsonSting = JsonConvert.SerializeObject(issueDto);
            var httpContent = new StringContent(jsonSting, Encoding.UTF8, "application/json");


            HttpResponseMessage httpResponse = await httpClient.PostAsync("api/issues", httpContent);
            httpResponse.EnsureSuccessStatusCode();
            if (httpResponse.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }
        public async Task<IActionResult> Delete(int id)
        {
            HttpClient httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Accept.Clear();
            httpClient.DefaultRequestHeaders.Add("Accept", "application/json");
            httpClient.BaseAddress = new Uri("https://localhost:7094");
            HttpResponseMessage httpIssuesResponse = await httpClient.GetAsync("api/issues");
            HttpResponseMessage httpResponse = await httpClient.DeleteAsync("api/issues/id?id=" + id);
            httpResponse.EnsureSuccessStatusCode();
            if (httpResponse.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return View();
            }
        }        

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}