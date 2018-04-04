package org.example.palabres.webapp.action;

import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.SessionAware;
import org.example.palabres.business.contract.ManagerFactory;
import org.example.palabres.model.bean.utilisateur.Utilisateur;
import org.example.palabres.model.exception.FunctionalException;
import org.example.palabres.model.exception.NotFoundException;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Classe action de gestion de la connexion/déconnexion d'un utilisateur
 * 
 * @author Oltenos
 *
 */
public class LoginAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;

	// ==================== Attributs ====================
	
	@Inject
	private ManagerFactory managerFactory;
	
	// ----- Paramètres en entrée
	private String pseudo;

	// ----- Eléments Struts
	private Map<String, Object> session;

	// ==================== Getters/Setters ====================
	public String getPseudo() {
		return pseudo;
	}

	public void setPseudo(String pPseudo) {
		pseudo = pPseudo;
	}

	@Override
	public void setSession(Map<String, Object> pSession) {
		this.session = pSession;
	}

	// ==================== Méthodes ====================
	/**
	 * Action permettant la connexion de l'utilisateur
	 * 
	 * @return INPUT si le parametre pseudo est vide (ouverture de la page) / SUCCESS si un pseudo est entré et qu'aucune erreur n'est rencontrée lors du traitement
	 */
	public String doLogin() {
		String vResult = ActionSupport.INPUT;
		if (!StringUtils.isEmpty(pseudo)) {
			try {
				managerFactory.getUtilisateurManager().getUtilisateur(pseudo);
				this.addActionError(getText("error.pseudo"));
			} catch (NotFoundException pEx) {
				// Ajout de l'utilisateur
				Utilisateur pUtilisateur = new Utilisateur(pseudo);
				this.session.put("user", pUtilisateur);
				try {
					managerFactory.getUtilisateurManager().addUtilisateur(pUtilisateur);
				} catch (FunctionalException e) {
					this.addActionError(getText("error.functional.pseudo"));
					vResult = ActionSupport.ERROR;
				}
				vResult = ActionSupport.SUCCESS;
			}
		}
		return vResult;
	}

	/**
	 * Action de déconnexion de l'utilisateur
	 * 
	 * @return SUCCESS
	 */
	public String doLogout() {
		Utilisateur pUtilisateur = (Utilisateur) this.session.get("user");
		managerFactory.getUtilisateurManager().deleteUtilisateur(pUtilisateur);

		// Suppression de l'utilisateur en session
		this.session.remove("user");
		
		return ActionSupport.SUCCESS;
	}
}
