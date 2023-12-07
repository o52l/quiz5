using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    private int userScore = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            ReplayLink.Visible=false;
            Button1.Visible = false;
            Session["X"] = 9;
            CBF110040_PreviousButton.Enabled = false;
            CBF110040_NextButton.Enabled = true;

            // 洗牌演算法部分
            Random rand = new Random();
            List<ListItem> items = new List<ListItem>();
            foreach (ListItem item in CBF110040_DDL1.Items)
            {
                items.Add(item);
            }
            // 使用洗牌演算法重新排序
            for (int i = items.Count - 1; i > 0; i--)
            {
                int j = rand.Next(0, i + 1);
                ListItem temp = items[i];
                items[i] = items[j];
                items[j] = temp;
            }
            // 清空下拉式清單中的選項
            CBF110040_DDL1.Items.Clear();
            // 將重新排序後的選項重新加入下拉式清單
            foreach (ListItem item in items)
            {
                CBF110040_DDL1.Items.Add(item);
            }
        }

        CBF110040_MV1.ActiveViewIndex = 0;
    }
    protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void CBF110040_DDL1_SelectedIndexChanged(object sender, EventArgs e)
    {
  
        string selectedItemText = CBF110040_DDL1.SelectedItem.Text;
        string selectedValue = CBF110040_DDL1.SelectedValue;

        string url = $"https://dictionary.cambridge.org/zht/詞典/英語-漢語-繁體/{selectedItemText}";

        string hyperlink = $"<a href='{url}'>{selectedItemText}</a>";

        CBF110040_cambridge.Text += $"{hyperlink} => {selectedValue}<br/>";
    }
    protected void CBF110040_PreviousButton_Click(object sender, EventArgs e)
    {
        CBF110040_DDL1.DataBind();
        Session["X"] = (int)Session["X"] - 10;
        CBF110040_DDL1.DataBind();
        
        if ((int)Session["X"] == 9) CBF110040_PreviousButton.Enabled = false;
        CBF110040_NextButton.Enabled = true;

        int currentOffset = Convert.ToInt32(SqlDataSource2.SelectParameters["OFFSET"].DefaultValue);
        currentOffset -= 10;

        if (currentOffset < 0)
        {
            currentOffset = 0;
        }

        SqlDataSource2.SelectParameters["OFFSET"].DefaultValue = currentOffset.ToString();
        CBF110040_DDL1.DataBind();
        CBF110040_cambridge.Text = "";
        if (CBF110040_DDL1.Items.Count > 0) { string url = $"https://dictionary.cambridge.org/zht/詞典/英語-漢語-繁體/{CBF110040_DDL1.Items[0].Text}"; string hyperlink = $"<a href='{url}'>{CBF110040_DDL1.Items[0].Text}</a>"; CBF110040_cambridge.Text = $"{hyperlink} => {CBF110040_DDL1.Items[0].Value}<br/>"; }

    }

    protected void CBF110040_NextButton_Click(object sender, EventArgs e)
    {
        CBF110040_DDL1.DataBind();
        Session["X"] = (int)Session["X"] + 10;
        CBF110040_DDL1.DataBind();
        //Literal1.Text = Session["R"].ToString();
        CBF110040_PreviousButton.Enabled = true;
        int currentOffset = Convert.ToInt32(SqlDataSource2.SelectParameters["OFFSET"].DefaultValue);
        currentOffset += 10;


        SqlDataSource2.SelectParameters["OFFSET"].DefaultValue = currentOffset.ToString();
        CBF110040_DDL1.DataBind();
        CBF110040_cambridge.Text = "";
        if (CBF110040_DDL1.Items.Count > 0) { string url = $"https://dictionary.cambridge.org/zht/詞典/英語-漢語-繁體/{CBF110040_DDL1.Items[0].Text}"; string hyperlink = $"<a href='{url}'>{CBF110040_DDL1.Items[0].Text}</a>"; CBF110040_cambridge.Text = $"{hyperlink} => {CBF110040_DDL1.Items[0].Value}<br/>"; }

    }


    protected void CBF110040_testBtn_Click(object sender, EventArgs e)
    {
     
            if (CBF110040_DDL1.Items.Count > 0)
            {
                string selectedWord = CBF110040_DDL1.SelectedItem.Text;
                string selectedValue = CBF110040_DDL1.SelectedValue;

                CBF110040_ch_hint.Text = selectedValue;
                CBF110040_input.Text = $"{selectedWord[0]} {new string('＿', selectedWord.Length - 1)}";
                CBF110040_input.ToolTip = $"{selectedWord[0]} {new string('＿', selectedWord.Length - 1)}";

               
                if (selectedWord.Equals(selectedValue, StringComparison.OrdinalIgnoreCase))
                {
                    userScore++;
                }
            }
            else
            {
                
            }

            CBF110040_MV1.ActiveViewIndex = 1;

           
            if (CBF110040_DDL1.SelectedIndex == 10)
            {
                CalculateAndDisplayScore(); 
            }
        }

        
        private void CalculateAndDisplayScore()
        {
            
            Literal1.Text = $"總得分: {userScore}";
        }
    
        protected void CBF110040_nextQBtn_Click(object sender, EventArgs e)
    {

        CBF110040_MV1.ActiveViewIndex = 1;
        if (CBF110040_DDL1.SelectedIndex < CBF110040_DDL1.Items.Count - 1)
        {
            CBF110040_DDL1.SelectedIndex += 1;
            CBF110040_testBtn_Click(sender, e); 
        }
        else
        {
            Button1.Visible = true;
            ReplayLink.Visible = true;
            

            CBF110040_cambridge.Visible = false;
            CBF110040_input.Visible = false;
            CBF110040_nextQBtn.Visible = false;
            CBF110040_ch_hint.Visible = false;

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        
        userScore = 0;
        CBF110040_cambridge.Visible = true;
        CBF110040_input.Visible = true;
        CBF110040_MV1.ActiveViewIndex = 1;
        CBF110040_DDL1.SelectedIndex = -1; 
        CBF110040_input.Visible = false;
        Label2.Visible = false;
        Button1.Visible = false;
        ReplayLink.Visible = false;
        
    }
    protected void ReplayLink_Click(object sender, EventArgs e)
    {
        CBF110040_MV1.ActiveViewIndex = 0;
    }
}
