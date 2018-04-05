package org.example.palabres.webapp.action;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.struts2.interceptor.SessionAware;
import org.example.palabres.business.contract.ManagerFactory;
import org.example.palabres.model.bean.chat.Channel;
import org.example.palabres.model.bean.chat.Message;
import org.example.palabres.model.bean.utilisateur.Utilisateur;
import org.example.palabres.model.exception.FunctionalException;
import org.example.palabres.model.exception.NotFoundException;
import org.example.palabres.model.exception.TechnicalException;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * Classe action d'affichage de gestion du contenu d'un channel (affichage et ajout de message)
 * 
 * @author Oltenos
 *
 */
public class AfficherChannelAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = 1L;

	// ==================== Attributs ====================
	
	@Inject
	private ManagerFactory managerFactory;
	
	// ----- Eléments en entrée
	private int channelActualLengh;
	private String message;
	
	// ----- Eléments en entrée et sortie
	private String channelName;
	// ----- Eléments en sortie
	List<Message> listMessage;
	
	// ----- Eléments Struts
	private Map<String, Object> session;
	
	// ==================== Getters/Setters ====================

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}

	public void setChannelActualLengh(int channelActualLengh) {
		this.channelActualLengh = channelActualLengh;
	}

	public String getChannelName() {
		return channelName;
	}

	public List<Message> getListMessage() {
		return listMessage;
	}
	
	@Override
	public void setSession(Map<String, Object> pSession) {
		this.session = pSession;
	}

	// ==================== Méthodes ====================
	/**
	 * Non utilisée pour l'activité 2 car remplacé par action AJAX
	 * @return
	 */
	@Deprecated
	public String doListMessage() {
		String vResult = ActionSupport.SUCCESS;
		try {
			Channel channel = managerFactory.getChatManager().getChannel(channelName);
			listMessage = managerFactory.getChatManager().getListNewMessage(channel, null);
		} catch (NotFoundException | TechnicalException e) {
			this.addActionError(e.getMessage());
			vResult = ActionSupport.ERROR;
		}
		return vResult;
	}

	/**
	 * Action AJAX de mise à jour de la liste des messages
	 * @return SUCCESS si aucune ereur rencontrée lors du traitement
	 */
	public String doAjaxListMessage() {
		String vResult = ActionSupport.SUCCESS;
		try {
			Channel channel = managerFactory.getChatManager().getChannel(channelName);
			System.out.println("-----------------------------------------------------------channelActualLengh : "+channelActualLengh);
			listMessage = managerFactory.getChatManager().getListNewMessage(channel, channelActualLengh-1);
		} catch (NotFoundException | TechnicalException e) {
			this.addActionError(e.getMessage());
			vResult = ActionSupport.ERROR;
		}
		return vResult;
	}
	
	/**
	 * Action AJAX d'envoi d'un message
	 * @return SUCCESS si aucune erreur rencontrée lors du traitement
	 */
	public String doAjaxEnvoyerMessage() {
		String vResult = ActionSupport.SUCCESS;
		try {
			Channel channel;
			channel = managerFactory.getChatManager().getChannel(channelName);
			if (!message.isEmpty() && message != null) {
				Utilisateur pUtilisateur = (Utilisateur) this.session.get("user");
				Message m = new Message(pUtilisateur, message);
				managerFactory.getChatManager().addMessage(channel, m);
			}
			vResult = this.doAjaxListMessage();
		} catch (FunctionalException | NotFoundException | TechnicalException e) {
			this.addActionError(e.getMessage());
			vResult = ActionSupport.ERROR;
		}
		return vResult;
	}

}
