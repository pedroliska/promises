<%@ Page Language="C#" AutoEventWireup="true" ContentType="application/json" %>

<script runat="server">

  private int _randomMiliseconds;

  protected void page_load(object o, EventArgs e)
  {
    var maxSeconds = 3;
    _randomMiliseconds = RandomGenerator.Next(maxSeconds * 1000);
    System.Threading.Thread.Sleep(_randomMiliseconds);
  }

  private Random RandomGenerator
  {
    get
    {
      var generatorFromSession = this.Session["randomGenerator"] as Random;
      if (generatorFromSession == null)
      {
        generatorFromSession = new Random();
        Session["randomGenerator"] = generatorFromSession;
      }
      return generatorFromSession;
    }
  }

  protected string ChapterNumber
  {
    get { return Request.QueryString["c"]; }
  }

  protected string ChapterContent
  {
    get
    {
      var repeat = 5;
      var sentence = "This is the lengthy content of chapter " + ChapterNumber + ". Delayed " + _randomMiliseconds + " miliseconds.";
      var array = Enumerable.Range(0, repeat).Select(x => sentence).ToArray();
      return string.Join(" ", array);
    }
  }
</script>
{
  "title": "Title for Chapter <%= ChapterNumber %>",
  "content": "<%= ChapterContent %>"
}
