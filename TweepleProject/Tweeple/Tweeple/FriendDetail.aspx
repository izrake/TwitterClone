<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FriendDetail.aspx.cs" Inherits="Tweeple.FriendDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Scrolling Nav - Start Bootstrap Template</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/Style1.css" rel="stylesheet" type="text/css" />
    <!-- Custom CSS -->
    <link href="css/scrolling-nav.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript">
        function LimtCharacters(txtMsg, CharLength, indicator) {
            chars = txtMsg.value.length;
            document.getElementById(indicator).innerHTML = CharLength - chars;
            if (chars > CharLength) {
                txtMsg.value = txtMsg.value.substring(0, CharLength);
            }
        }
    </script>
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Tweeple</a>
            </div>
            <form id="Form1" runat="server">
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a class="page-scroll" href="#page-top"></a>
                    </li>
                    <li>
                        <asp:LinkButton text="Home" runat="server" ID="lnlHome" 
                             onclick="lnkHome_Click" /> 
                    </li>
                    <li>
                        <a class="page-scroll" href="#about">Followings & Followers</a>
                    </li>
                   
                    <li>
                        <asp:LinkButton text="" runat="server" ID="lblUsername" />
                    </li>
                     <li>
                        <asp:LinkButton text="SignOut" runat="server" ID="lnkSignOut" 
                             onclick="lnkSignOut_Click" /> 
                    </li>
                </ul>
               
               
             
              
        </div>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <!-- Intro Section -->
    <section id="intro" class="intro-section" style="overflow: scroll;">
        <div class="container" >
            <div class="row">
            
                <div class="col-lg-12">
                
                <div style="float:left;width:600px;height:600px;">
                 <div class="profileImage"  style="width:600px">
                    <asp:Image ID="imgUserImage" ImageUrl=""  runat="server" Width="150px" Height="150px" style="border-radius:50%;" />
                </div>
                
                <div style="float:left;width:600px; overflow:auto;height:200px;margin-left:30px;margin-top:20px;">
                <div class="LinkButtons">
                    <asp:LinkButton ID="LinkButton2" href="#about" Text="Followings" runat="server" class="LinkButtons" /><br /><asp:Label ID="lblFollowings" Text="" runat="server" /><br /><br />
                    <asp:LinkButton ID="lnkFollowers" href="#about" Text="Followers" runat="server" class="LinkButtons" /><br /><asp:Label ID="lblFollower" Text="" runat="server" /><br /><br />
                    <asp:linkbutton ID="Linkbutton1" text="Tweets"  runat="server" classs="LinkButtons"  /><br /><asp:Label ID="lblTweets" Text="" runat="server" />
                </div>
                </div>
               
               
                
                 </div>
               
                <div style="float:right;">
                <h1>Tweets</h1>
                <asp:DataList ID="dlTweets" runat="server">
    <Itemtemplate>
  
   
    
    <asp:Image ID="dlImageUser" Imageurl='<%#"~/ImageHandler1.ashx?ID="+Eval("user_id") %>' Width="30px" Height="30px" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;
 
   
    
    
    <asp:Label ID="Label1" Text='<%#Eval("Message") %>' Width="300px" runat="server" /><br /><br />
   

    
    </Itemtemplate>
</asp:DataList>

                
                     
        </div>
       
        </div>
           </div>    
            </div>
       
    </section>
  
    <!-- Services Section -->
    
    <section id="about" class="about-section" style="overflow: scroll;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div style="float:left; margin-left:200px;">
                    <h1>Followers</h1>
                    <asp:Datalist runat="server" ID="dlShowFollowers" 
                            onitemcommand="dlShowFollowers_ItemCommand">
    <Itemtemplate>
     <table style="text-align:left;">
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" Text='<%#Eval("FirstName") %>' CommandName="passUserId" CommandArgument='<%#Eval("[user_id]") %>' runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" Text='<%#Eval("LastName") %>' runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" Text='<%#Eval("City") %>' runat="server" />
                        </td>
                    </tr>
                    </table>
    </Itemtemplate>
</asp:Datalist>
                    </div>
                    <div style="float:right;margin-right:200px;">
                    <h1>Followings</h1>
                    <asp:Datalist runat="server" ID="dlShowFollowings" 
                            onitemcommand="dlShowFollowings_ItemCommand">
    <Itemtemplate>
     <table style="text-align:left;">
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" Text='<%#Eval("FirstName") %>' CommandName="passUserId" CommandArgument='<%#Eval("[user_id]") %>' runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" Text='<%#Eval("LastName") %>' runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" Text='<%#Eval("City") %>' runat="server" />
                        </td>
                    </tr>
                    </table>
    </Itemtemplate>
</asp:Datalist>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </form>
    <!-- jQuery -->
    <script src="js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Scrolling Nav JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/scrolling-nav.js"></script>
</body>
</html>

