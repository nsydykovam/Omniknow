package com.omniknow.idao;

import com.omniknow.Modelos.Reportes;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface IReportesDao extends Plantilla<Reportes>{

    @Override
    public boolean Create(Reportes t);

    @Override
    public boolean Delete(int k);

    @Override
    public List<Reportes> Read();

    @Override
    public Reportes Read(int k);

    @Override
    public boolean Update(Reportes t);
    
}
