﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MainPage.master" AutoEventWireup="false"
    CodeFile="StatisticheRegistrazioniProtocolloPage.aspx.vb" Inherits="StatisticheRegistrazioniProtocolloPage" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--SPDX-License-Identifier: GPL-3.0-only--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">


        var _backgroundElement = document.createElement("div");

        function pageLoad() {

            var scrollPanel = document.getElementById('<%= Me.scrollPanel.ClientID %>')
            var hidden = document.getElementById('<%= Me.scrollPosHidden.ClientID %>')
            scrollPanel.scrollTop = hidden.value;

            var manager = Sys.WebForms.PageRequestManager.getInstance();
            manager.add_beginRequest(OnBeginRequest);
            manager.add_endRequest(OnEndRequest);
            $get("pageContent").appendChild(_backgroundElement);

        }


        function OnBeginRequest(sender, args) {
            EnableUI(false);
        }

        function OnEndRequest(sender, args) {
            EnableUI(true);

        }

        function EnableUI(state) {
            if (!state) {
                _backgroundElement.style.display = '';
                _backgroundElement.style.position = 'absolute';
                _backgroundElement.style.left = '0px';
                _backgroundElement.style.top = '0px';

                _backgroundElement.style.width = '100%';
                _backgroundElement.style.height = '100%';

                _backgroundElement.style.zIndex = 10000;

                _backgroundElement.style.backgroundColor = '#09718F';
                _backgroundElement.style.filter = "alpha(opacity=20)";
                _backgroundElement.style.opacity = "0.2";
            }
            else {
                _backgroundElement.style.display = 'none';

            }
        }

        function GetPos(ele) {
            var hidden = document.getElementById('<%= Me.scrollPosHidden.ClientID %>')
            hidden.value = ele.scrollTop;
        }

      
    </script>
    <asp:UpdateProgress runat="server" ID="UpdateProgress1" DisplayAfter="0">
        <ProgressTemplate>
            <div id="loadingOuter" style="position: absolute; width: 100%; text-align: center;
                top: 300px; z-index: 2000000">
                <table cellpadding="4" style="background-color: #4892FF; margin: 0 auto">
                    <tr>
                        <td>
                            <div id="loadingInner" style="width: 300px; text-align: center; background-color: #BFDBFF;
                                height: 60px">
                                <span style="color: #00156E">Attendere prego ... </span>
                                <br />
                                <br />
                                <img alt="" src="../../../../images/loading.gif" border="0">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="Pannello" runat="server">
        <ContentTemplate>
            <div id="pageContent">
                <telerik:RadFormDecorator ID="RadFormDecorator1" DecoratedControls="all" runat="server"
                    DecorationZoneID="ZoneID1" Skin="Web20"></telerik:RadFormDecorator>
                <center>
                    <table width="900px" cellpadding="5" cellspacing="5" border="0">
                        <tr>
                            <td>
                                <table class="ContainerWrapper" border="0" cellpadding="2" cellspacing="0" width="100%">
                                    <tr>
                                        <td>
                                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                <tr>
                                                    <td style="background-color: #BFDBFF; padding: 4px; border-bottom: 1px solid  #9ABBE8;
                                                        border-top: 1px solid  #9ABBE8; height: 25px">
                                                        &nbsp;<asp:Label ID="TitoloLabel" runat="server" Style="color: #00156E" Font-Bold="True"
                                                            Text="Filtro Statistiche" />
                                                    </td>
                                                    <td align="center" style="width: 30px; background-color: #BFDBFF; border-bottom: 1px solid  #9ABBE8;
                                                        border-top: 1px solid  #9ABBE8;">
                                                        <asp:ImageButton ID="FiltraImageButton" runat="server" ImageUrl="~/images//search.png"
                                                            ToolTip="Effettua la ricerca con i filtri impostati" Style="border: 0" ImageAlign="AbsMiddle" />
                                                    </td>
                                                    <td align="center" style="width: 30px; background-color: #BFDBFF; border-bottom: 1px solid  #9ABBE8;
                                                        border-top: 1px solid  #9ABBE8;">
                                                        <asp:ImageButton ID="AnnullaFiltroImageButton" Style="border: 0" runat="server" ImageUrl="~/images//cancelSearch.png"
                                                            ToolTip="Annulla i filtri impostati" ImageAlign="AbsMiddle" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="ContainerMargin">
                                            <table class="Container" cellpadding="0" cellspacing="4" width="100%" border="0">
                                                <tr>
                                                    <td align="center" style="height: 50px">
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="width: 40px">
                                                                    <asp:Label ID="DataLabel" runat="server" CssClass="Etichetta" Text="Data" ForeColor="#00156E"
                                                                        Font-Bold="True" />
                                                                </td>
                                                                <td style="width: 30px">
                                                                    <asp:Label ID="DataInizioLabel" runat="server" CssClass="Etichetta" Text="da" ForeColor="#00156E" />
                                                                </td>
                                                                <td style="width: 130px">
                                                                    <telerik:RadDatePicker ID="DataInizioTextBox" Skin="Office2007" Width="110px" runat="server"
                                                                        MinDate="1753-01-01" />
                                                                </td>
                                                                <td style="width: 20px">
                                                                    <asp:Label ID="DataAFineLabel" runat="server" CssClass="Etichetta" Text="a" ForeColor="#00156E" />
                                                                </td>
                                                                <td>
                                                                    <telerik:RadDatePicker ID="DataFineTextBox" Skin="Office2007" Width="110px" runat="server"
                                                                        MinDate="1753-01-01" />
                                                                </td>
                                                                <td>
                                                                    <div id="ZoneID1">
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="width: 120px; text-align: center">
                                                                                    <asp:Label ID="RaggruppaLabel" runat="server" CssClass="Etichetta" Text="Rappruppa per"
                                                                                        ForeColor="#00156E" Font-Bold="True" />
                                                                                </td>
                                                                                <td style="width: 25px">
                                                                                    <asp:RadioButton Text="&nbsp;" Checked="true" ID="SettoreRadioButton" GroupName="Tipologia"
                                                                                        runat="server" CssClass="Etichetta" />
                                                                                </td>
                                                                                <td style="width: 70px">
                                                                                    <asp:Label ID="SettoreLabel" runat="server" Text="Settore" CssClass="Etichetta" Style="color: #00156E" />
                                                                                </td>
                                                                                <td style="width: 25px">
                                                                                    <asp:RadioButton Text="&nbsp;" ID="StrutturaRadioButton" GroupName="Tipologia" runat="server"
                                                                                        CssClass="Etichetta" />
                                                                                </td>
                                                                                <td style="width: 70px">
                                                                                    <asp:Label ID="StrutturaLabel" runat="server" Text="Struttura" CssClass="Etichetta"
                                                                                        Style="color: #00156E" />
                                                                                </td>
                                                                                <td style="width: 25px">
                                                                                    <asp:RadioButton Text="&nbsp;" ID="OperatoreRadioButton" GroupName="Tipologia" runat="server"
                                                                                        Style="color: #00156E" />
                                                                                </td>
                                                                                <td style="width: 70px">
                                                                                    <asp:Label ID="OperatoreLabel" runat="server" Text="Operatore" CssClass="Etichetta"
                                                                                        Style="color: #00156E" />
                                                                                </td>
                                                                                <td style="width: 25px">
                                                                                    <asp:RadioButton Text="&nbsp;" ID="NessunoRadioButton" GroupName="Tipologia" runat="server"
                                                                                        Style="color: #00156E" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="NessunoLabel" runat="server" Text="Nessuno" CssClass="Etichetta" Style="color: #00156E" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table style="width: 100%; background-color: #BFDBFF; border: 1px solid #5D8CC9">
                                                <tr>
                                                    <td>
                                                        <table style="width: 100%; background-color: #BFDBFF">
                                                            <tr>
                                                                <td>
                                                                    &nbsp;<asp:Label ID="StatisticheLabel" runat="server" Font-Bold="True" Style="width: 500px;
                                                                        color: #00156E; background-color: #BFDBFF" Text="Statistiche" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div id="scrollPanel" class="CustomFooter" runat="server" style="overflow: auto;
                                                            height: 425px; width: 100%; background-color: #FFFFFF; border: 1px solid #5D8CC9;"
                                                            onscroll="GetPos(this)">
                                                            <telerik:RadGrid ID="StatisticheGridView" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                                CellSpacing="0" GridLines="None" Skin="Office2007" Width="99.8%" AllowSorting="True"
                                                                Culture="it-IT">
                                                                <FooterStyle ForeColor="#00156E" />
                                                                <MasterTableView DataKeyNames="Id" TableLayout="Fixed" ShowFooter="true">
                                                                    <Columns>
                                                                        <telerik:GridBoundColumn DataField="Id" DataType="System.Int32" FilterControlAltText="Filter Id column"
                                                                            HeaderText="Id" Visible="false" SortExpression="Id" UniqueName="Id" />
                                                                        <telerik:GridTemplateColumn HeaderStyle-Width="80px" ItemStyle-Width="80px" DataField="ProtocolliArrivo"
                                                                            FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FilterControlAltText="Filter ProtocolliArrivo column"
                                                                            HeaderText="Arrivo" SortExpression="ProtocolliArrivo" UniqueName="ProtocolliArrivo">
                                                                            <ItemTemplate>
                                                                                <div title='<%# Eval("ProtocolliArrivo")%>' style="white-space: nowrap; overflow: hidden;
                                                                                    text-overflow: ellipsis; width: 100%; border: 0px solid red">
                                                                                    <%# Eval("ProtocolliArrivo")%></div>
                                                                            </ItemTemplate>
                                                                        </telerik:GridTemplateColumn>
                                                                        <telerik:GridTemplateColumn HeaderStyle-Width="80px" ItemStyle-Width="80px" DataField="ProtocolliPartenza"
                                                                            FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FilterControlAltText="Filter ProtocolliPartenza column"
                                                                            HeaderText="Partenza" SortExpression="ProtocolliPartenza" UniqueName="ProtocolliPartenza">
                                                                            <ItemTemplate>
                                                                                <div title='<%# Eval("ProtocolliPartenza")%>' style="white-space: nowrap; overflow: hidden;
                                                                                    text-overflow: ellipsis; width: 100%; border: 0px solid red">
                                                                                    <%# Eval("ProtocolliPartenza")%></div>
                                                                            </ItemTemplate>
                                                                        </telerik:GridTemplateColumn>
                                                                        <telerik:GridTemplateColumn HeaderStyle-Width="80px" ItemStyle-Width="80px" DataField="ProtocolliInterni"
                                                                            FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FilterControlAltText="Filter ProtocolliInterni column"
                                                                            HeaderText="Interni" SortExpression="ProtocolliInterni" UniqueName="ProtocolliInterni">
                                                                            <ItemTemplate>
                                                                                <div title='<%# Eval("ProtocolliInterni")%>' style="white-space: nowrap; overflow: hidden;
                                                                                    text-overflow: ellipsis; width: 100%; border: 0px solid red">
                                                                                    <%# Eval("ProtocolliInterni")%></div>
                                                                            </ItemTemplate>
                                                                        </telerik:GridTemplateColumn>
                                                                        <telerik:GridTemplateColumn HeaderStyle-Width="80px" ItemStyle-Width="80px" DataField="ProtocolliAnnullati"
                                                                            FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FilterControlAltText="Filter ProtocolliAnnullati column"
                                                                            HeaderText="Annullati" SortExpression="ProtocolliAnnullati" UniqueName="ProtocolliAnnullati">
                                                                            <ItemTemplate>
                                                                                <div title='<%# Eval("ProtocolliAnnullati")%>' style="white-space: nowrap; overflow: hidden;
                                                                                    text-overflow: ellipsis; width: 100%; border: 0px solid red">
                                                                                    <%# Eval("ProtocolliAnnullati")%></div>
                                                                            </ItemTemplate>
                                                                        </telerik:GridTemplateColumn>
                                                                        <telerik:GridTemplateColumn HeaderStyle-Width="80px" ItemStyle-Width="80px" DataField="Totale"
                                                                            FooterStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" FilterControlAltText="Filter Totale column"
                                                                            HeaderText="Totale" SortExpression="Totale" UniqueName="Totale">
                                                                            <ItemTemplate>
                                                                                <div title='<%# Eval("Totale")%>' style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
                                                                                    width: 100%; border: 0px solid red">
                                                                                    <%# Eval("Totale")%></div>
                                                                            </ItemTemplate>
                                                                        </telerik:GridTemplateColumn>
                                                                        <telerik:GridTemplateColumn DataField="Descrizione" FilterControlAltText="Filter Descrizione column"
                                                                            HeaderText="Descrizione" SortExpression="Descrizione" UniqueName="Descrizione">
                                                                            <ItemTemplate>
                                                                                <div title='<%# Eval("Descrizione")%>' style="white-space: nowrap; overflow: hidden;
                                                                                    text-overflow: ellipsis; width: 100%; border: 0px solid red">
                                                                                    <%# Eval("Descrizione")%></div>
                                                                            </ItemTemplate>
                                                                        </telerik:GridTemplateColumn>
                                                                    </Columns>
                                                                </MasterTableView>
                                                            </telerik:RadGrid>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <asp:Label ID="InfoLabel" runat="server" CssClass="Etichetta" Text=" NOTA : Il risultato dell'estrazione dei protocolli relativi alla selezione per Settore e per Struttura possono risultare differenti rispetto alle altre selezioni, perchè un protocollo potrebbe essere associato a più Strutture, e quindi conteggiato più volte."
                                                ForeColor="#00156E" Font-Bold="True" Font-Size="9px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="background-color: #BFDBFF; padding: 4px; border-bottom: 0px solid  #9ABBE8;
                                border-top: 1px solid  #9ABBE8; height: 25px">
                                <telerik:RadButton ID="EsportaExcelButton" runat="server" Text="Esporta" Width="90px"
                                    Skin="Office2007" ToolTip="Esporta in formato CSV">
                                    <Icon PrimaryIconUrl="../../../../images/excel16.png" PrimaryIconLeft="5px" />
                                </telerik:RadButton>
                            </td>
                        </tr>
                    </table>
                </center>
                <asp:HiddenField ID="scrollPosHidden" runat="server" Value="0" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
