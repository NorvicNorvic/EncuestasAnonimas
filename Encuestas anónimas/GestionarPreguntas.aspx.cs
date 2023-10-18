using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Encuestas_anónimas
{
    public partial class GestionarPreguntas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtPregunta.Text.Trim()))
                {
                    lblMensaje.Text = "Debe ingresar una pregunta.";
                    return;
                }
                else
                {
                    int result = SqlDSPreguntas.Insert();
                    if (result > 0)
                    {
                        lblMensaje.Text = "La pregunta fue ingresada correctamente.";
                        txtPregunta.Text = string.Empty;
                        GvPreguntas.DataBind();
                    }
                    else
                    {
                        lblMensaje.Text = "La pregunta no pudo ser ingresada.";
                    }

                }
            }
            catch (Exception)
            {
                StreamWriter streamWriter = new StreamWriter($"{Server.MapPath(".")}/archivoLog.txt", true);
                streamWriter.Close();
            }
         
        }
    }
}