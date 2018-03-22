package org.example.palabres.model.exception;

/**
 * Classe d'exception levée quand une erreur fonctionnelle survient
 *
 * @author lgu
 */
public class FunctionalException extends Exception {

	private static final long serialVersionUID = 1L;


	/**
     * Constructeur.
     *
     * @param pMessage -
     */
    public FunctionalException(String pMessage) {
        super(pMessage);
    }


    /**
     * Constructeur.
     *
     * @param pMessage -
     * @param pCause -
     */
    public FunctionalException(String pMessage, Throwable pCause) {
        super(pMessage, pCause);
    }
}
