<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Tweeple.Error" %>

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
    <style>
        #searchtext
        {
            border-top: thin solid #e5e5e5;
            border-right: thin solid #e5e5e5;
            border-bottom: 0;
            border-left: thin solid #e5e5e5;
            box-shadow: 0px 1px 1px 1px #e5e5e5;
            float: left;
            height: 27px;
            margin: .8em 0 0 .5em;
            outline: 0;
            padding: .4em 0 .4em .6em;
            width: 183px;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
        }
        #button-holder
        {
            background-color: #f1f1f1;
            border-top: thin solid #e5e5e5;
            box-shadow: 1px 1px 1px 1px #e5e5e5;
            cursor: pointer;
            float: left;
            height: 27px;
            margin: 11px 0 0 0;
            text-align: center;
            width: 50px;
        }
        
        #button-holder img
        {
            margin: 4px;
            width: 20px;
        }
    </style>
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <form id="Form1" runat="server">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">Tweeple</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a class="page-scroll" href="#page-top"></a>
                    </li>
                    
                  <li>
                        <asp:LinkButton text="" runat="server" ID="lblUsername" />
                    </li>
                    
                </ul>

               

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
              
                

            <div>
        <asp:Label Text="" ID="lblErrorMsg" runat="server" />
    </div>
                
              
                               
   
                        
                        </div>
                        
                        </div>
                       
        </div>
           </div>
            </div>
    </section>
    </form>
   
</body>
</html>