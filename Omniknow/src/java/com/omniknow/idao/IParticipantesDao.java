package com.omniknow.idao;

import com.omniknow.Modelos.Participantes;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface IParticipantesDao extends Plantilla<Participantes>{

    @Override
    public boolean Create(Participantes t);

    @Override
    public List<Participantes> Read();

    @Override
    public Participantes Read(int k);

    @Override
    public boolean Update(Participantes t);

    @Override
    public boolean Delete(int k);
    
}
