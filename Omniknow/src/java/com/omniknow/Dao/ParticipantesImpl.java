package com.omniknow.Dao;

import com.omniknow.Conexion.Conexion;
import com.omniknow.Modelos.Participantes;
import com.omniknow.idao.IParticipantesDao;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public class ParticipantesImpl implements IParticipantesDao{

    final String REGISTRAR = "CALL REGISTRAR(?,?,?,?,?,?,?,?);";
    
    @Override
    public boolean Create(Participantes t) {
        Conexion con = new Conexion();
        try{
            CallableStatement cs = con.getConexion().prepareCall(REGISTRAR);
            cs.setString(1, t.getDP().getNombre());
            cs.setString(2, t.getDP().getApellidoPaterno());
            cs.setString(3, t.getDP().getApellidoMaterno());
            cs.setInt(4, t.getDP().getGrado());
            cs.setString(5, t.getDP().getCorreo());
            cs.setString(6, t.getE().getNombreEscuela());
            cs.setString(7, t.getA().getUsuario());
            cs.setString(8, t.getA().getContrasena());
            cs.execute();
            return true;
        }catch(SQLException e){
            System.out.println("Errro: " + e);
            return false;
        }
        
    }

    @Override
    public List<Participantes> Read() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Participantes Read(int k) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Update(Participantes t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Delete(int k) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
