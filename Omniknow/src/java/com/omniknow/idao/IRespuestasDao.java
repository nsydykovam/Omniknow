package com.omniknow.idao;

import com.omniknow.Modelos.Respuestas;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface IRespuestasDao extends Plantilla<Respuestas>{

    @Override
    public boolean Create(Respuestas t);

    @Override
    public boolean Delete(int k);

    @Override
    public List<Respuestas> Read();

    @Override
    public Respuestas Read(int k);

    @Override
    public boolean Update(Respuestas t);
    
}
