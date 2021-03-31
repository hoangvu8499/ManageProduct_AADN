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
Ps0 @UdEvent f21 '' #zField
Ps0 @GridStep f24 '' #zField
Ps0 @PushWFArc f25 '' #zField
Ps0 @UdProcessEnd f26 '' #zField
Ps0 @PushWFArc f27 '' #zField
Ps0 @UdMethod f28 '' #zField
Ps0 @GridStep f29 '' #zField
Ps0 @PushWFArc f30 '' #zField
Ps0 @UdProcessEnd f31 '' #zField
Ps0 @PushWFArc f32 '' #zField
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
Ps0 f0 99 67 26 26 -16 15 #rect
Ps0 f0 @|UdInitIcon #fIcon
Ps0 f1 459 67 26 26 0 12 #rect
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
Ps0 f3 99 507 26 26 -15 15 #rect
Ps0 f3 @|UdEventIcon #fIcon
Ps0 f4 459 507 26 26 0 12 #rect
Ps0 f4 @|UdExitEndIcon #fIcon
Ps0 f5 125 520 459 520 #arcP
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
in.categories = categoryDao.getAll();
' #txt
Ps0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>getProduct</name>
    </language>
</elementInfo>
' #txt
Ps0 f6 232 58 112 44 -29 -8 #rect
Ps0 f6 @|StepIcon #fIcon
Ps0 f7 125 80 232 80 #arcP
Ps0 f2 344 80 459 80 #arcP
Ps0 f8 guid 1783ABDC7D13060F #txt
Ps0 f8 method save(model.Product) #txt
Ps0 f8 inParameterDecl '<model.Product product> param;' #txt
Ps0 f8 inParameterMapAction 'out.editProduct=param.product;
' #txt
Ps0 f8 outParameterDecl '<> result;' #txt
Ps0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>save</name>
    </language>
</elementInfo>
' #txt
Ps0 f8 99 283 26 26 -25 15 #rect
Ps0 f8 @|UdMethodIcon #fIcon
Ps0 f9 actionTable 'out=in;
' #txt
Ps0 f9 actionCode 'import ch.ivyteam.ivy.environment.Ivy;
import util.MessageUtil;
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
if(in.editProduct.name.isEmpty()){
    FacesContext.getCurrentInstance().addMessage("form:messageEdit",
			new FacesMessage(FacesMessage.SEVERITY_ERROR, MessageUtil.MESSAGE_PRODUCT_NAME_IS_NULL,
			MessageUtil.MESSAGE_PRODUCT_NAME_IS_NULL));
}else{
	if(dao.checkExist(in.editProduct) == false){
		FacesContext.getCurrentInstance().addMessage("form:messageEdit",
			new FacesMessage(FacesMessage.SEVERITY_ERROR, MessageUtil.MESSAGE_PRODUCT_EXISTS,
			MessageUtil.MESSAGE_PRODUCT_EXISTS));
	}else{
		if(in.product.image !=null){
			in.editProduct.image = in.product.image;
		}
		dao.save(in.editProduct);
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
Ps0 f9 240 274 112 44 -10 -16 #rect
Ps0 f9 @|StepIcon #fIcon
Ps0 f10 459 283 26 26 0 12 #rect
Ps0 f10 @|UdProcessEndIcon #fIcon
Ps0 f11 125 296 240 296 #arcP
Ps0 f12 352 296 459 296 #arcP
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
Ps0 f13 240 402 112 44 -17 -8 #rect
Ps0 f13 @|StepIcon #fIcon
Ps0 f14 459 411 26 26 0 12 #rect
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
Ps0 f15 99 411 26 26 -25 15 #rect
Ps0 f15 @|UdMethodIcon #fIcon
Ps0 f16 125 424 240 424 #arcP
Ps0 f17 352 424 459 424 #arcP
Ps0 f21 guid 1787D166D0150ECB #txt
Ps0 f21 actionTable 'out=in;
' #txt
Ps0 f21 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>createProductNew</name>
    </language>
</elementInfo>
' #txt
Ps0 f21 99 171 26 26 -14 15 #rect
Ps0 f21 @|UdEventIcon #fIcon
Ps0 f24 actionTable 'out=in;
' #txt
Ps0 f24 actionCode 'import ch.ivyteam.ivy.environment.Ivy;
import util.MessageUtil;
import org.primefaces.context.RequestContext;
import javax.faces.context.FacesContext;
import dao.CategoryDao;
import model.Category;
import dao.ProductDao;
import model.Product;
import javax.faces.application.FacesMessage;

import java.io.InputStream;
import org.primefaces.model.UploadedFile;
import ch.ivyteam.ivy.cm.CoType;
import ch.ivyteam.ivy.cm.IContentObject;
import ch.ivyteam.ivy.cm.IContentObjectValue;

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
Ps0 f24 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>create</name>
    </language>
</elementInfo>
' #txt
Ps0 f24 240 162 112 44 -17 -8 #rect
Ps0 f24 @|StepIcon #fIcon
Ps0 f25 125 184 240 184 #arcP
Ps0 f26 459 171 26 26 0 12 #rect
Ps0 f26 @|UdProcessEndIcon #fIcon
Ps0 f27 352 184 459 184 #arcP
Ps0 f28 guid 1787D19529E26224 #txt
Ps0 f28 method handleFileUpload(org.primefaces.event.FileUploadEvent) #txt
Ps0 f28 inParameterDecl '<org.primefaces.event.FileUploadEvent event> param;' #txt
Ps0 f28 inParameterMapAction 'out.eventImage=param.event;
' #txt
Ps0 f28 outParameterDecl '<> result;' #txt
Ps0 f28 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>handleFileUpload(FileUploadEvent)</name>
    </language>
</elementInfo>
' #txt
Ps0 f28 99 619 26 26 -42 36 #rect
Ps0 f28 @|UdMethodIcon #fIcon
Ps0 f29 actionTable 'out=in;
' #txt
Ps0 f29 actionCode 'import util.UploadFileManager;
import ch.ivyteam.ivy.environment.Ivy;
import java.io.InputStream;
import org.primefaces.model.UploadedFile;
import ch.ivyteam.ivy.cm.CoType;
import ch.ivyteam.ivy.cm.IContentObject;
import ch.ivyteam.ivy.cm.IContentObjectValue;

UploadedFile uploadedFile = in.eventImage.getFile();

UploadFileManager ufManager = new UploadFileManager();
out.product.image = ufManager.uploadFile(uploadedFile);

' #txt
Ps0 f29 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>load file</name>
    </language>
</elementInfo>
' #txt
Ps0 f29 240 610 112 44 -21 -8 #rect
Ps0 f29 @|StepIcon #fIcon
Ps0 f30 125 632 240 632 #arcP
Ps0 f31 459 619 26 26 0 12 #rect
Ps0 f31 @|UdProcessEndIcon #fIcon
Ps0 f32 352 632 459 632 #arcP
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
Ps0 f21 mainOut f25 tail #connect
Ps0 f25 head f24 mainIn #connect
Ps0 f24 mainOut f27 tail #connect
Ps0 f27 head f26 mainIn #connect
Ps0 f28 mainOut f30 tail #connect
Ps0 f30 head f29 mainIn #connect
Ps0 f29 mainOut f32 tail #connect
Ps0 f32 head f31 mainIn #connect
