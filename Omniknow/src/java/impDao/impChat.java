/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package impDao;

import Conexiones.Base;
import DAO.iChat;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import modelo.Mensaje;

/**
 *
 * @author Profesor
 */
public class impChat implements iChat
{
    Connection con;
    private final String sqlTRAE_CONVERSACION = "{CALL TRAE_CHAT(?,?)}";
    private final String sqlTRAE_MENSAJES = "{CALL TRAE_MENSAJES(?)}";
    private final String sqlCREAR_CHAT = "{CALL CREA_CHAT(?,?)}";
    private final String sqlAGREGAR_MSJ = "{CALL AGREGAR_MSJ(?,?,?,?,?)}";
    
    public impChat() 
    {
        Base base = new Base();
        con = base.getConnection();
    }
    
    @Override
    public int traeChat(int idEmisor, int idReceptor) 
    {
        CallableStatement cst;
        ResultSet res;
        int idConversacion = 0;
        try {
            cst = con.prepareCall(sqlTRAE_CONVERSACION);
            cst.setInt(1, idEmisor);
            cst.setInt(2, idReceptor);
            res = cst.executeQuery();
            res.next();
            idConversacion = res.getInt("ID_CHAT");

        } catch (Exception e) {
        }
        return idConversacion;
    }

    @Override
    public ArrayList<Mensaje> traeMensajes(int idConversacion) 
    {
        ArrayList<Mensaje> lista = new ArrayList();
        CallableStatement cst;
        ResultSet res;
        try {
            cst = con.prepareCall(sqlTRAE_MENSAJES);
            cst.setInt(1, idConversacion);
            res = cst.executeQuery();
            while (res.next()) 
            {                
                int idMsj = res.getInt("ID_MENSAJE");
                String contenido = res.getString("CONTENIDO");
                int idEmisor = res.getInt("ID_EMISOR");
                int idReceptor = res.getInt("ID_RECEPTOR");
                Date fecha = null;
                Mensaje msj = new Mensaje(idMsj, contenido, fecha, idEmisor, idReceptor,idConversacion);
                lista.add(msj);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    @Override
    public int crearChat(int idEmisor, int idReceptor) 
    {
        CallableStatement cs = null;
        ResultSet rs = null;
        int idConversacion = 0;
        try {
            cs = con.prepareCall(sqlCREAR_CHAT);
            cs.setInt(1, idEmisor);
            cs.setInt(2, idReceptor);
            rs = cs.executeQuery();
            if(rs.next())
                idConversacion = rs.getInt("ID_CONVERSACION");
        } catch (Exception e) {
        }
        return idConversacion;
    }

    @Override
    public void agregarMensaje(Mensaje msj) 
    {
        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = con.prepareCall(sqlAGREGAR_MSJ);
            cs.setInt(1, msj.getIdEmisor());
            cs.setInt(2, msj.getIdReceptor());
            cs.setInt(3, msj.getIdConversacion());
            cs.setString(4, msj.getContenido());
            cs.setString(5, null);
            cs.executeQuery();
        } catch (Exception e) {
        }
        
    }
    
}
