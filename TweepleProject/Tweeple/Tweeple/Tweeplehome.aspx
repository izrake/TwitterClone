<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tweeplehome.aspx.cs" Inherits="Tweeple.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" type="text/css" href="Tweeplemaster.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper">
        <div class="header">
            <asp:LinkButton Text="SignOut" runat="server" class="button signOut" />
        </div>
        <div class="container">
            <div class="containerPic">
                <div class="profileImage">
                    <asp:Image ImageUrl="Images/ss.jpg" runat="server" Width="150px" Height="150px" style="border-radius:50%;" />
                </div>
                <div class="followerFollowin">
                    <asp:LinkButton Text="Followings" runat="server" class="LinkButtons" /><br /><asp:Label ID="lblFollowings" Text="" runat="server" /><br /><br />
                    <asp:LinkButton ID="lnkFollowers" Text="Followers" runat="server" class="LinkButtons" /><br /><asp:Label ID="lblFollower" Text="" runat="server" />
                </div>
            </div>
            <div class="DataContainer">
            <div class="tweetUpdaterContainer">
            <div class="tweetUpdater"></div>
            </div>
            </div>
            <div class="suggestion">
            <h1>
            Suggestion</h1>
        <asp:DataList runat="server" ID="DataUpload" RepeatColumns="1" RepeatDirection="Horizontal"
             OnItemCommand="DataUpload_ItemCommand">
            <ItemStyle ForeColor="#3366FF" />
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" Text='<%#Eval("FirstName") %>' runat="server" />
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
                    <tr>
                   
                        <td>
                            <asp:Button ID="cmdFollow" class="myButton" Text="Follow" runat="server" CommandName="Follow" CommandArgument='<%#Eval("[user_id]") %>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
