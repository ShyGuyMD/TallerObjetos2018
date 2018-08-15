﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aplicacion;
using Dominio.Clases;
using static Helpers.Utils;

namespace Restaurante
{
    public partial class CancelarReserva : System.Web.UI.Page
    {
        string mCodigo = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Reset();
            }
        }

        protected void GrillaReserva_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int fila = int.Parse(e.CommandArgument + "");
            string id = (string)GrillaReserva.DataKeys[fila].Value;

            if (e.CommandName == "cancelar")
            {
                PanelConfirmar.Visible = true;
            }
        }

        protected void btnBuscarReserva_Click(object sender, EventArgs e)
        {
            string codigo = txtCodReserva.Text;
            codigo = codigo.ToUpper();

            if (Fachada.Get.BuscarReservaPorCodigo(codigo) != null)
            {
                CargarReserva(codigo);
                mCodigo = codigo;
            }
            else
            {
                Response.Write("Reserva no encontrada. Revisar Datos.");
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Response.Write(Maestra.MensajeError((int)Fachada.Get.BajaReserva(mCodigo), "Cancelar Reserva"));
            Reset();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Reset();
            Response.Redirect("~/CancelarReserva.aspx");
        }
        protected void Reset()
        {
            PanelConfirmar.Visible = false;
            PanelMostrarReserva.Visible = false;
        }
        protected void CargarReserva(string pCodigo)
        {
            GrillaReserva.DataSource = Fachada.Get.BuscarReservaPorCodigo(pCodigo);
            GrillaReserva.DataBind();
            PanelMostrarReserva.Visible = true;
        }
    }
}