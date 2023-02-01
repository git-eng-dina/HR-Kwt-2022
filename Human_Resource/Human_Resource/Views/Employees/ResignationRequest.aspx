<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResignationRequest.aspx.cs" Inherits="Human_Resource.Views.Employees.ResignationRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

         <section class="statis">
         <div class="container" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ResignationRequest%>" /></a></li>
                                     <li class="breadcrumb-item" id="li_requsetStatus" runat="server"><asp:Literal  runat="server" Text="<%$ Resources:Labels,RequestUnderReview%>" /></li>
                                </ol> 

                            </nav>
                        </div>
                    </div>

                      <div class="col-12">
                      <div class="c-form">
                          <div class="row">
                               <div class="form-group" style="display:block">

                                        <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Reason%>" /></span>
                                         <asp:TextBox type="text" class="content-textarea" ID="txt_reason" name="txt_reason"  TextMode="MultiLine" Rows="10" runat="server" CssClass="width:80%" onchange="removeValidation($(this));"/>
                                        <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>

                                </div>  
                        </div>

                       <div class="row">&nbsp;</div>


                        <Button type="button" runat="server" class="btn btn-secondary btn-block save" id="btn_save" 
                            onserverclick="btn_save_Click" >
                            <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                        </Button>


                    </div>
                    </div>


                </div>
        </div>
        </section>
</asp:Content>
