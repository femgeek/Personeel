<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="Personeel.Overview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridViewOverview" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourcePersoneelsLeden" ForeColor="#333333" GridLines="None" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Details opvragen">
                <ItemTemplate>
                    <asp:Button runat="server" CommandName="Edit" CommandArgument='<%#Eval("Nummer") %>' Text="Details" OnClick="Details_Click" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="Nummer" HeaderText="Nummer" InsertVisible="False" SortExpression="Nummer" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" SortExpression="Naam" />
            <asp:BoundField DataField="Voornaam" HeaderText="Voornaam" SortExpression="Voornaam" />
            <asp:BoundField DataField="Afdeling" HeaderText="Afdeling" SortExpression="Afdeling" />
            <asp:BoundField DataField="Datum_in_dienst" HeaderText="Datum in dienst" SortExpression="Datum_in_dienst" />
            <asp:BoundField DataField="Geslacht" HeaderText="Geslacht" SortExpression="Geslacht" />

        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourcePersoneelsLeden" runat="server" ConnectionString="<%$ ConnectionStrings:AfdelingenConnectionString %>" SelectCommand="SELECT * FROM [Personen]" />

</asp:Content>
