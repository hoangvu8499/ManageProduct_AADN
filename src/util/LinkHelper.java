package util;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;
import javax.servlet.http.HttpServletRequest;

import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.request.IHttpRequest;
import ch.ivyteam.ivy.security.SecurityManagerFactory;
import ch.ivyteam.ivy.workflow.IProcessStart;


/**
 * @author bolt, kta
 *
 */
/**
 * @author peter
 *
 */
@ManagedBean (name = "linkHelper")
@ApplicationScoped
public class LinkHelper {


	private static final Map<String, String> links = new LinkedHashMap<>();



	/**
	 * Returns full link using process start signature, e.g. myProcessStart()
	 * if there are process starts with same signature, it returns the first one
	 * Based on: http://answers.axonivy.com/questions/1061/get-link-to-process-of-another-project
	 * @param signature
	 * @param params - url parameters
	 * @return string with full link
	 */
	public static String getFullLinkBySignature(String signature, String... params) {
		String result = links.get(signature);
		if (result == null || result.isEmpty()){
			List<String> tmpLinks = getFullLinksBySignature(signature);
			if(!tmpLinks.isEmpty()) {
				if(tmpLinks.size() > 1) {
					Ivy.log().error("Multiple ({0}) Process Starts with signature {1} found", tmpLinks.size(), signature);
				}
				result = tmpLinks.get(0);
				links.put(signature, result);
			}
		}
		result = addParamsAtEndOfString(result, params);
		return result;
	}

	/**
	 * Get the full link to a start process matching the current signature and a pattern.
	 *
	 * @param signature
	 * @param pattern regular expression pattern, searched with {@link Matcher#find()}
	 * @return
	 */
	public static String getFullLinkBySignatureAndPattern(String signature, String pattern) {
		String result = null;
		Pattern p = Pattern.compile(pattern);
		List<String> fullLinks = getFullLinksBySignature(signature);

		for (String fullLink : fullLinks) {
			if(p.matcher(fullLink).find()) {
				result = fullLink;
			}
		}

		if(result == null) {
			Ivy.log().error("Could not find start link for signature {0} and pattern {1}", signature, pattern);
		}
		return result;
	}


	/**
	 * Get a list of full links to start processes matching the current signature.
	 *
	 * @param signature
	 * @return
	 */
	public static List<String> getFullLinksBySignature(String signature) {
		List<String> links = new ArrayList<>();
		try {
			SecurityManagerFactory.getSecurityManager().executeAsSystem(() -> {
				if (Ivy.request() instanceof IHttpRequest){
					HttpServletRequest httpReq = ((IHttpRequest)Ivy.request()).getHttpServletRequest();
					Set<IProcessStart> processStarts = Ivy.wf().findProcessStartsBySignature(signature);
					if(processStarts != null && !processStarts.isEmpty()) {
						for (IProcessStart processStart : processStarts) {
							String fullRequestPath = processStart.getFullRequestPath();
							links.add(httpReq.getContextPath() + "/pro/" + fullRequestPath);
						}
					} else {
						Ivy.log().error("Process Start with signature {0} not found ",signature);
					}
				}
				return links;
			});
		} catch (Exception e) {
			Ivy.log().error("Error while getFullLinkBySignature", e);
			return new ArrayList<>();
		}
		return links;
	}


	/**
	 * Add html params at end of string
	 * @param result
	 * @param params
	 * @return
	 */
	public static String addParamsAtEndOfString(String result,
			String... params) {
		String newResult = result;
		if(params!=null &&params.length>0 &&result!=null){
			String paramsStr = String.join("&", params);
			newResult = result + "?"+ paramsStr;
		}
		return newResult;
	}



}

