package org.example.palabres.webapp.action;

import java.util.List;
import org.example.palabres.model.bean.chat.Channel;
import org.example.palabres.model.bean.chat.Message;
import org.example.palabres.model.exception.NotFoundException;
import org.example.palabres.model.exception.TechnicalException;
import org.example.palabres.webapp.WebappHelper;

import com.opensymphony.xwork2.ActionSupport;

public class AfficherChannelAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	// ==================== Attributs ====================
	// ----- Eléments en entrée et sortie
	private String channelName;
	// ----- Eléments en sortie
	List<Message> listMessage;
	


	// ==================== Getters/Setters ====================

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	
	public String getChannelName() {
		return channelName;
	}

	public List<Message> getListMessage() {
		return listMessage;
	}

	// ==================== Méthodes ====================
	
	public String doListMessage() {
		String vResult = ActionSupport.SUCCESS;
		try {

			Channel channel = WebappHelper.getManagerFactory().getChatManager().getChannel(channelName);
			listMessage = WebappHelper.getManagerFactory().getChatManager().getListNewMessage(channel, null);
		} catch (NotFoundException | TechnicalException e) {
			this.addActionError(e.getMessage());
			vResult = ActionSupport.ERROR;
		}
		return vResult;
	}



}
