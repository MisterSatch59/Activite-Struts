package org.example.palabres.webapp.action;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.example.palabres.model.bean.chat.Channel;
import org.example.palabres.model.exception.FunctionalException;
import org.example.palabres.model.exception.TechnicalException;
import org.example.palabres.webapp.WebappHelper;

import com.opensymphony.xwork2.ActionSupport;

public class ChannelAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
    // ==================== Attributs ====================
	// ----- Paramètres en entrée
	
	// ----- Eléments en entrée et sortie
	private String channelName;
		
    // ----- Eléments en sortie
	private List<Channel> listChannel;

    // ==================== Getters/Setters ====================

	public List<Channel> getListChannel() {
		return listChannel;
	}
	
	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	// ==================== Méthodes ====================
    public String doList() {
    	listChannel = WebappHelper.getManagerFactory().getChatManager().getListChannel();
        return ActionSupport.SUCCESS;
    }
    
    public String doCreate() {
		String vResult = ActionSupport.INPUT;
		if (!StringUtils.isEmpty(channelName)) {
			try {
				WebappHelper.getManagerFactory().getChatManager().addChannel(new Channel(channelName));
			} catch (FunctionalException e) {
				this.addActionError(getText("error.functional.create.channel"));
				vResult = ActionSupport.ERROR;
			} catch (TechnicalException e) {
				this.addActionError(getText("error.technical.create.channel"));
				vResult = ActionSupport.ERROR;
			}

			vResult = ActionSupport.SUCCESS;
		}
		return vResult;
	}
}
