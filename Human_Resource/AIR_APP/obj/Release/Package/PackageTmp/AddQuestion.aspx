<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddQuestion.aspx.cs" Inherits="AIR_APP.AddQuestion" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .text-input{
            width:100%;
            max-width:80%;
                  
        }
        .btn-style{ margin-left: 270px; width:80px;background-color:white}
    </style>
     <asp:Table style="margin-top:20px;" Width="100%" HorizontalAlign="Center" runat="server">
    <asp:TableRow>
    <asp:TableCell HorizontalAlign="Right" Width="80%">
        <asp:TextBox ID="Question" runat="server" placeholder="Question" CssClass="text-input" TextMode="MultiLine"  Height="75px" ></asp:TextBox>
    </asp:TableCell> 
     <asp:TableCell Width="20%">  
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Question" ErrorMessage="*Please Enter The Question" ForeColor="OrangeRed" Font-Italic="true" Font-Size="12px"></asp:RequiredFieldValidator>
    </asp:TableCell>
   </asp:TableRow>
   <asp:TableRow>
    <asp:TableCell HorizontalAlign="Right">
        <asp:TextBox ID="Answer" runat="server" placeholder="Answer" CssClass="text-input" TextMode="MultiLine" Height="150px"></asp:TextBox>
         </asp:TableCell> 
        <asp:TableCell>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Answer" ErrorMessage="*Please Enter The Answer" ForeColor="OrangeRed" Font-Italic="true" Font-Size="12px"></asp:RequiredFieldValidator>
        </asp:TableCell>
   </asp:TableRow>
         <asp:TableRow Height="15px">
             <asp:TableCell></asp:TableCell>
         </asp:TableRow>
   <asp:TableRow>
        <asp:TableCell  HorizontalAlign="Center">
            <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" CssClass="btn-style"/>
       <asp:Label ID="msgLbl" runat="server" Text="" ForeColor="Green" ></asp:Label>
    </asp:TableCell>
       <asp:TableCell>
            
       </asp:TableCell>
   </asp:TableRow>
    </asp:Table>
</asp:Content>
