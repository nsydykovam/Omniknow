package com.omniknow.idao;

import com.omniknow.Modelos.Problemas;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface IProblemasDao extends Plantilla<Problemas>{

    @Override
    public boolean Create(Problemas t);

    @Override
    public boolean Delete(int k);

    @Override
    public List<Problemas> Read();

    @Override
    public Problemas Read(int k);

    @Override
    public boolean Update(Problemas t);
    
}
