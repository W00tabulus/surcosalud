package controlador;

import static com.sun.xml.internal.ws.util.ASCIIUtility.copyStream;
import entidad.Doctor;
import entidad.Paciente;
import entidad.Recepcionista;
import entidad.ExamMedicos;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ModeloPaciente;
import model.ModeloRecepcionista;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.ModeloDoctor;
import model.ModeloExammedico;


@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

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
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String metodo = request.getParameter("metodo");
        
        if(metodo.equals("registrapaciente")){
            registrapaciente(request, response);
        }else if(metodo.equals("validarpaci")){
            validarpaci(request, response);
        }else if(metodo.equals("registradoctor")){
            registradoctor(request, response);
            request.getRequestDispatcher("IngresoDoctor.jsp").forward(request, response);
        }else if(metodo.equals("validardoctor")){
            validardoctor(request, response);
        }else if(metodo.equals("registrarecep")){
            registrarecep(request, response);
            request.getRequestDispatcher("IngresoRecep.jsp").forward(request, response);
        }else if(metodo.equals("validarrecep")){
            validarrecep(request, response);
        }else if(metodo.equals("busca")){
            buscadoc(request, response);
        }else if(metodo.equals("buscarpaciente")){
            buscarpaciente(request, response);
        }else if(metodo.equals("eliminarpaciente")){
            eliminarpaciente(request, response);
        }else if(metodo.equals("actualizarpaciente")){
            actualizarpaciente(request, response);
        }else if(metodo.equals("buscaeditperfilpaci")){
            buscaEdiPerfilPaci(request, response);
        }else if(metodo.equals("buscarpacienteExamMedico")){
            buscarpacienteExamMedico(request, response);
        }else if(metodo.equals("uploadexammedico")){
            uploadexammedico(request, response);
        }else if(metodo.equals("downloadexammedico")){
            downloadexammedico(request, response);
        }else if(metodo.equals("listaexammedico")){
            listaexammedico(request, response);
        }else if(metodo.equals("buscarperfilpaciente")){
            buscarperfilpaciente(request, response);
        }else if(metodo.equals("cerrarsesion")){
            cerrarsesion(request, response);
        }else if(metodo.equals("eliminarexammedico")){
            eliminarexammedico(request, response);
        }
    }
    
    protected void registrapaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Se obtiene los parametros
        String dnip = request.getParameter("dnip");
        String clavep = request.getParameter("contrasena");
        String nombrep = request.getParameter("nombrep");
        String apellidop = request.getParameter("apellidop");
        String telefonop = request.getParameter("telefonop");
        String direccionp = request.getParameter("direccionp");
        String fnacip = request.getParameter("fnacip");
        String sexop = request.getParameter("sexop");
        
        //Agregar Foto
        String relativeWebPath = "/Recursos/imagenespaciente";
        String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
        
        Part filePart = request.getPart("fotop");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        String newFile =new Date().getTime() + fileName.substring(fileName.lastIndexOf('.'), fileName.length());
        
        String outputPath=absoluteDiskPath + File.separator + newFile;
        InputStream inputStream = filePart.getInputStream();

        FileOutputStream out = new FileOutputStream(outputPath);
        copyStream (inputStream, out);
        out.close();
        
        //Se crea el objeto cliente
        Paciente a = new Paciente();
        a.setNrodocumpaciente(Integer.parseInt(dnip));
        a.setPasspaciente(clavep);
        a.setNompaciente(nombrep);
        a.setApepaciente(apellidop);
        a.setTelefpaciente(Integer.parseInt(telefonop));
        a.setDirecpaciente(direccionp);
        a.setFnacipaciente(fnacip);
        a.setSexopaciente(sexop);
        a.setFotopaciente(newFile);
        
        //Se inserta a la BD el cliente
        ModeloPaciente model = new ModeloPaciente();
        model.insertarPaciente(a);
        
        //Se lista todos los cliente
        //lista(request, response);
    }
    
    public static void copyStream(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[1024];
        int read;
        while ((read = in.read(buffer)) != -1) {
            out.write(buffer, 0, read);
        }
    }
    
    protected void validarpaci(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
            String usuariop;
            String clavep;
            Object validarpaci=null;
            boolean error =  false;
            ModeloPaciente model = new ModeloPaciente();
            
            usuariop=request.getParameter("usuariop");
            clavep=request.getParameter("clavep");
            validarpaci = model.validarpaciente(usuariop, clavep);
            request.setAttribute("logeado", validarpaci);
            if(validarpaci!=null){
                HttpSession session = request.getSession(true);
                session.setAttribute("idPro",validarpaci);
                
                request.getRequestDispatcher("/MenuPaciente.html").forward(request, response);
            }else{
                request.getRequestDispatcher("/LoginError.jsp").forward(request, response);
            }      
    }
    
    protected void registradoctor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Se obtiene los parametros
        String userdoctor = request.getParameter("userdoctor");
        String claved = request.getParameter("contrasena");
        String nombred = request.getParameter("nombred");
        String apellidod = request.getParameter("apellidod");
        String telefonod = request.getParameter("telefonod");
        String sexod = request.getParameter("sexod");
        
        //Agregar Foto
        String relativeWebPath = "/Recursos/imagenesdoctor";
        String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
        
        Part filePart = request.getPart("fotod");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        String newFile =new Date().getTime() + fileName.substring(fileName.lastIndexOf('.'), fileName.length());
        
        String outputPath=absoluteDiskPath + File.separator + newFile;
        InputStream inputStream = filePart.getInputStream();

        FileOutputStream out = new FileOutputStream(outputPath);
        copyStream (inputStream, out);
        out.close();
        
        //Se crea el objeto cliente
        Doctor a = new Doctor();
        a.setUserdoctor(userdoctor);
        a.setPassdoctor(claved);
        a.setNomdoctor(nombred);
        a.setApedoctor(apellidod);
        a.setTelefdoctor(Integer.parseInt(telefonod));
        a.setSexodoctor(sexod);
        a.setFotodoctor(newFile);
        
        //Se inserta a la BD el cliente
        ModeloDoctor model = new ModeloDoctor();
        model.insertarDoctor(a);
      
        //Se lista todos los cliente
        //lista(request, response);
        
    }
    
    protected void validardoctor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
            String usuariod;
            String claved;
            Object validardoctor=null;
            boolean error =  false;
            ModeloDoctor model = new ModeloDoctor();
            
            usuariod=request.getParameter("usuariod");
            claved=request.getParameter("claved");
            validardoctor = model.validardoctor(usuariod, claved);
            request.setAttribute("logeado", validardoctor);
            if(validardoctor!=null){
                HttpSession misession = request.getSession(true);
                misession.setAttribute("idDoc",usuariod);
                
                request.getRequestDispatcher("/MenuMedico.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("/LoginError.jsp").forward(request, response);
            }      
    }
    
    protected void registrarecep(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Se obtiene los parametros
        String userrecep = request.getParameter("userrecep");
        String claved = request.getParameter("contrasena");
        String nombrer = request.getParameter("nombrer");
        String apellidor = request.getParameter("apellidor");
        String telefonor = request.getParameter("telefonor");
        String sexor = request.getParameter("sexor");
        
        //Agregar Foto
        String relativeWebPath = "/Recursos/imagenesrecep";
        String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
        
        Part filePart = request.getPart("fotor");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        String newFile =new Date().getTime() + fileName.substring(fileName.lastIndexOf('.'), fileName.length());
        
        String outputPath=absoluteDiskPath + File.separator + newFile;
        InputStream inputStream = filePart.getInputStream();

        FileOutputStream out = new FileOutputStream(outputPath);
        copyStream (inputStream, out);
        out.close();
        
        //Se crea el objeto cliente
        Recepcionista a = new Recepcionista();
        a.setUserrecep(userrecep);
        a.setPassrecep(claved);
        a.setNomrecep(nombrer);
        a.setAperecep(apellidor);
        a.setTelefrecep(Integer.parseInt(telefonor));
        a.setSexorecep(sexor);
        a.setFotorecep(newFile);
        
        //Se inserta a la BD el cliente
        ModeloRecepcionista model = new ModeloRecepcionista();
        model.insertarRecep(a);
        
        //Se lista todos los cliente
        //lista(request, response);
    }
    
    protected void validarrecep(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
            String usuarior;
            String claver;
            Object validarrecep=null;
            boolean error =  false;
            ModeloRecepcionista model = new ModeloRecepcionista();
            
            usuarior=request.getParameter("usuarior");
            claver=request.getParameter("claver");
            validarrecep = model.validarrecep(usuarior, claver);
            request.setAttribute("logeado", validarrecep);
            if(validarrecep!=null){
                HttpSession session = request.getSession(true);
                session.setAttribute("idRec",usuarior);
                
                request.getRequestDispatcher("/MenuRecepcionista.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("/LoginError.jsp").forward(request, response);
            }      
    }
    
    protected void buscadoc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Se obtiene los parametos
        String id = request.getParameter("id");
        
        //Se inserta a la BD el alumno
        ModeloDoctor model = new ModeloDoctor();
        Doctor a = model.buscaDoctor(id);
        
        //Se almacena en memoria llamada request
        request.setAttribute("datadocbusq", a);
        
        //Se reenvia el request(con los datos) al jsp
        request.getRequestDispatcher("/MenuMedico.jsp").forward(request, response);
    }
    
    protected void buscarpaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Se obtiene los parametos
        String id = request.getParameter("valor");
        
        //Se inserta a la BD el alumno
        ModeloPaciente model = new ModeloPaciente();
        Paciente a = model.buscaPaciente(Integer.parseInt(id));
        
        //Se almacena en memoria llamada request
        request.setAttribute("data", a);
        
        //Se reenvia el request(con los datos) al jsp listaAlumno.jsp
        request.getRequestDispatcher("/BuscarPacientes.jsp").forward(request, response);
    }
    
    protected void eliminarpaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            //Se obtiene los parametros
            String id = request.getParameter("id");

            //Se inserta a la BD el alumno
            ModeloPaciente model = new ModeloPaciente();
            model.eliminapaciente(Integer.parseInt(id));

            //Se lista todos los alumnos
            request.getRequestDispatcher("/BuscarPacientes.jsp").forward(request, response);
            //lista(request, response);
    }
    
    protected void actualizarpaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Se obtiene los parametros
        String nombrep = request.getParameter("nombrep");
        String apellidop = request.getParameter("apellidop");
        int telefonop = Integer.parseInt(request.getParameter("telefonop"));
        String direccionp = request.getParameter("direccionp");       
        String nrodocumpaciente = request.getParameter("id");
        
        //Se crea el objeto alumnos
        Paciente a = new Paciente();
        a.setNrodocumpaciente(Integer.parseInt(nrodocumpaciente));
        a.setNompaciente(nombrep);
        a.setApepaciente(apellidop);
        a.setDirecpaciente(direccionp);
        a.setTelefpaciente(telefonop);
        
        //Se inserta a la BD el alumno
        ModeloPaciente model = new ModeloPaciente();
        model.actualizaPaciente(a);
        
        Object paciente = null;
        paciente = model.buscaPaciente(Integer.parseInt(nrodocumpaciente));   
        request.setAttribute("logeado", paciente);
        request.getRequestDispatcher("/BuscarPacientes.jsp").forward(request, response);
        
        //Se lista todos los alumnos
        //actualizapro(request, response);
        //request.getRequestDispatcher("/PerfilProfesor.jsp").forward(request, response);
    }
    
    protected void buscardoctor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Se obtiene los parametos
        String user = request.getParameter("valor");
        
        //Se inserta a la BD el alumno
        ModeloDoctor model = new ModeloDoctor();
        Doctor b = model.buscaDoctor(user);
        
        //Se almacena en memoria llamada request
        request.setAttribute("data", b);
        
        //Se reenvia el request(con los datos) al jsp listaAlumno.jsp
        request.getRequestDispatcher("/BuscarDoctores.jsp").forward(request, response);
    }
    
    protected void eliminardoctor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            //Se obtiene los parametros
            String user = request.getParameter("user");

            //Se inserta a la BD el alumno
            ModeloDoctor model = new ModeloDoctor();
            model.eliminardoctor(user);

            //Se lista todos los alumnos
            request.getRequestDispatcher("/BuscarDoctores.jsp").forward(request, response);
            //lista(request, response);
    }
    
    protected void actualizardoctor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Se obtiene los parametros
        String userdoctor = request.getParameter("userdoctor");
        String nombredoc = request.getParameter("nombredoc");
        String apellidodoc = request.getParameter("apellidodoc");
        int telefonop = Integer.parseInt(request.getParameter("telefonodoc"));
        String sexodoc = request.getParameter("sexodoc");       
        
        
        //Se crea el objeto alumnos
        Doctor b = new Doctor();
        b.setUserdoctor(userdoctor);
        b.setNomdoctor(nombredoc);
        b.setApedoctor(apellidodoc);
        b.setTelefdoctor(telefonop);
        b.setSexodoctor(sexodoc);
        
        //Se inserta a la BD el alumno
        ModeloDoctor model = new ModeloDoctor();
        model.actualizardoctor(b);
        
        Object doctor = null;
        doctor = model.buscardoctor(Integer.parseInt(userdoctor));   
        request.setAttribute("logeado", doctor);
        request.getRequestDispatcher("/BuscarDoctores.jsp").forward(request, response);
        
        //Se lista todos los alumnos
        //actualizapro(request, response);
        //request.getRequestDispatcher("/PerfilProfesor.jsp").forward(request, response);
    }
    
    protected void buscaEdiPerfilPaci(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Se obtiene los parametos
        String id = request.getParameter("id");
        
        //Se inserta a la BD el Cliente
        ModeloPaciente model = new ModeloPaciente();
        Paciente b = model.buscaPaciente(Integer.parseInt(id));
        
        //Se almacena en memoria llamada request
        request.setAttribute("dataclibusq", b);
        
        //Se reenvia el request(con los datos) al jsp
        request.getRequestDispatcher("/ActualizaPaciente.jsp").forward(request, response);
    }
    protected void buscaEdiPerfilDoc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Se obtiene los parametos
        String user = request.getParameter("user");
        
        //Se inserta a la BD el Cliente
        ModeloDoctor model = new ModeloDoctor();
        Doctor a = model.buscaDoctor(user);
        
        //Se almacena en memoria llamada request
        request.setAttribute("dataclibusq", a);
        
        //Se reenvia el request(con los datos) al jsp
        request.getRequestDispatcher("/ActualizaDoctor.jsp").forward(request, response);
    }
    protected void uploadexammedico(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Se obtiene los parametros
        String textexamen = request.getParameter("textexamen");
        String fechaexam = request.getParameter("fechaexam");
        String dnip = request.getParameter("dnip");
        String userdoctor = request.getParameter("userdoctor");
        
        //Agregar Foto
        String relativeWebPath = "/Recursos/examenesmedicos";
        String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
        
        Part filePart = request.getPart("fotoexam");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        String newFile =new Date().getTime() + fileName.substring(fileName.lastIndexOf('.'), fileName.length());
        
        String outputPath=absoluteDiskPath + File.separator + newFile;
        InputStream inputStream = filePart.getInputStream();

        FileOutputStream out = new FileOutputStream(outputPath);
        copyStream (inputStream, out);
        out.close();
        
        //Se crea el objeto cliente
        ExamMedicos a = new ExamMedicos();
        Paciente b = new Paciente();
        Doctor c = new Doctor();
        a.setDescexam(textexamen);
        a.setFechaexam(fechaexam);
        a.setFotoexam(newFile);
        b.setNrodocumpaciente(Integer.parseInt(dnip));
        c.setUserdoctor(userdoctor);
        
        //Se inserta a la BD el cliente
        ModeloExammedico model = new ModeloExammedico();
        model.insertarExamMedico(a, b, c);
        
        //Se lista todos los cliente
        //lista(request, response);
    request.getRequestDispatcher("/ExamenesMedicos.jsp").forward(request, response);
    }
    protected void buscarpacienteExamMedico(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Se obtiene los parametos
        String id = request.getParameter("valor");
        
        //Se inserta a la BD el alumno
        ModeloPaciente model = new ModeloPaciente();
        Paciente a = model.buscaPaciente(Integer.parseInt(id));
        
        //Se almacena en memoria llamada request
        request.setAttribute("data", a);
        
        //Se reenvia el request(con los datos) al jsp listaAlumno.jsp
        request.getRequestDispatcher("/ExamenesMedicos.jsp").forward(request, response);
    }
    
    protected void downloadexammedico(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Se obtiene los parametos
       String id = request.getParameter("valor");
       Paciente p=null;
       String dni = "";
       
       HttpSession session = request.getSession(true);
       p=(Paciente)session.getAttribute("idPro");
       dni=String.valueOf(p.getNrodocumpaciente());
       
       //Se inserta a la BD el alumno
       ModeloExammedico model = new ModeloExammedico();
       List<ExamMedicos> a = model.descargarExamMedico(id,dni);
       
       //Se almacena en memoria llamada request
       request.setAttribute("data", a);
       
       //Se reenvia el request(con los datos) al jsp listaAlumno.jsp
       request.getRequestDispatcher("/VerExamenesMedicos.jsp").forward(request, response);
   }
    
    protected void listaexammedico(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
       Paciente p = null;
       String dni = "";
       HttpSession session = request.getSession(true);
       p=(Paciente)session.getAttribute("idPro");
       dni=String.valueOf(p.getNrodocumpaciente());
       
       ModeloExammedico model = new ModeloExammedico();
       List<ExamMedicos> data = model.listaExamMedico(dni);
       
       //Se almacena en memoria llamada request
       request.setAttribute("data",data);
       
       //Se reenvia el request (con los datos) al jsp
       request.getRequestDispatcher("/listaExamMedico.jsp").forward(request, response);
    }
    
    protected void buscarperfilpaciente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Se obtiene los parametos
        String id = request.getParameter("id");
        
        //Se inserta a la BD el alumno
        ModeloPaciente model = new ModeloPaciente();
        Paciente a = model.buscaPaciente(Integer.parseInt(id));
        
        //Se almacena en memoria llamada request
        request.setAttribute("data", a);
        
        //Se reenvia el request(con los datos) al jsp listaAlumno.jsp
        request.getRequestDispatcher("/Perfilpaciente.jsp").forward(request, response);
    }
    
    protected void cerrarsesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
            HttpSession session = request.getSession();
            session.removeAttribute("usuariop");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
    protected void eliminarexammedico(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            //Se obtiene los parametros
            String id = request.getParameter("id");

            //Se inserta a la BD el alumno
            ModeloExammedico model = new ModeloExammedico();
            model.eliminaexammedico(Integer.parseInt(id));

            //Se lista todos los alumnos
            request.getRequestDispatcher("/VerExamenesMedicos.jsp").forward(request, response);
            //lista(request, response);
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
