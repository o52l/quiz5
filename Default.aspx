<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:MultiView ID="CBF110040_MV1" runat="server">
                <asp:View ID="CBF110040_View1" runat="server">
                    <asp:GridView ID="CBF110040_GV1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="沒有資料錄可顯示。" GridLines="Horizontal">
                        <Columns>
                            <asp:TemplateField ShowHeader="False" ItemStyle-Wrap="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('你確定要刪除嗎?')"
Text="刪除"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="word" HeaderText="word" SortExpression="word" />
                            <asp:BoundField DataField="ch_explanation" HeaderText="ch_explanation" SortExpression="ch_explanation" />
                            <asp:TemplateField HeaderText="sentence" SortExpression="sentence">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("sentence") %>' Width="98%" TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("sentence") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="sno" HeaderText="sno" SortExpression="sno" />
                            <asp:BoundField DataField="level" HeaderText="level" SortExpression="level" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle ForeColor="#333333" BackColor="White" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" DeleteCommand="DELETE FROM [gept_words] WHERE [Id] = @Id" InsertCommand="INSERT INTO [gept_words] ([Id], [word], [ch_explanation], [sentence], [sno], [level], [frequency], [weight]) VALUES (@Id, @word, @ch_explanation, @sentence, @sno, @level, @frequency, @weight)" SelectCommand="SELECT [Id], [word], [ch_explanation], [sentence], [sno], [level], [frequency], [weight] FROM [gept_words]" UpdateCommand="UPDATE [gept_words] SET [word] = @word, [ch_explanation] = @ch_explanation, [sentence] = @sentence, [sno] = @sno, [level] = @level, [frequency] = @frequency, [weight] = @weight WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="Double" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Id" Type="Double" />
                            <asp:Parameter Name="word" Type="String" />
                            <asp:Parameter Name="ch_explanation" Type="String" />
                            <asp:Parameter Name="sentence" Type="String" />
                            <asp:Parameter Name="sno" Type="String" />
                            <asp:Parameter Name="level" Type="Double" />
                            <asp:Parameter Name="frequency" Type="Double" />
                            <asp:Parameter Name="weight" Type="Double" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="word" Type="String" />
                            <asp:Parameter Name="ch_explanation" Type="String" />
                            <asp:Parameter Name="sentence" Type="String" />
                            <asp:Parameter Name="sno" Type="String" />
                            <asp:Parameter Name="level" Type="Double" />
                            <asp:Parameter Name="frequency" Type="Double" />
                            <asp:Parameter Name="weight" Type="Double" />
                            <asp:Parameter Name="Id" Type="Double" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <span style="color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><br /><br />請點選單字來查閱中文解釋<br /> </span>
                    <asp:DropDownList ID="CBF110040_DDL1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="word" DataValueField="ch_explanation" OnSelectedIndexChanged="CBF110040_DDL1_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Button ID="CBF110040_PreviousButton" runat="server" OnClick="CBF110040_PreviousButton_Click" Text="PreviousButton" Height="25px" />
                    &nbsp;<asp:Button ID="CBF110040_NextButton" runat="server" Height="25px" OnClick="CBF110040_NextButton_Click" Text="NextButton" />
                    &nbsp;<asp:Button ID="CBF110040_testBtn" runat="server" OnClick="CBF110040_testBtn_Click" Text="測驗去" Height="26px" />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" OnSelecting="SqlDataSource2_Selecting" SelectCommand="SELECT * FROM [gept_words] ORDER BY [Id] OFFSET @OFFSET ROWS FETCH NEXT 10 ROWS ONLY">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="OFFSET" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Literal ID="CBF110040_cambridge" runat="server"></asp:Literal><br /><br />
                     <a href="https://github.com/o52l/quiz5/blob/main/HtmlPage.html">GitHub心得</a>&nbsp; <a href="HtmlPage.html">本地端心得網頁</a>
                </asp:View>
                <asp:View ID="CBF110040_View2" runat="server">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="結束" OnClick="Button1_Click1" Height="25px" />
                    <asp:Literal ID="CBF110040_ch_hint" runat="server"></asp:Literal>
                    <asp:TextBox ID="CBF110040_input" runat="server" onclick="this.setSelectionRange(0,999)" onfocus="this.setSelectionRange(0,999)" autofocus="autofocus" AutoComplete="off"></asp:TextBox>
                    <asp:Button ID="CBF110040_nextQBtn" runat="server" Text="下一題" OnClick="CBF110040_nextQBtn_Click" Height="25px" style="height: 27px" />
                    <br /> &nbsp;<asp:Label ID="Label2" runat="server" Text="請輸入完整單字(底線是用來提示有幾個字元, 如果消失了可以移動滑鼠至方格上來查看.)"></asp:Label>
                    <br />
                    <asp:HyperLink ID="ReplayLink" runat="server" NavigateUrl="Default.aspx">重玩</asp:HyperLink>

                    <br />

                </asp:View>
            </asp:MultiView>

            <br />
            <br />
        </div>
    </form>
</body>
</html>
