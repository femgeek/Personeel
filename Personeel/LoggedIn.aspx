<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoggedIn.aspx.cs" Inherits="Personeel.LoggedIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSourcePersoneel" runat="server" ConnectionString="<%$ ConnectionStrings:AfdelingenConnectionString %>" SelectCommand="SELECT * FROM [Personen] WHERE ([Nummer] = @Nummer)">
        <SelectParameters>
            <asp:Parameter Name="Nummer" Type="Int32"></asp:Parameter>
                    </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePersoneel2" runat="server" ConnectionString='<%$ ConnectionStrings:AfdelingenConnectionString %>' SelectCommand="SELECT [Nummer], [Naam], [Voornaam] FROM [Personen] WHERE (([Naam] = @Naam) AND ([Voornaam] = @Voornaam))">
        <SelectParameters>
            <asp:Parameter Name="Naam" Type="String"></asp:Parameter>
            <asp:Parameter Name="Voornaam" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormViewPersoneel" runat="server" DataSourceID="SqlDataSourcePersoneel">
        <EditItemTemplate>
            Nummer:
            <asp:Label ID="NummerLabel1" runat="server" Text='<%# Eval("Nummer") %>' />
            <br />
            Naam:
            <asp:TextBox ID="NaamTextBox" runat="server" Text='<%# Bind("Naam") %>' />
            <br />
            Voornaam:
            <asp:TextBox ID="VoornaamTextBox" runat="server" Text='<%# Bind("Voornaam") %>' />
            <br />
            Afdeling:
            <asp:TextBox ID="AfdelingTextBox" runat="server" Text='<%# Bind("Afdeling") %>' />
            <br />
            Datum_in_dienst:
            <asp:TextBox ID="Datum_in_dienstTextBox" runat="server" Text='<%# Bind("Datum_in_dienst") %>' />
            <br />
            Geslacht:
            <asp:TextBox ID="GeslachtTextBox" runat="server" Text='<%# Bind("Geslacht") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Naam:
            <asp:TextBox ID="NaamTextBox" runat="server" Text='<%# Bind("Naam") %>' />
            <br />
            Voornaam:
            <asp:TextBox ID="VoornaamTextBox" runat="server" Text='<%# Bind("Voornaam") %>' />
            <br />
            Afdeling:
            <asp:TextBox ID="AfdelingTextBox" runat="server" Text='<%# Bind("Afdeling") %>' />
            <br />
            Datum_in_dienst:
            <asp:TextBox ID="Datum_in_dienstTextBox" runat="server" Text='<%# Bind("Datum_in_dienst") %>' />
            <br />
            Geslacht:
            <asp:TextBox ID="GeslachtTextBox" runat="server" Text='<%# Bind("Geslacht") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            PersoneelsNr:
            <asp:Label ID="NummerLabel" runat="server" Text='<%# Eval("Nummer") %>' />
            <br />
            <br />
            Familienaam:
            <asp:Label ID="NaamLabel" runat="server" Text='<%# Bind("Naam") %>' />
            <br />
            Voornaam:
            <asp:Label ID="VoornaamLabel" runat="server" Text='<%# Bind("Voornaam") %>' />
            <br />
            <br />
            Afdeling:
            <asp:Label ID="AfdelingLabel" runat="server" Text='<%# Bind("Afdeling") %>' />
            <br />
            <br />
            Datum_in_dienst:<br />
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" VisibleDate='<%# Bind("Datum_in_dienst") %>'
                SelectedDate='<%# Eval("Datum_in_dienst") %>' TitleFormat="MonthYear" Width="400px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                <DayStyle Width="14%" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                <TodayDayStyle BackColor="#CCCC99" />
            </asp:Calendar>
            <br />
            Geslacht:<br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" SelectedValue='<%# Bind("Geslacht") %>' RepeatDirection="Horizontal">
                <asp:ListItem Value="M" Text="Man" />
                <asp:ListItem Value="V" Text="Vrouw" />
            </asp:RadioButtonList>



        </ItemTemplate>
    </asp:FormView>
</asp:Content>
