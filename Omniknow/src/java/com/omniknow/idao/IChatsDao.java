package com.omniknow.idao;

import com.omniknow.Modelos.Chats;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface IChatsDao extends Plantilla<Chats>{

    @Override
    public boolean Create(Chats t);

    @Override
    public boolean Delete(int k);

    @Override
    public List<Chats> Read();

    @Override
    public Chats Read(int k);

    @Override
    public boolean Update(Chats t);
    
    
}
