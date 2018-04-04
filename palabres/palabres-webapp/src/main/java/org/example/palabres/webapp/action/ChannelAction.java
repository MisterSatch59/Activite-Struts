package org.example.palabres.webapp.action;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.example.palabres.business.contract.ManagerFactory;
import org.example.palabres.model.bean.chat.Channel;
import org.example.palabres.model.exception.FunctionalException;
import org.example.palabres.model.exception.TechnicalException;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Classe action de gestion des channels (création et affichage liste)
 * 
 * @author Oltenos
 *
 */
public class ChannelAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
    // ==================== Attributs ====================
	
	@Inject
	private ManagerFactory managerFactory;
	
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
	/**
	 * Action permettant l'affichage de la list des channel
	 * @return SUCCESS
	 */
    public String doList() {
    	listChannel = managerFactory.getChatManager().getListChannel();
        return ActionSupport.SUCCESS;
    }
    
    /**
     * Action permettant la création d'un channel
     * @return INPUT si le parametre channelName est vide (ouverture de la page) / SUCCESS si un channelName est entré et qu'aucune erreur n'est rencontrée lors du traitement
     */
    public String doCreate() {
		String vResult = ActionSupport.INPUT;
		if (!StringUtils.isEmpty(channelName)) {
			try {
				managerFactory.getChatManager().addChannel(new Channel(channelName));
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
