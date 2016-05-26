using System;
using System.Net;
using System.IO;
using System.Text.RegularExpressions;

// Original Source: http://www.codeproject.com/Tips/509473/Simple-Web-Scraper

namespace GameHouseWebScraper
{

    class Program
    {
        static void Main(string[] args)
        {
            extractLinks();
        }


        static public void extractLinks()
        {

            try
            {
                Console.Title = "GameHouse Site Scraper v0.1                                              esc0rtd3w 2016";

                //string url = @"http://www.gamehouse.com/new-games?platform=pc-games#gametype=download&genre=all&sorting=name&count=3000&filterType=new-games&listView=true&start=0";
                string urlGH = @"http://www.gamehouse.com/";
                string strResult = "";
                string dashLine = "-----------------------------------";

                Console.WriteLine("Current URL: " + urlGH + "\n\n\nEnter Target URL:\n\n\nYou can press enter to use default, or X and ENTER to exit\n\n");
                string url = Console.ReadLine();

                if (url == "")
                {
                    url = urlGH;
                }
                else if(url == "x" || url == "X")
                {
                    Environment.Exit(0);
                }
                


                Console.WriteLine("\n\nExtracting Links....\n\n");

                WebResponse objResponse;
                //WebRequest objRequest = System.Net.HttpWebRequest.Create(url);

                var request = (HttpWebRequest)WebRequest.Create(url);
                request.UserAgent = "AmHttpClient v1.0";


                //objRequest.Headers.Add("User-Agent: AmHttpClient v1.0");
                //objRequest.Headers.Add("\"Set-Cookie:\" gamehouseuser=true");


                objResponse = request.GetResponse();
                //objResponse = objRequest.GetResponse();


                using (StreamReader sr = new StreamReader(objResponse.GetResponseStream()))
                {
                    strResult = sr.ReadToEnd();
                    sr.Close();
                }

                Console.WriteLine(dashLine);
                Console.WriteLine("Domains\n");

                // Domains
                string patternDomains = @"\b[a-zA-Z0-9\-\.]+\.(com|org|net|mil|edu|COM|ORG|NET|MIL|EDU)\b";
                Regex d = new Regex(patternDomains);
                foreach (Match m in d.Matches(strResult))
                {
                    Console.WriteLine(m.Value);
                }

                Console.WriteLine(dashLine);
                Console.WriteLine("\n");
                Console.WriteLine(dashLine);
                Console.WriteLine("Misc\n");

                // Misc
                string patternGamePagesMain = @"\b[a-zA-Z0-9\-\.]+\.(js|json|jscript|htm|html|cid|atoken|acid)\b";
                Regex g = new Regex(patternGamePagesMain);
                foreach (Match m in g.Matches(strResult))
                {
                    Console.WriteLine(m.Value);
                }

                Console.WriteLine(dashLine);
                Console.WriteLine("\n\nExtracted\n\n");
                Console.Read();
                Console.Read();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message, "Error");
                Console.ReadKey();
            }

            Console.Clear();
            extractLinks();
        }


        /*
        public void SetCookie(HttpCookie cookie)
        {
            MyCookie.Value = DateTime.Now.ToString();
            Response.Cookies.Add(MyCookie);
        }
        */

    }
}
