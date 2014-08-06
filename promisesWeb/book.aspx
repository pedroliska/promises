<%@ Page Language="C#" AutoEventWireup="true" ContentType="application/json" %>
<script runat="server">
  protected string ChapterUrls(int chapterCount)
  {
    string[] chapterUrlsArray = Enumerable.Range(1, 14).Select(c => @"""chapter.aspx?c=" + c + @"""").ToArray();
    return string.Join(",", chapterUrlsArray);
  }
</script>
{
  "title": "The Lean Startup",
  "author": "Eric Ries",
  "chapterUrls": [<%= ChapterUrls(14) %>]
}
