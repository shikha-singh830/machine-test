<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="EmpRegistration.Registration" %>
<%@   Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit"  TagPrefix="asp"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
</head>
<body>  
    <form id="form1" runat="server">  
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>  
            <table class="auto-style1">  
                <tr>  
                    <td>Emp Name:</td>  
                    <td>  
                        <asp:TextBox ID="txtname" runat="server"></asp:TextBox>  
                    </td>  
                    <td>
                        <asp:RequiredFieldValidator ID="reqname" runat="server" ControlToValidate="txtname" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
               </tr>

                 <tr>
                <td>
                 Date of Birth:
                </td>
                     <td>
                      <asp:TextBox ID="TextDob" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextDob" Format="dd-MM-yyyy"></asp:CalendarExtender>   
                    </td>
                     <td>
                        <asp:RequiredFieldValidator ID="reqdob" runat="server" ControlToValidate="TextDob" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
                         </tr>

                 <tr>  
                     <td>Gender:</td>  
                    <td>  
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">  
                            <asp:ListItem>Male</asp:ListItem>  
                            <asp:ListItem>Female</asp:ListItem>  
                        </asp:RadioButtonList>  
                    </td>  
                     <td>
                        <asp:RequiredFieldValidator ID="reqgender" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
               </tr>  

                <tr>
                <td>Address:</td>  
                    <td>
                    <textarea id="txtArea" cols="20" rows="2" runat="server"></textarea>    
                    </td>  
                     <td>
                        <asp:RequiredFieldValidator ID="reqadd" runat="server" ControlToValidate="txtArea" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </td>
               </tr>

                <tr> 
                    <td>State:</td>
                    <td>
                     <asp:DropDownList ID="ddlState" AppendDataBoundItems="true" 
                        DataTextField="State_Name" DataValueField="State_Id" runat="server" CssClass="auto-style2" >
                        <asp:ListItem Value="0">--Select your State--</asp:ListItem>
                    </asp:DropDownList>
                        </td>
                    
                     <td>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlState" InitialValue="0" runat="server" ErrorMessage="required"></asp:RequiredFieldValidator>
                    </td>
                </tr>  
               <tr>
                   <td>Hobbies:</td>
                   <td>
                        <asp:CheckBoxList ID="CheckBoxList2" runat="server" DataTextField="language"   
            DataValueField="language" AutoPostBack="True" Width="432px" ValidationGroup="group">  
                                <asp:ListItem ID="list1" runat="server" Text="Music">Music</asp:ListItem>  
    <asp:ListItem ID="ListItem1" runat="server" Text="Sports">Sports</asp:ListItem>  
                            <asp:ListItem ID="ListItem2" runat="server" checked="checked" Text="Cooking">Cooking</asp:ListItem> 
                             <asp:ListItem ID="ListItem3" runat="server" checked="checked" Text="Reading">Reading</asp:ListItem>
                            <asp:ListItem ID="ListItem4" runat="server" checked="checked" Text="Writing">Writing</asp:ListItem>
                            <asp:ListItem ID="ListItem5" runat="server" checked="checked" Text="Photography">Photography</asp:ListItem>
                             </asp:CheckBoxList>
    </td>              
               </tr>
                
                <tr>  
                    <td>  
                        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />  
                        <br />
                    </td>  
                </tr>  
                  
                <tr>
                    <td>
                       <asp:GridView ID="GDV" runat="server" AutoGenerateColumns="false" GridLines="None" border="2" CssClass="table table-bordered" AllowPaging="true"
                        PageSize="10" OnPageIndexChanging="GDV_PageIndexChanging" PagerStyle-HorizontalAlign="Center"></asp:GridView>
                    </td>
                </tr>

            </table>  
        </div>  
    </form>  
   
</body>  
</html>
