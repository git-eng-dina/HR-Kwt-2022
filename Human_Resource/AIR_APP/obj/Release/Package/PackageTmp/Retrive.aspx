<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Retrive.aspx.cs" Inherits="AIR_APP.Retrive_aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >
    <style type="text/css">
       
        .highlight {text-decoration: underline;color:#ff0000;font-style:italic}
    .list-item {
       font-size:11px;
       color:slategrey;
       float: inherit;
    }
        .auto-style2 {
            width: 100%;  
            float:none;
            padding: 0;
            padding-left:0;
      vertical-align: middle;
        }
        .auto-style3 {
            width: 35%;     
        }
        .textbox-float{
            float:inherit;
        }
    </style>
      <asp:Table style="margin-top:20px;" class="auto-style3" HorizontalAlign="Center" runat="server">
          <asp:TableRow>
            <asp:TableCell CssClass="auto-style2" HorizontalAlign="Center">          
                <asp:TextBox ID="TextBox1" placeholder="Search" runat="server" CssClass="form-control nav navbar-nav"  Width="100%" Wrap="False"></asp:TextBox>
                <asp:ImageButton runat="server" ImageUrl="~/images/search.png" OnClick="search_Click" CssClass="nav navbar-nav" Width="30px" Height="30px"/>
             
            </asp:TableCell>         
         </asp:TableRow>
          <asp:TableRow>
            <asp:TableCell CssClass="auto-style2" HorizontalAlign="Center">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="list-item" >
                    <asp:ListItem Value="0" Selected="True">Boolean Model</asp:ListItem>
                    <asp:ListItem Value="1">Extended Boolean Model</asp:ListItem>
                    <asp:ListItem Value="2">Vector Model</asp:ListItem>
                 
                </asp:RadioButtonList>
            </asp:TableCell>
         </asp:TableRow>
    </asp:Table>
        <asp:Table runat="server" CssClass="table" HorizontalAlign="Center" Height="200px" Width="100%">
        <asp:TableRow>
            <asp:TableCell>
              
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  Width="100%"
            OnRowDataBound="GridView1_RowDataBound" EmptyDataText="No questions match query">
            <Columns>
                <asp:BoundField DataField="QUESTION" HeaderText="Question" SortExpression="QUESTION" HtmlEncode="true" HeaderStyle-Width="30%" />
                <asp:BoundField DataField="ANSWER" HeaderText="Answer" SortExpression="ANSWER" ControlStyle-Width="50%" HeaderStyle-Width="70%" />
            </Columns>
                </asp:GridView>
           
        </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
