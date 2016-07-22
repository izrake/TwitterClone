<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Tweeple.SignIn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
  <meta charset="UTF-8">
    <title>Sign-Up/Login Form</title>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css' />
    
    <link rel="stylesheet" href="css/normalize.css" />
     
    
        <link rel="stylesheet" href="css/style.css" />
    <script type = "text/javascript" >
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
</script>
    
    
</head>
<body style="background-image:url(Images/ss.jpg)">
    <form id="form1" runat="server">
    <div>
    <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Sign Up for Free</h1>
          
          
          
          <div class="top-row">
           <div class="field-wrap">
              <label>
                First Name<span class="req">*</span>
              </label>
              
        <asp:TextBox runat="server" ID="txtFirstName" />
                <asp:RequiredFieldValidator ID="reqfname" runat="server" ForeColor="LightGreen" ErrorMessage="Required!!" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              
            <asp:TextBox runat="server" ID="txtLastName" />
                <asp:RequiredFieldValidator ID="reqlname" runat="server" ForeColor="LightGreen" ErrorMessage="Required!!" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
            </div>
          </div>

          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <asp:TextBox runat="server" ID="txtEmailId" />
              <asp:RequiredFieldValidator ID="reqemail" runat="server" ForeColor="LightGreen" ErrorMessage="Required!!" ControlToValidate="txtEmailId"></asp:RequiredFieldValidator>
          </div>

          <div class="field-wrap">
            <label>
              UserName<span class="req">*</span>
            </label>
            <asp:TextBox runat="server" ID="txtUsername" />
            <asp:RequiredFieldValidator ID="reqUsername" runat="server" ForeColor="LightGreen" ErrorMessage="Required!!" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
          </div>
          
          <div class="field-wrap">
            <label>
              Set A Password<span class="req">*</span>
            </label>
           <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" />
              <asp:RequiredFieldValidator ID="reqPassword" runat="server" ForeColor="LightGreen" ErrorMessage="Required!!" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
          </div>

          <div class="field-wrap">
            <label>
              City<span class="req">*</span>
            </label>
            <asp:TextBox runat="server" ID="txtCity"  />
          
          </div>
           <div class="field-wrap">
            <label>
              MobileNo<span class="req">*</span>
            </label>
            <asp:TextBox runat="server" ID="txtMobileNo" />
          </div>
          
        <asp:Button Text="Register" class="button button-block" runat="server" 
                ID="cmdRegister" onclick="cmdRegister_Click"  CausesValidation="True" />
          
          
         

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          
          
            <div class="field-wrap">
            <label>
              Username<span class="req">*</span>
            </label>
            
            <asp:TextBox runat="server" ID="txtUserSignInName" />
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <asp:TextBox runat="server" ID="txtUserSignInPass" TextMode="Password" />
          </div>
          
          <%--<p class="forgot"><a href="#">Forgot Password?</a></p>--%>
           <asp:CheckBox runat="server"   ID="chkRemember" Height="20px" Width="20px"  />
          <asp:Label ID="lbl1" runat="server"  Text="Remember Me" ForeColor="Red"></asp:Label>
           

          
            <asp:Button Text="SignIn" runat="server" ID="cmdSignIn" onclick="cmdSignIn_Click" 
                 CausesValidation="False" />
         
          
          

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>
    </div>
    </form>
</body>
</html>

