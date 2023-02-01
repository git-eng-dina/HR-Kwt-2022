<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeDismissal.aspx.cs" Inherits="Human_Resource.Views.Employees.EmployeeDismissal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>

        function getEmpInfo(sel) {
            resetValues();
            var id = sel.val();
            if (id == "" || id==0) {
                $('[id*=btn_save]').prop('disabled', true);
            }
            else
                $('[id*=btn_save]').prop('disabled', false);

            var parameter = {
                ID: id,
            };
            $.ajax({
                type: "POST",
                url: "EmployeeDismissal.aspx/GetEmpInfo",
                data: JSON.stringify(parameter),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    for (var prop in data) {
                        var item = data[prop];

                        $('[id*=hdn_vacationsAccountB]').val(item.VacationsAccount);
                        $('[id*=hdn_reward]').val(item.Reward);
                        $('[id*=txt_yearsOfWork]').text(item.YearsOfWork);

                        var emp = item.Employee;
                        $('[id*=txt_empName]').text(emp.NameAr);
                        $('[id*=txt_position]').text(emp.Position);

                        var img = document.querySelector("[id*=img_emp]");
                        if (emp.Image != null) {
                            var arrayBufferView = new Uint8Array(emp.Image);
                            var blob = new Blob([arrayBufferView], { type: "image/jpeg" });
                            var urlCreator = window.URL || window.webkitURL;
                            var imageUrl = urlCreator.createObjectURL(blob);

                            img.src = imageUrl;
                        }
                        else {
                            img.src = "../../images/no-image-icon-125x125.png";
                        }

                    }
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function displayVacAccount() {
            if ($("[id*=chk_vacationsAccount]").is(':checked')) {
                $("[id*=txt_vacationsAccount]").html($("[id*=hdn_vacationsAccountB]").val());
                $("[id*=hdn_vacationsAccountValue]").val($("[id*=hdn_vacationsAccountB]").val());
            }
            else {
                $("[id*=txt_vacationsAccount]").html("0");
                $("[id*=hdn_vacationsAccountValue]").val("0");
            }
            calculateTotal();
        }

        function displayReward() {
            if ($("[id*=chk_reward]").is(':checked')) {

                $("[id*=txt_reward]").html($("[id*=hdn_reward]").val());
                $("[id*=hdn_rewardValue]").val($("[id*=hdn_reward]").val());
            }
            else {
                $("[id*=txt_reward]").html("0");
                $("[id*=hdn_rewardValue]").val("0");
            }
            calculateTotal();
        }

        function calculateTotal() {
            var dues = $('[id*=txt_dues]').val();
            var vac = $('[id*=hdn_vacationsAccountValue]').val();
            var reward = $('[id*=hdn_rewardValue]').val();
            var total = parseFloat(dues) + parseFloat(vac) + parseFloat(reward);


            $("[id*=txt_total]").html(total.toFixed(2));

        }

        function resetValues() {
            $('[id*=txt_dues]').val(0);
            $("[id*=txt_vacationsAccount]").html("0");
            $("[id*=txt_reward]").html("0");
            $("[id*=txt_total]").html("0");

            $('[id*=txt_empName]').text("");
            $('[id*=txt_yearsOfWork]').text("");
            $('[id*=txt_position]').text("");
            var img = document.querySelector("[id*=img_emp]");
            img.src = "../../images/no-image-icon-125x125.png";
        }
    </script>
        <section class="statis">
         <div class="container" >
              <div class="row">
                   <div class="col-12">
                        <div class="bcrumb-block">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a id="a_title" href="#"><asp:Literal  runat="server" Text="<%$ Resources:Labels,EmployeeDismissal%>" /></a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                   <div class="col-12">
                        <div class="c-form" style="padding-bottom:0px;">
                            <div class="row">
                            <div class="form-group" style="display:block">
                                <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Employee%>" /></span>
                                <select runat="server" id="sel_emp" name="sel_emp" style="width:80%" class="form-control input-lg" 
                                    onchange="getEmpInfo($(this));removeValidation($(this));" ></select>
                                <div class="invalid-feedback"><asp:Literal  runat="server" Text="<%$ Resources:Labels,ValueIsRequired%>" /></div>

                            </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                    <div class="c-user-profile">
                    <div class="row">
                        <div class="col-3">

                           <img src="../../images/no-image-icon-125x125.png" id="img_emp" alt="" class="rounded mx-auto text-center">
           
                        </div>

                        <div class="col-9 details">
                            <div>
                                <p id="pName" style="margin-top:20px;"><span style="width:20%"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Name%>" /> :</span>
                                    <span id="txt_empName" style="width:80%"></span></p>
                            </div>
                            <div>
                                <p id="pCompany" style="margin-top:20px;"><span style="width:20%"><asp:Literal  runat="server" Text="<%$ Resources:Labels,Position%>" />: </span>
                                    <span id="txt_position" style="width:80%"></span>
                                </p>
                            </div>
                             <div>
                                <p id="pYears" style="margin-top:20px;"><span style="width:20%"><asp:Literal  runat="server" Text="<%$ Resources:Labels,YearsOfWork%>" />: </span>
                                    <span id="txt_yearsOfWork" style="width:80%"></span>
                                </p>
                            </div>
                        </div>
                    </div>
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

                          <div class="row dismissal-table">
                              <div class="col-4">
                                   <div class="row th">
                                       <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Dues%>" /></span>

                                   </div>
                                   <div class="row th">
                                        <input type="checkbox" runat="server" id="chk_vacationsAccount" name="chk_vacationsAccount" 
                                       class="form-control input-lg" onclick="javascript: displayVacAccount()"
                                           style="margin-top:0px;" />
                                      <label for="chk_vacationsAccount" ><asp:Literal  runat="server" Text="<%$ Resources:Labels,VacationsAccount%>" /></label>

                                  </div>
                                  <div class="row th">
                                       <input type="checkbox" runat="server" id="chk_reward" name="chk_reward" 
                                           class="form-control input-lg" style="margin-top:0px;" onclick="javascript: displayReward();"/>
                                       <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Indemnity%>" /></span>
                                  </div>
                                
                                  <div class="row th">
                                       <span><asp:Literal  runat="server" Text="<%$ Resources:Labels,Total%>" /></span>

                                   </div>
                              </div>
                              <div class="col-4">
                                    <div class="row th">
                                         <input type="number" class="form-control input-lg" id="txt_dues" 
                                             style="width:80%" value="0" runat="server" onchange="calculateTotal()"/>

                                     </div>

                                   <div class="row th">
                                         <input type="hidden" id="hdn_vacationsAccountB" name="hdn_vacationsAccountB" runat="server" />
                                         <input type="hidden" id="hdn_vacationsAccountValue" name="hdn_vacationsAccountValue" value="0" runat="server" />
                                  <span id="txt_vacationsAccount" runat="server"><asp:Literal  runat="server"   Text="0"> </asp:Literal></span>
                                   </div>

                                   <div class="row th">
                                        <input type="hidden" id="hdn_reward" name="hdn_reward" runat="server" />
                                        <input type="hidden" id="hdn_rewardValue" name="hdn_rewardValue" value="0" runat="server" />
                                  <span id="txt_reward"><asp:Literal    runat="server" Text="0"> </asp:Literal></span>
                                   </div>

                                   <div class="row th">
                                        <span id="txt_total"><asp:Literal    runat="server" Text="0"> </asp:Literal></span>
                                    </div>
                              </div>

                          </div>
                          <div class="row">&nbsp;</div>


                            <Button type="button" runat="server" class="btn btn-secondary btn-block save" id="btn_save" disabled
                              onserverclick="btn_save_Click" >
                                <asp:Literal  runat="server" Text=" <%$ Resources:Labels,Save%>" />
                            </Button>
                                     
                </div>
                </div>
              </div>
        </div>
        </section>
</asp:Content>
