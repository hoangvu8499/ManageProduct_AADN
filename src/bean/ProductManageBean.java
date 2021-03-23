package bean;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.request.IHttpResponse;
import util.LinkHelper;

@ViewScoped
@ManagedBean(name = "productManageBean")
public class ProductManageBean {

	public void moveProductPage() throws java.io.IOException {
		String link = LinkHelper.getFullLinkBySignature("productManage()");
		redirect(link);
	}

	public void moveDeletedPage() throws java.io.IOException {
		String link = LinkHelper.getFullLinkBySignature("productDeleted()");
		redirect(link);
	}

	public void redirect(String uri) throws java.io.IOException {
		IHttpResponse httpResponse = (IHttpResponse) Ivy.response();
		httpResponse.sendRedirect(uri);
	}

}
