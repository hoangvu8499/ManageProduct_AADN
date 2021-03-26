[Ivy]
178594AE25EB9896 7.5.0 #module
>Proto >Proto Collection #zClass
Ps0 ProductDeletedProcess Big #zClass
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
>Proto Ps0 Ps0 ProductDeletedProcess #zField
Ps0 f0 guid 178594AE26DB7F54 #txt
Ps0 f0 method start() #txt
Ps0 f0 inParameterDecl '<> param;' #txt
Ps0 f0 outParameterDecl '<> result;' #txt
Ps0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
    </language>
</elementInfo>
' #txt
Ps0 f0 83 51 26 26 -16 15 #rect
Ps0 f0 @|UdInitIcon #fIcon
Ps0 f1 515 51 26 26 0 12 #rect
Ps0 f1 @|UdProcessEndIcon #fIcon
Ps0 f3 guid 178594AE27C4D5B9 #txt
Ps0 f3 actionTable 'out=in;
' #txt
Ps0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Ps0 f3 83 299 26 26 -15 15 #rect
Ps0 f3 @|UdEventIcon #fIcon
Ps0 f4 211 299 26 26 0 12 #rect
Ps0 f4 @|UdExitEndIcon #fIcon
Ps0 f5 109 312 211 312 #arcP
Ps0 f6 actionTable 'out=in;
' #txt
Ps0 f6 actionCode 'import dao.ProductDao;

ProductDao productDao = new dao.ProductDao();

in.listDeleted = productDao.getProductDeleted();' #txt
Ps0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>get list Deleted</name>
    </language>
</elementInfo>
' #txt
Ps0 f6 232 42 112 44 -41 -8 #rect
Ps0 f6 @|StepIcon #fIcon
Ps0 f7 109 64 232 64 #arcP
Ps0 f2 344 64 515 64 #arcP
Ps0 f8 guid 1785958FF1A37CD9 #txt
Ps0 f8 method revert(model.Product) #txt
Ps0 f8 inParameterDecl '<model.Product product> param;' #txt
Ps0 f8 inParameterMapAction 'out.product=param.product;
' #txt
Ps0 f8 outParameterDecl '<> result;' #txt
Ps0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>revert</name>
    </language>
</elementInfo>
' #txt
Ps0 f8 83 187 26 26 -25 15 #rect
Ps0 f8 @|UdMethodIcon #fIcon
Ps0 f9 actionTable 'out=in;
' #txt
Ps0 f9 actionCode 'import util.MessageUtil;
import javax.faces.context.FacesContext;
import dao.ProductDao;
import org.primefaces.context.RequestContext;
import javax.faces.context.FacesContext;
import dao.CategoryDao;
import model.Category;
import model.Product;
import javax.faces.application.FacesMessage;

ProductDao productDao = new dao.ProductDao();
if(productDao.checkExist(in.product)==false){
	FacesContext.getCurrentInstance().addMessage("form:messageCreate",
			new FacesMessage(FacesMessage.SEVERITY_ERROR, MessageUtil.MESSAGE_PRODUCT_EXISTS,
			MessageUtil.MESSAGE_PRODUCT_EXISTS));
}else{
	in.product.deleted = null;
	productDao.save(in.product);
	in.listDeleted = productDao.getProductDeleted();
}

' #txt
Ps0 f9 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Revert Product</name>
    </language>
</elementInfo>
' #txt
Ps0 f9 240 178 112 44 -40 -8 #rect
Ps0 f9 @|StepIcon #fIcon
Ps0 f10 515 187 26 26 0 12 #rect
Ps0 f10 @|UdProcessEndIcon #fIcon
Ps0 f11 109 200 240 200 #arcP
Ps0 f12 352 200 515 200 #arcP
>Proto Ps0 .type test.connection.ProductDeleted.ProductDeletedData #txt
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
