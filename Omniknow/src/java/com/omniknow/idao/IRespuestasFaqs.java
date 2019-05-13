package com.omniknow.idao;

import com.omniknow.Modelos.RespuestasFaqs;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface IRespuestasFaqs extends Plantilla<RespuestasFaqs>{

    @Override
    public boolean Create(RespuestasFaqs t);

    @Override
    public boolean Delete(int k);

    @Override
    public List<RespuestasFaqs> Read();

    @Override
    public RespuestasFaqs Read(int k);

    @Override
    public boolean Update(RespuestasFaqs t);
    
}
