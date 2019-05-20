package com.omniknow.Dao;

import com.omniknow.Conexion.Conexion;
import com.omniknow.Modelos.Accesos;
import com.omniknow.Modelos.Entrenadores;
import com.omniknow.idao.IEntrenadoresDao;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public class EntrenadoresImpl implements IEntrenadoresDao{
    
    final String LEER_ENTRENADOR = "SELECT * FROM INFOS_ENTRENADORES WHERE ID ID_ENTRENADOR = ?";
    final String CAMBIAR_ENTRENADOR ="CALL CAMBIAR_ENTRENADOR(?,?,?)";
    
    @Override
    public boolean Create(Entrenadores t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Entrenadores> Read() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Entrenadores Read(int k) {
        Conexion con =  new Conexion();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.getConexion().prepareStatement(LEER_ENTRENADOR);
            ps.setInt(1, k);
            rs = ps.executeQuery();
            if(rs.next()){
                Accesos acceso = new Accesos(rs.getInt("ID_ACCESO"), rs.getString("USUARIO"), rs.getString("CONTRASEÑA"));
                Entrenadores entrenador = new Entrenadores(rs.getInt("ID_ENTRENADOR"), acceso, rs.getString("CLAVE_MAESTRA"));
                return entrenador;
            }else
                return null;
        } catch (Exception e) {
            System.out.println("Error al leer los datos de la vista INFOS_ENTRENADORES: " + e.toString());
            return null;
        }
    }

    @Override
    public boolean Update(Entrenadores t) {
        Conexion con = new Conexion();
        try {
            CallableStatement cs = con.getConexion().prepareCall(CAMBIAR_ENTRENADOR);
            cs.setString(1, t.getAcceso().getUsuario());
            cs.setString(2, t.getAcceso().getContrasena());
            cs.setString(3, t.getClaveMaestra());
            cs.execute();
            return true;
        } catch (Exception e) {
            System.out.println("Error al actualizar los datos del entrenador: " + e.toString());
            return false;
        }finally{
            if(con != null)
                con.cerrar();
        }
    }

    @Override
    public boolean Delete(int k) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
