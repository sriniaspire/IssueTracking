// See https://aka.ms/new-console-template for more information
using System.Net.Http.Json;
using Tracking.Client;

Console.WriteLine("Hello, World!");
HttpClient httpClient = new HttpClient();
httpClient.DefaultRequestHeaders.Accept.Clear();
httpClient.DefaultRequestHeaders.Add("Accept", "application/json");
httpClient.BaseAddress = new Uri("https://localhost:7094");

HttpResponseMessage httpResponse = await httpClient.GetAsync("api/issues");
httpResponse.EnsureSuccessStatusCode();
if(httpResponse.IsSuccessStatusCode)
{
    var issues = await httpResponse.Content.ReadFromJsonAsync<IEnumerable<IssueDto>>();
    foreach(var issue in issues)
    {
        Console.WriteLine(issue.Title);
    }
}
else
{
    Console.WriteLine(" No data found ");
}
Console.ReadLine();