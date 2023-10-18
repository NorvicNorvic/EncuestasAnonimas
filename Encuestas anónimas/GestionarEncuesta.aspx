<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarEncuesta.aspx.cs" Inherits="Encuestas_anónimas.GestionarEncuesta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="row">
                <div class="col-3">
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Atras</asp:HyperLink>

                </div>
                <div class="col-2">
                
            <asp:DropDownList ID="DdListPreguntas" runat="server" DataSourceID="SQLDSPreguntas" DataTextField="descripcion" DataValueField="id"  >
            </asp:DropDownList>

                </div>
                <div class="col-2">
                                   <asp:DropDownList ID="DDlValor" runat="server" AutoPostBack="True"  >
                                       <asp:ListItem Value="1">1 (Muy Malo)</asp:ListItem>
                                       <asp:ListItem Value="2">2 (Malo)</asp:ListItem>
                                       <asp:ListItem Value="3">3 (Regular)</asp:ListItem>
                                       <asp:ListItem Value="4">4 (Bueno)</asp:ListItem>
                                       <asp:ListItem Value="5">5 (Muy Bueno)</asp:ListItem>
                                   </asp:DropDownList>
                </div>

                       <div class="col-2">

            <asp:Button ID="Bt_Agregar" runat="server" Text="Agregar" OnClick="Bt_Agregar_Click"  />
      </div>
            </div>
            <div class="row mt-2">
                <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
            </div>
            <div class="row mt-2">
                <div class="col-7">
                <asp:GridView ID="GvEncuesta" runat="server" Width="700px" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SQLDSEncuesta">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="Código" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="idPregunta" HeaderText="Id Pregunta" SortExpression="idPregunta" />
                        <asp:BoundField DataField="descripcion" HeaderText="Descripción" ReadOnly="True" SortExpression="descripcion" />
                        <asp:BoundField DataField="valor" HeaderText="Valor Elegido" SortExpression="valor" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>

                </div>
                  <div class="col-5">
                      <asp:Label ID="lblResultado" runat="server" Text="Resultado la Encuesta"></asp:Label>      
                       <asp:GridView ID="GVResultado" Width="500px" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDSResultado">
                           <Columns>
                               <asp:BoundField DataField="Pregunta" HeaderText="Pregunta" SortExpression="Pregunta" />
                               <asp:BoundField DataField="valor" HeaderText="valor" SortExpression="valor" />
                               <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" ReadOnly="True" SortExpression="Cantidad" />
                               <asp:BoundField DataField="media" DataFormatString="{0:0.##}" HeaderText="media" ReadOnly="True" SortExpression="media" />
                           </Columns>
                      </asp:GridView>
  </div>
            </div>
           
               
              
                   
                    

         


           

         
           
        

        </div>
                     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <asp:SqlDataSource ID="SQLDSPreguntas" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="SELECT * FROM [preguntas]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SQLDSEncuesta" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" DeleteCommand="DELETE FROM [encuestas] WHERE [id] = @id" InsertCommand="INSERT INTO [encuestas] ([idPregunta], [valor]) VALUES (@idPregunta, @valor)" SelectCommand="SELECT a.id, a.idPregunta, b.descripcion, a.valor FROM [encuestas] a, preguntas b
where a.idPregunta = b.id" UpdateCommand="UPDATE [encuestas] SET [idPregunta] = @idPregunta, [valor] = @valor WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="DdListPreguntas" Name="idPregunta" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DDlValor" Name="valor" PropertyName="SelectedValue" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="idPregunta" Type="Int32" />
                <asp:Parameter Name="valor" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlDSResultado" runat="server" ConnectionString="<%$ ConnectionStrings:conexion %>" SelectCommand="select b.descripcion as Pregunta , a.valor,  count(valor) as Cantidad, round(Convert(decimal, count(valor)) / (select count(idPregunta) from encuestas where idPregunta = a.idPregunta),2) media from encuestas a, preguntas b
where a.idPregunta = b.id
group by   valor, a.idPregunta, b.descripcion"></asp:SqlDataSource>
    </form>
                     </body>
</html>
