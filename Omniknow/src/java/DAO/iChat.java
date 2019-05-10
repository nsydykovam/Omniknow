/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;
import modelo.Mensaje;

/**
 *
 * @author Profesor
 */
public interface iChat 
{
    int traeChat(int idEmisor, int idReceptor);
    ArrayList<Mensaje> traeMensajes(int idConversacion);
    int crearChat(int idEmisor,int idReceptor);
    void agregarMensaje(Mensaje msj);
}
