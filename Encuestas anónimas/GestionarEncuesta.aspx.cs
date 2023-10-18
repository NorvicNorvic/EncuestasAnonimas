using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Encuestas_anónimas
{
    public partial class GestionarEncuesta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void Bt_Agregar_Click(object sender, EventArgs e)
        {
            try
            {
                int result = SQLDSEncuesta.Insert();
                if (result > 0)
                {
                    lblMensaje.Text = "La encuesta se registró correctamente";
                    GvEncuesta.DataBind();
                    GVResultado.DataBind();

                }
                else
                {
                    lblMensaje.Text = "La encuesta no se pudo registrar";
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