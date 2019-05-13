package com.omniknow.idao;

import com.omniknow.Modelos.CatalogosRevisadas;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface ICatalogosRespuestasDao extends Plantilla<CatalogosRevisadas>{

    @Override
    public List<CatalogosRevisadas> Read();

    @Override
    public boolean Update(CatalogosRevisadas t);

    @Override
    public CatalogosRevisadas Read(int k);

    @Override
    public boolean Delete(int k);

    @Override
    public boolean Create(CatalogosRevisadas t);

}
