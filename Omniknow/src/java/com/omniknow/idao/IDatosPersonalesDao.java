package com.omniknow.idao;

import com.omniknow.Modelos.DatosPersonales;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface IDatosPersonalesDao extends Plantilla<DatosPersonales>{

    @Override
    public boolean Create(DatosPersonales t);

    @Override
    public List<DatosPersonales> Read();

    @Override
    public DatosPersonales Read(int k);

    @Override
    public boolean Update(DatosPersonales t);

    @Override
    public boolean Delete(int k);
    
}
