<%@ Page Language="C#" AutoEventWireup="true" ContentType="application/json" %>
<script runat="server">

  protected void page_load(object o, EventArgs e)
  {
    var maxSeconds = 4;
    var randomMiliseconds = new Random().Next(maxSeconds * 1000);
    System.Threading.Thread.Sleep(randomMiliseconds);
  }

  protected string ChapterNumber 
  {
    get { return Request.QueryString["c"]; }
  }

  protected string ChapterContent
  {
    get
    {
      var sentence = "This is the lengthy content of chapter " + ChapterNumber + ".";
      var array = Enumerable.Range(0, 20).Select(x => sentence).ToArray();
      return string.Join(" ", array);
    }
  }
</script>
{
  "title": "Title for Chapter <%= ChapterNumber %>",
  "content": "<%= ChapterContent %>"
}
