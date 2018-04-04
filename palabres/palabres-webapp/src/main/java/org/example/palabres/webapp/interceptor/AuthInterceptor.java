package org.example.palabres.webapp.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * Interceptor permettant de vérifier que l'utilisateur est bien connecté
 */
public class AuthInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;

	@Override
	/**
	 * Vérifie que le parametre de session "user" n'est pas null et donc que l'utilisateur est connecté.
	 */
    public String intercept(ActionInvocation pInvocation) throws Exception {
        String vResult;
        if (pInvocation.getInvocationContext().getSession().get("user") != null) {
            vResult = pInvocation.invoke();
        } else {
            vResult = "error-forbidden";
        }
        return vResult;
    }
}
