<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calendario.aspx.cs" Inherits="soporte.Reportes.calendario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>by h@nz</title>
    <script type="text/javascript" language="javascript">
        
        function retornaValor(){
            if(document.getElementById('txtFecha').value == "")
            {
                if(dialogArguments == "")
                    returnValue = "";
                else
                    returnValue = dialogArguments;
            }
        }
    </script>
    <base target="_self" />
</head>
<body onunload="retornaValor();">
    <form id="form1" runat="server">
    <div style="position:absolute; top:0; left:0;">
        <asp:Calendar ID="cal" runat="server" BackColor="White" BorderColor="#999999"
            CellPadding="4" Font-Names="Verdana" Font-Size="8pt"
            ForeColor="Black" Height="180px" Width="200px" CaptionAlign="Top" OnSelectionChanged="cal_SelectionChanged" ShowGridLines="True">
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <SelectorStyle BackColor="#CCCCCC" />
            <WeekendDayStyle BackColor="#FFFFCC" />
            <OtherMonthDayStyle ForeColor="Gray" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
        </asp:Calendar>
     </div>
        <asp:TextBox ID="txtFecha" runat="server"></asp:TextBox>
    </form>
</body>

</html>
