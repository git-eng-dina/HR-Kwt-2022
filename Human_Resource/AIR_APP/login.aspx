<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Human_Resource.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Log in</title>
    <link rel="stylesheet" type="text/css" href= "content/en/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="content/en/css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="content/en/css/style.css"/>
</head>
<body class="login-bg">
    <section id="login">
        <div class="container">
            <div class="log-space">
                <div class="logo text-center mb-4">
                    <img src="images/hr_logo.png" alt="" width="250" height="150"/>
                </div>
                <!-- Start Contact Form -->
                <form role="form" runat="server">

                    <div class="form-group">
                        <input type="text" class="form-control input-lg" id="username" runat="server" value="" placeholder="Username" />
                    </div>

                    <div class="form-group">
                        <input type="password" class="form-control input-lg" id="password" runat="server" placeholder="Password" />

                        <label class="form-control is-invalid" style="display:none" id="lbl_error" runat="server">Username and/or password is incorrect.</label>

                    </div>
  <asp:Button runat="server" Text = "Log in" class="btn btn-secondary btn-block" id="btn_login" OnClick="login_Click" CausesValidation="false" >
                            </asp:Button>
                </form>
            </div>
        </div>
    </section>
    <footer>
        <div class="container">
            <hr />
            <div class="row">
                <div class="col-12 copyright">
                    <p>2022@All Right Reserved for Increase</p>
                </div>
            </div>
        </div>
    </footer>


    <script src="content/en/js/jquery-2.1.3.min.js"></script>
    <script src="content/en/js/popper.min.js"></script>
    <script src="content/en/js/bootstrap.min.js"></script>
    <script src="content/en/js/main.js"></script>
</body>
</html>
