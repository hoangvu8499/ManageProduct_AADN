[Ivy]
1783A99F78A8F9F2 7.5.0 #module
>Proto >Proto Collection #zClass
Ps0 ProductProcess Big #zClass
Ps0 RD #cInfo
Ps0 #process
Ps0 @TextInP .type .type #zField
Ps0 @TextInP .processKind .processKind #zField
Ps0 @TextInP .xml .xml #zField
Ps0 @TextInP .responsibility .responsibility #zField
Ps0 @UdInit f0 '' #zField
Ps0 @UdProcessEnd f1 '' #zField
Ps0 @UdEvent f3 '' #zField
Ps0 @UdExitEnd f4 '' #zField
Ps0 @PushWFArc f5 '' #zField
Ps0 @GridStep f6 '' #zField
Ps0 @PushWFArc f7 '' #zField
Ps0 @PushWFArc f2 '' #zField
Ps0 @UdMethod f8 '' #zField
Ps0 @GridStep f9 '' #zField
Ps0 @UdProcessEnd f10 '' #zField
Ps0 @PushWFArc f11 '' #zField
Ps0 @PushWFArc f12 '' #zField
Ps0 @GridStep f13 '' #zField
Ps0 @UdProcessEnd f14 '' #zField
Ps0 @UdMethod f15 '' #zField
Ps0 @PushWFArc f16 '' #zField
Ps0 @PushWFArc f17 '' #zField
Ps0 @GridStep f18 '' #zField
Ps0 @UdProcessEnd f19 '' #zField
Ps0 @UdMethod f20 '' #zField
Ps0 @PushWFArc f22 '' #zField
Ps0 @PushWFArc f23 '' #zField
>Proto Ps0 Ps0 ProductProcess #zField
Ps0 f0 guid 1783A99F78F5A223 #txt
Ps0 f0 method start() #txt
Ps0 f0 inParameterDecl '<> param;' #txt
Ps0 f0 outParameterDecl '<model.Product product> result;' #txt
Ps0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
    </language>
</elementInfo>
' #txt
Ps0 f0 43 67 26 26 -16 15 #rect
Ps0 f0 @|UdInitIcon #fIcon
Ps0 f1 411 67 26 26 0 12 #rect
Ps0 f1 @|UdProcessEndIcon #fIcon
Ps0 f3 guid 1783A99F7986C8B3 #txt
Ps0 f3 actionTable 'out=in;
' #txt
Ps0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Ps0 f3 43 507 26 26 -15 15 #rect
Ps0 f3 @|UdEventIcon #fIcon
Ps0 f4 411 507 26 26 0 12 #rect
Ps0 f4 @|UdExitEndIcon #fIcon
Ps0 f5 69 520 411 520 #arcP
Ps0 f6 actionTable 'out=in;
' #txt
Ps0 f6 actionCode 'import dao.CategoryDao;
import dao.ProductDao;
import model.Product;
out.product = new Product();
out.editProduct = new Product();
ProductDao productDao = new dao.ProductDao();
CategoryDao categoryDao = new dao.CategoryDao();
in.products = productDao.getAll();
in.categories = categoryDao.getAll();' #txt
Ps0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>getProduct</name>
    </language>
</elementInfo>
' #txt
Ps0 f6 176 58 112 44 -29 -8 #rect
Ps0 f6 @|StepIcon #fIcon
Ps0 f7 69 80 176 80 #arcP
Ps0 f2 288 80 411 80 #arcP
Ps0 f8 guid 1783ABDC7D13060F #txt
Ps0 f8 method save(model.Product) #txt
Ps0 f8 inParameterDecl '<model.Product product> param;' #txt
Ps0 f8 inParameterMapAction 'out.product=param.product;
' #txt
Ps0 f8 outParameterDecl '<> result;' #txt
Ps0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>save</name>
    </language>
</elementInfo>
' #txt
Ps0 f8 43 283 26 26 -25 15 #rect
Ps0 f8 @|UdMethodIcon #fIcon
Ps0 f9 actionTable 'out=in;
' #txt
Ps0 f9 actionCode 'import util.MessageUtil;
import org.primefaces.context.RequestContext;
import javax.faces.context.FacesContext;
import dao.CategoryDao;
import model.Category;
import dao.ProductDao;
import model.Product;
import javax.faces.application.FacesMessage;

CategoryDao categoryDao = new dao.CategoryDao();
ProductDao dao = new dao.ProductDao();

//Validation Product
if(in.product.name.isEmpty()){
    FacesContext.getCurrentInstance().addMessage("form:messageEdit",
			new FacesMessage(FacesMessage.SEVERITY_ERROR, MessageUtil.MESSAGE_PRODUCT_NAME_IS_NULL,
			MessageUtil.MESSAGE_PRODUCT_NAME_IS_NULL));
//  RequestContext.getCurrentInstance().execute("PF(''editDialog'').show()");

}else{
	
	if(dao.checkExist(in.product) == false){
		FacesContext.getCurrentInstance().addMessage("form:messageEdit",
			new FacesMessage(FacesMessage.SEVERITY_ERROR, MessageUtil.MESSAGE_PRODUCT_EXISTS,
			MessageUtil.MESSAGE_PRODUCT_EXISTS));
	}else{
		dao.save(in.product);
		out.product = new Product();
		
		in.products = dao.getAll();
		in.categories = categoryDao.getAll();
		RequestContext.getCurrentInstance().execute("PF(''editDialog'').hide()");
		RequestContext.getCurrentInstance().update("form");
	}
	
}' #txt
Ps0 f9 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Edit&#13;
</name>
    </language>
