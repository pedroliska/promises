<%@ Page Language="C#" AutoEventWireup="true" ContentType="application/json" %>
<script runat="server">

    protected string ChapterUrls(int chapterCount)
    {
        string[] chapterUrlsArray = Enumerable.Range(1, chapterCount).Select(c => @"""chapter.aspx?c=" + c + @"""").ToArray();
        return string.Join(",", chapterUrlsArray);
    }

</script>
{
"title": "Wool",
"author": "Hugh Howey",
"chapterUrls": [<%= ChapterUrls(5) %>]
}