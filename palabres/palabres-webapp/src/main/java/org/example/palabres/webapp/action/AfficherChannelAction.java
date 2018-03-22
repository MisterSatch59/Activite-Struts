package org.example.palabres.webapp.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.example.palabres.model.bean.chat.Channel;
import org.example.palabres.model.bean.chat.Message;
import org.example.palabres.model.exception.NotFoundException;
import org.example.palabres.model.exception.TechnicalException;
import org.example.palabres.webapp.WebappHelper;

import com.opensymphony.xwork2.ActionSupport;

public class AfficherChannelAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;

	// ==================== Attributs ====================
	// ----- Eléments en entrée et sortie
	private String channelName;
	// ----- Eléments en sortie
	List<Message> listMessage;
	
	// ----- Eléments Struts
	private Map<String, Object> session;

	// ==================== Getters/Setters ====================

	@Override
	public void setSession(Map<String, Object> pSession) {
		this.session = pSession;
	}
	
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
			if(channelName!=null)
				this.session.put("actualChannelName",channelName);
			String name = (String) session.get("actualChannelName");
			Channel channel = WebappHelper.getManagerFactory().getChatManager().getChannel(name);
			listMessage = WebappHelper.getManagerFactory().getChatManager().getListNewMessage(channel, null);
		} catch (NotFoundException | TechnicalException e) {
			this.addActionError(e.getMessage());
			vResult = ActionSupport.ERROR;
		}
		return vResult;
	}



}