</elementInfo>
' #txt
Ps0 f9 184 274 112 44 -10 -16 #rect
Ps0 f9 @|StepIcon #fIcon
Ps0 f10 403 283 26 26 0 12 #rect
Ps0 f10 @|UdProcessEndIcon #fIcon
Ps0 f11 69 296 184 296 #arcP
Ps0 f12 296 296 403 296 #arcP
Ps0 f13 actionTable 'out=in;
' #txt
Ps0 f13 actionCode 'import model.Product;
import dao.CategoryDao;
import dao.ProductDao;

CategoryDao categoryDao = new dao.CategoryDao();

ProductDao dao = new dao.ProductDao();
in.product.deleted = new Date();
dao.save(in.product);
in.products = dao.getAll();
in.categories = categoryDao.getAll();
out.product = new Product();
' #txt
Ps0 f13 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>delete</name>
    </language>
</elementInfo>
' #txt
Ps0 f13 184 402 112 44 -17 -8 #rect
Ps0 f13 @|StepIcon #fIcon
Ps0 f14 403 411 26 26 0 12 #rect
Ps0 f14 @|UdProcessEndIcon #fIcon
Ps0 f15 guid 1783ACCAC40FC41F #txt
Ps0 f15 method delete(model.Product) #txt
Ps0 f15 inParameterDecl '<model.Product product> param;' #txt
Ps0 f15 inParameterMapAction 'out.product=param.product;
' #txt
Ps0 f15 outParameterDecl '<> result;' #txt
Ps0 f15 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>delete</name>
    </language>
</elementInfo>
' #txt
Ps0 f15 43 411 26 26 -25 15 #rect
Ps0 f15 @|UdMethodIcon #fIcon
Ps0 f16 69 424 184 424 #arcP
Ps0 f17 296 424 403 424 #arcP
Ps0 f18 actionTable 'out=in;
' #txt
Ps0 f18 actionCode 'import util.MessageUtil;
import org.primefaces.context.RequestContext;
import javax.faces.context.FacesContext;
import dao.CategoryDao;
import model.Category;
import dao.ProductDao;
import model.Product;
import javax.faces.application.FacesMessage;

CategoryDao categoryDao = new dao.CategoryDao();
ProductDao dao = new dao.ProductDao();

//Validation Product
if(in.product.name.isEmpty()){
	FacesContext.getCurrentInstance().addMessage("form:messageCreate",
			new FacesMessage(FacesMessage.SEVERITY_ERROR, MessageUtil.MESSAGE_PRODUCT_NAME_IS_NULL,
			MessageUtil.MESSAGE_PRODUCT_NAME_IS_NULL));
//  RequestContext.getCurrentInstance().execute("PF(''dlg'').show()");
}else{
	if(dao.checkExist(in.product) == false){
		FacesContext.getCurrentInstance().addMessage("form:messageCreate",
			new FacesMessage(FacesMessage.SEVERITY_ERROR, MessageUtil.MESSAGE_PRODUCT_EXISTS,
			MessageUtil.MESSAGE_PRODUCT_EXISTS));
	}else{
		dao.save(in.product);
		out.product = new Product();
		in.products = dao.getAll();
		in.categories = categoryDao.getAll();
		RequestContext.getCurrentInstance().execute("PF(''dlg'').hide()");
		RequestContext.getCurrentInstance().update("form");	
	}
	
}

//RequestContext.getCurrentInstance().execute("PF(''dlg'').hide()");
' #txt
Ps0 f18 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Create</name>
    </language>
</elementInfo>
' #txt
Ps0 f18 176 154 112 44 -18 -8 #rect
Ps0 f18 @|StepIcon #fIcon
Ps0 f19 419 163 26 26 0 12 #rect
Ps0 f19 @|UdProcessEndIcon #fIcon
Ps0 f20 guid 1783E5ABC5567A88 #txt
Ps0 f20 method createProduct(model.Product) #txt
Ps0 f20 inParameterDecl '<model.Product product> param;' #txt
Ps0 f20 inParameterMapAction 'out.product=param.product;
' #txt
Ps0 f20 outParameterDecl '<> result;' #txt
Ps0 f20 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>createProduct</name>
    </language>
</elementInfo>
' #txt
Ps0 f20 43 163 26 26 -25 15 #rect
Ps0 f20 @|UdMethodIcon #fIcon
Ps0 f22 288 176 419 176 #arcP
Ps0 f23 69 176 176 176 #arcP
>Proto Ps0 .type test.connection.Product.ProductData #txt
>Proto Ps0 .processKind HTML_DIALOG #txt
>Proto Ps0 -8 -8 16 16 16 26 #rect
>Proto Ps0 '' #fIcon
Ps0 f3 mainOut f5 tail #connect
Ps0 f5 head f4 mainIn #connect
Ps0 f0 mainOut f7 tail #connect
Ps0 f7 head f6 mainIn #connect
Ps0 f6 mainOut f2 tail #connect
Ps0 f2 head f1 mainIn #connect
Ps0 f8 mainOut f11 tail #connect
Ps0 f11 head f9 mainIn #connect
Ps0 f9 mainOut f12 tail #connect
Ps0 f12 head f10 mainIn #connect
Ps0 f15 mainOut f16 tail #connect
Ps0 f16 head f13 mainIn #connect
Ps0 f13 mainOut f17 tail #connect
Ps0 f17 head f14 mainIn #connect
Ps0 f18 mainOut f22 tail #connect
Ps0 f22 head f19 mainIn #connect
Ps0 f20 mainOut f23 tail #connect
Ps0 f23 head f18 mainIn #connect
