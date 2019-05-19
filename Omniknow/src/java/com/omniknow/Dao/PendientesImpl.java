package com.omniknow.Dao;

import com.omniknow.Conexion.Conexion;
import com.omniknow.Modelos.Pendientes;
import com.omniknow.idao.IPendientesDao;
import java.sql.CallableStatement;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public class PendientesImpl implements IPendientesDao{
//CREAR_PENDIENTE NOM, APE_P, APE_M, CORR
    String REGISTRAR_PENDIENTE = "CALL CREAR_PENDIENTE(?,?,?,?)";
    
    @Override
    public boolean Create(Pendientes t) {
        Conexion con = new Conexion();
        try {
            CallableStatement cs = con.getConexion().prepareCall(REGISTRAR_PENDIENTE);
            cs.setString(1, t.getDatoPersonal().getNombre());
            cs.setString(2, t.getDatoPersonal().getApellidoPaterno());
            cs.setString(3, t.getDatoPersonal().getApellidoMaterno());
            cs.setString(4, t.getDatoPersonal().getCorreo());
            cs.execute();
            return true;
        } catch (Exception e) {
            System.out.println("Error al crear_pendiente: " + e.toString());
            return false;
        }finally{
            if(con != null)con.cerrar();
        }
        
    }

    @Override
    public boolean Delete(int k) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Pendientes> Read() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Pendientes Read(int k) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean Update(Pendientes t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
