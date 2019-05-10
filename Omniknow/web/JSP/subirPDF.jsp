<%--ESTA PÁGINA DURA UN SEGUNDO--%>
<%@page import="clave.claveSQL"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subiendo PDF</title>
    </head>
    <body>
        <%
                            DiskFileItemFactory factory = new DiskFileItemFactory();
                            
                            String url = claveSQL.urlpdf;
                            String nombreArchivo = "";
                            factory.setSizeThreshold(1024);
                            factory.setRepository(new File(url));

                            ServletFileUpload upload = new ServletFileUpload(factory);

                            try {
                                List<FileItem> partes = upload.parseRequest(request);

                                for (FileItem items : partes) {

                                    File file = new File(url, items.getName().replaceAll("'", ""));
                                    items.write(file);
                                    nombreArchivo = (String) items.getName().replaceAll("'", "");

                                }
                            } catch (Exception e) {
                                out.print(e.toString());
                            }
        %>
    </body>
</html>
