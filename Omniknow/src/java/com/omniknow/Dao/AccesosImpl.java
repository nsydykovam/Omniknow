package com.omniknow.Dao;

import com.omniknow.Conexion.Conexion;
import com.omniknow.Modelos.Accesos;
import com.omniknow.idao.IAccesosDao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public class AccesosImpl implements IAccesosDao{

    final String LEER_ID = "SELECT * FROM ACCESOS WHERE ID_ACCESO = ?";
    
    @Override
    public boolean Create(Accesos t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Accesos> Read() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Accesos Read(int k) {
        Conexion con = new Conexion();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.getConexion().prepareStatement(LEER_ID);
            ps.setInt(1, k);
            rs = ps.executeQuery();
            if(rs.next()){
                Accesos acceso = new Accesos(rs.getInt("ID_ACCESO"), rs.getString("USUARIO"), rs.getString("CONTRASEÑA"));
                return acceso;
            }else
                return null;
        } catch (Exception e) {
            System.out.println("Error al leer de la tabla ACCESOS: " + e.toString());
            return null;
        }finally{
            if(con != null)con.cerrar();
        }
    }

    @Override
    public boolean Update(Accesos t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Delete(int k) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
