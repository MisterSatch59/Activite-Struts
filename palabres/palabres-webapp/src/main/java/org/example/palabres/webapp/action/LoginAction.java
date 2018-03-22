package org.example.palabres.webapp.action;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.SessionAware;
import org.example.palabres.model.bean.utilisateur.Utilisateur;
import org.example.palabres.model.exception.FunctionalException;
import org.example.palabres.model.exception.NotFoundException;
import org.example.palabres.webapp.WebappHelper;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Action de gestion de la connexion/déconnexion d'un utilisateur
 */
public class LoginAction extends ActionSupport implements SessionAware {

	private static final long serialVersionUID = 1L;

	// ==================== Attributs ====================
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
	 * Action permettant la connexion d'un utilisateur
	 * 
	 * @return input / success
	 */
	public String doLogin() {
		String vResult = ActionSupport.INPUT;
		if (!StringUtils.isEmpty(pseudo)) {
			try {
				WebappHelper.getManagerFactory().getUtilisateurManager().getUtilisateur(pseudo);
				this.addActionError(getText("error.pseudo"));
			} catch (NotFoundException pEx) {
				
				// Ajout de l'utilisateur
				Utilisateur pUtilisateur = new Utilisateur(pseudo);
				this.session.put("user", pUtilisateur);
				try {
					WebappHelper.getManagerFactory().getUtilisateurManager().addUtilisateur(pUtilisateur);
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
	 * Action de déconnexion d'un utilisateur
	 * 
	 * @return success
	 */
	public String doLogout() {
		Utilisateur pUtilisateur = (Utilisateur) this.session.get("user");
		WebappHelper.getManagerFactory().getUtilisateurManager().deleteUtilisateur(pUtilisateur);

		// Suppression de l'utilisateur en session
		this.session.remove("user");
		
		return ActionSupport.SUCCESS;
	}
}
