package com.omniknow.idao;

import com.omniknow.Modelos.Mensajes;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface IMensajesDao extends Plantilla<Mensajes>{

    @Override
    public boolean Create(Mensajes t);

    @Override
    public boolean Delete(int k);

    @Override
    public List<Mensajes> Read();

    @Override
    public Mensajes Read(int k);

    @Override
    public boolean Update(Mensajes t);
    
}
