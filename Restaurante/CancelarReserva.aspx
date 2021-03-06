﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Maestra.Master" AutoEventWireup="true" CodeBehind="CancelarReserva.aspx.cs" Inherits="Restaurante.CancelarReserva" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="PanelInputUser" runat="server">
        <asp:Label ID="lblReserva" runat="server" Text="Ingresar código de reserva:"></asp:Label>
        <asp:TextBox ID="txtCodReserva" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ControlToValidate="txtCodReserva" ID="RequiredFieldValidator4" runat="server" ForeColor="Tomato" ErrorMessage="*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="txtCodReserva" runat="server" ErrorMessage="Código Inválido" ValidationExpression="^[a-zA-Z0-9_.-]*$"></asp:RegularExpressionValidator>
        <br/>
        <asp:Button ID="btnBuscarReserva" runat="server" Text="Buscar" OnClick="btnBuscarReserva_Click" />
    </asp:Panel>
    <br />
    <asp:Panel ID="PanelMostrarReserva" runat="server" Visible="false">
        <asp:Label ID="lbl2" runat="server" Text="Seleccionar Reserva"></asp:Label>
        <asp:GridView ID="GrillaReserva" runat="server" AutoGenerateColumns="false" OnRowCommand="GrillaReserva_RowCommand" DataKeyNames="CodigoReserva">
            <Columns>
                <asp:BoundField DataField="CodigoReserva" HeaderText="Código de Reserva"/>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre"/>
                <asp:BoundField DataField="FechaReserva" HeaderText="Fecha"/>
                <asp:BoundField DataField="CantPersonas" HeaderText="Personas"/>
                <asp:BoundField DataField="Mesa" HeaderText="Mesa"/>
                <asp:ButtonField ButtonType="Button" CommandName="cancelar" Text="Cancelar"/>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:Panel ID="PanelConfirmar" runat="server" Visible="false" BackColor="#ffffef">
        <br />
        <asp:Label ID="lblConfirmar" runat="server" Text="Seguro que desea cancelar?"></asp:Label>
        <asp:Button ID="btnAceptar" runat="server" Text="Sí" OnClick="btnAceptar_Click"/>        
            <asp:Button ID="btnVolver" runat="server" Text="No" OnClick="btnVolver_Click"/>
    </asp:Panel>
</asp:Content>
