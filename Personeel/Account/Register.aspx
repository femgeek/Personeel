<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Personeel.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Use the form below to create a new account.</h2>
    </hgroup>
    <asp:SqlDataSource ID="SqlDataSourcePersoneel" runat="server" ConnectionString="<%$ ConnectionStrings:AfdelingenConnectionString %>" SelectCommand="SELECT [Nummer], [Naam], [Voornaam] FROM [Personen] WHERE (([Naam] = @Naam) AND ([Voornaam] = @Voornaam))">
        <SelectParameters>
            <asp:Parameter Name="Naam" Type="String"></asp:Parameter>
            <asp:Parameter Name="Voornaam" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourcePersoneel2" runat="server" ConnectionString='<%$ ConnectionStrings:AfdelingenConnectionString %>' SelectCommand="SELECT [Nummer], [Naam], [Voornaam] FROM [Personen] WHERE (([Naam] = @Naam) AND ([Nummer] = @Nummer))">
        <SelectParameters>
            <asp:Parameter Name="Naam" Type="String"></asp:Parameter>
            <asp:Parameter Name="Nummer" Type="Int32"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:CreateUserWizard runat="server" ID="RegisterUser" ViewStateMode="Disabled" OnCreatedUser="RegisterUser_CreatedUser">
        <LayoutTemplate>
            <asp:PlaceHolder runat="server" ID="wizardStepPlaceholder" />
            <asp:PlaceHolder runat="server" ID="navigationPlaceholder" />
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" ID="RegisterUserWizardStep">
                <ContentTemplate>
                    <p class="message-info">
                        Passwords are required to be a minimum of <%: Membership.MinRequiredPasswordLength %> characters in length.
                    </p>

                    <p class="validation-summary-errors">
                        <asp:Literal runat="server" ID="ErrorMessage" />
                    </p>

                    <fieldset>
                        <legend>Registration Form</legend>
                        <ol>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="UserName">Gebruikersnaam = voornaam.familienaam</asp:Label>
                                <asp:TextBox runat="server" ID="UserName" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="Gebruikersnaam is verplicht." />
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="UserName" ValidationExpression="[a-zA-Z]+\.[a-zA-Z]+" CssClass="field-validation-error" ErrorMessage="Gebruikersnaam moet 'voornaam.familienaam' zijn." />
                                <asp:CustomValidator ID="CustomValidatorUserName" runat="server" ErrorMessage="Ongeldige gebruikersnaam" ControlToValidate="UserName" OnServerValidate="CustomValidatorUserName_ServerValidate" />
                            </li>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="Email">Email adres</asp:Label>
                                <asp:TextBox runat="server" ID="Email" TextMode="Email" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                    CssClass="field-validation-error" ErrorMessage="Email is verplicht." />

                            </li>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="Password">Paswoord = familienaam_personeelsnummer</asp:Label>
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                    CssClass="field-validation-error" ErrorMessage="Paswoord is verplicht." />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPasWoord" runat="server" ControlToValidate="Password" ValidationExpression="[a-zA-Z]+_[0-9]+" CssClass="field-validation-error" ErrorMessage="Paswoord moet familienaam_personeelsnummer zijn." />
                                <asp:CustomValidator ID="CustomValidatorPasWoord" runat="server" ErrorMessage="Paswoord moet familienaam_personeelsnummer zijn." ControlToValidate="Password" OnServerValidate="CustomValidatorPasWoord_ServerValidate" />
                            </li>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Herhaal paswoord</asp:Label>
                                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                    CssClass="field-validation-error" Display="Dynamic" ErrorMessage="Herhaal paswoord is verplicht" />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                    CssClass="field-validation-error" Display="Dynamic" ErrorMessage="Het paswoord en de bevestiging zijn niet hetzelfde." />
                            </li>
                        </ol>
                        <asp:Button runat="server" CommandName="MoveNext" Text="Meld je aan" />
                    </fieldset>
                </ContentTemplate>
                <CustomNavigationTemplate />
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>
