package com.omniknow.idao;

import com.omniknow.Modelos.Faqs;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface IFaqsDao extends Plantilla<Faqs>{

    @Override
    public boolean Create(Faqs t);

    @Override
    public boolean Delete(int k);

    @Override
    public List<Faqs> Read();

    @Override
    public Faqs Read(int k);

    @Override
    public boolean Update(Faqs t);
    
}
