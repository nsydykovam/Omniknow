package com.omniknow.Modelos;

/**
 *
 * @author Perez Rosales
 */
public class Chats {
    public int idChat;
    public int idUser1;
    public int idUser2;

    public Chats() {
    }

    public Chats(int idChat, int idUser1, int idUser2) {
        this.idChat = idChat;
        this.idUser1 = idUser1;
        this.idUser2 = idUser2;
    }

    public int getIdChat() {
        return idChat;
    }

    public void setIdChat(int idChat) {
        this.idChat = idChat;
    }

    public int getIdUser1() {
        return idUser1;
    }

    public void setIdUser1(int idUser1) {
        this.idUser1 = idUser1;
    }

    public int getIdUser2() {
        return idUser2;
    }

    public void setIdUser2(int idUser2) {
        this.idUser2 = idUser2;
    }
    
    
    
}
