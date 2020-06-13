package controlador;

import entidad.Doctor;
import entidad.Paciente;
import entidad.Recepcionista;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import miConexion.MySQLDBConexion;

@WebServlet(name = "srvTest2", urlPatterns = {"/srvTest2"})
public class srvTest2 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset=\"UTF-8\">");
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
            out.println("<link rel=\"stylesheet\" href=\"css/reset.css\">");
            out.println("<link rel=\"stylesheet\" href=\"css/style.css\">");
            out.println("<title>Servlet srvTest2</title>");
            out.println("</head>");
            out.println("<body>");

            //MySQLDBConexion cn = new MySQLDBConexion();
            out.print("<table class=\"table table-dark\">");
            out.println("<tr><td >Nombre y Apellido</td><td>Sexo</td><td>Telefono</td></tr>");
            String cad = request.getParameter("q");
            try {
                Connection conn;
                PreparedStatement pstm;
                ResultSet rs;

                conn = MySQLDBConexion.getConnection();
                String sql = "select * from doctor where apedoctor like '" + cad + "%';";
                pstm = conn.prepareStatement(sql);
                rs = pstm.executeQuery();

                while (rs.next()) {

                    out.println("<tr><td><a href=\"Controlador?metodo=busca&id=" + rs.getString(5) + "\">" + rs.getString(4) + " " + rs.getString(5) + "</td><td>" + rs.getString(7) + "</td><td>" + rs.getString(6) + "</td></tr>");

                }
            } catch (Exception e) {
                out.print(e.toString());
            }
            out.print("</table>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
