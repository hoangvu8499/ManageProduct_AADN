[Ivy]
17861C92CEAEE71D 7.5.0 #module
>Proto >Proto Collection #zClass
Ms0 MenuHeaderProcess Big #zClass
Ms0 RD #cInfo
Ms0 #process
Ms0 @TextInP .type .type #zField
Ms0 @TextInP .processKind .processKind #zField
Ms0 @TextInP .xml .xml #zField
Ms0 @TextInP .responsibility .responsibility #zField
Ms0 @UdInit f0 '' #zField
Ms0 @UdProcessEnd f1 '' #zField
Ms0 @UdEvent f3 '' #zField
Ms0 @UdExitEnd f4 '' #zField
Ms0 @PushWFArc f5 '' #zField
Ms0 @GridStep f6 '' #zField
Ms0 @UdMethod f7 '' #zField
Ms0 @UdProcessEnd f8 '' #zField
Ms0 @PushWFArc f9 '' #zField
Ms0 @PushWFArc f10 '' #zField
Ms0 @PushWFArc f2 '' #zField
Ms0 @UdMethod f11 '' #zField
Ms0 @GridStep f12 '' #zField
Ms0 @UdProcessEnd f13 '' #zField
Ms0 @PushWFArc f14 '' #zField
Ms0 @PushWFArc f15 '' #zField
Ms0 @UdMethod f16 '' #zField
Ms0 @GridStep f17 '' #zField
Ms0 @UdProcessEnd f18 '' #zField
Ms0 @PushWFArc f19 '' #zField
Ms0 @PushWFArc f20 '' #zField
>Proto Ms0 Ms0 MenuHeaderProcess #zField
Ms0 f0 guid 17861C92D21BDA9F #txt
Ms0 f0 method start() #txt
Ms0 f0 inParameterDecl '<> param;' #txt
Ms0 f0 outParameterDecl '<> result;' #txt
Ms0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
    </language>
</elementInfo>
' #txt
Ms0 f0 51 51 26 26 -16 15 #rect
Ms0 f0 @|UdInitIcon #fIcon
Ms0 f1 387 51 26 26 0 12 #rect
Ms0 f1 @|UdProcessEndIcon #fIcon
Ms0 f3 guid 17861C92D3710100 #txt
Ms0 f3 actionTable 'out=in;
' #txt
Ms0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Ms0 f3 51 507 26 26 -15 15 #rect
Ms0 f3 @|UdEventIcon #fIcon
Ms0 f4 387 507 26 26 0 12 #rect
Ms0 f4 @|UdExitEndIcon #fIcon
Ms0 f5 77 520 387 520 #arcP
Ms0 f6 actionTable 'out=in;
' #txt
Ms0 f6 actionCode 'import util.ReadNumber;
import javax.faces.context.FacesContext;
import bean.ProductManageBean;
import org.primefaces.context.RequestContext;
import ch.ivyteam.ivy.environment.Ivy;
import dao.CartDao;
import dao.OrderCartDao;
import model.Product;
import model.OrderCart;

ProductManageBean productManageBean = new ProductManageBean();
OrderCartDao orderCartDao = new dao.OrderCartDao();
CartDao cartDao = new dao.CartDao();

in.orderCart.amount+=1;
in.orderCart.total += in.orderCart.product.cost;
orderCartDao.save(in.orderCart);

in.orderCart.cart.totalMoney+= in.orderCart.product.cost;
in.orderCart.cart.stringTotalMoney = ReadNumber.numberToString(in.orderCart.cart.totalMoney.toString());
cartDao.save(in.orderCart.cart);
' #txt
Ms0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Amount plus</name>
    </language>
</elementInfo>
' #txt
Ms0 f6 192 146 112 44 -34 -8 #rect
Ms0 f6 @|StepIcon #fIcon
Ms0 f7 guid 178620327317A79C #txt
Ms0 f7 method plusProduct(model.OrderCart) #txt
Ms0 f7 inParameterDecl '<model.OrderCart orderCart> param;' #txt
Ms0 f7 inParameterMapAction 'out.orderCart=param.orderCart;
' #txt
Ms0 f7 outParameterDecl '<> result;' #txt
Ms0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>plusProduct(OrderCart)</name>
    </language>
</elementInfo>
' #txt
Ms0 f7 51 155 26 26 -64 24 #rect
Ms0 f7 @|UdMethodIcon #fIcon
Ms0 f8 387 155 26 26 0 12 #rect
Ms0 f8 @|UdProcessEndIcon #fIcon
Ms0 f9 77 168 192 168 #arcP
Ms0 f10 304 168 387 168 #arcP
Ms0 f2 77 64 387 64 #arcP
Ms0 f11 guid 17868CAB8AF9B650 #txt
Ms0 f11 method minusProduct(model.OrderCart) #txt
Ms0 f11 inParameterDecl '<model.OrderCart orderCart> param;' #txt
Ms0 f11 inParameterMapAction 'out.orderCart=param.orderCart;
' #txt
Ms0 f11 outParameterDecl '<> result;' #txt
Ms0 f11 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>minusProduct(OrderCart)</name>
    </language>
</elementInfo>
' #txt
Ms0 f11 51 267 26 26 -64 24 #rect
Ms0 f11 @|UdMethodIcon #fIcon
Ms0 f12 actionTable 'out=in;
' #txt
Ms0 f12 actionCode 'import util.MessageUtil;
import util.ReadNumber;
import javax.faces.context.FacesContext;
import bean.ProductManageBean;
import org.primefaces.context.RequestContext;
import ch.ivyteam.ivy.environment.Ivy;
import dao.CartDao;
import dao.OrderCartDao;
import model.Product;
import model.OrderCart;
import util.MessageUtil;
import javax.faces.context.FacesContext;
import javax.faces.application.FacesMessage;

ProductManageBean productManageBean = new ProductManageBean();
OrderCartDao orderCartDao = new dao.OrderCartDao();
CartDao cartDao = new dao.CartDao();

if(in.orderCart.amount-1 <= 0){
 FacesContext.getCurrentInstance().addMessage("",
			new FacesMessage(FacesMessage.SEVERITY_ERROR, MessageUtil.MESSAGE_AMOUNT_PRODUCT,
			MessageUtil.MESSAGE_AMOUNT_PRODUCT));
}else{
	in.orderCart.amount-=1;
	in.orderCart.total -= in.orderCart.product.cost;
	orderCartDao.save(in.orderCart);
	
	in.orderCart.cart.totalMoney-= in.orderCart.product.cost;
	in.orderCart.cart.stringTotalMoney = ReadNumber.numberToString(in.orderCart.cart.totalMoney.toString());
	cartDao.save(in.orderCart.cart);
}
' #txt
Ms0 f12 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Amount minus</name>
    </language>
</elementInfo>
' #txt
Ms0 f12 192 258 112 44 -40 -8 #rect
Ms0 f12 @|StepIcon #fIcon
Ms0 f13 387 267 26 26 0 12 #rect
Ms0 f13 @|UdProcessEndIcon #fIcon
Ms0 f14 304 280 387 280 #arcP
Ms0 f15 77 280 192 280 #arcP
Ms0 f16 guid 17868E3D425F46FB #txt
Ms0 f16 method deleteProduct(model.OrderCart) #txt
Ms0 f16 inParameterDecl '<model.OrderCart orderCart> param;' #txt
Ms0 f16 inParameterMapAction 'out.orderCart=param.orderCart;
' #txt
Ms0 f16 outParameterDecl '<> result;' #txt
Ms0 f16 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>deleteProduct</name>
    </language>
</elementInfo>
' #txt
Ms0 f16 51 371 26 26 -25 15 #rect
Ms0 f16 @|UdMethodIcon #fIcon
Ms0 f17 actionTable 'out=in;
' #txt
Ms0 f17 actionCode 'import model.OrderCart;
import dao.OrderCartDao;

OrderCartDao orderCartDao = new OrderCartDao();

orderCartDao.deleteOrderCart(in.orderCart.getId());' #txt
Ms0 f17 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Delete Product</name>
    </language>
</elementInfo>
' #txt
Ms0 f17 192 362 112 44 -40 -8 #rect
Ms0 f17 @|StepIcon #fIcon
Ms0 f18 387 371 26 26 0 12 #rect
Ms0 f18 @|UdProcessEndIcon #fIcon
Ms0 f19 77 384 192 384 #arcP
Ms0 f20 304 384 387 384 #arcP
>Proto Ms0 .type tes.connection.components.MenuHeader.MenuHeaderData #txt
>Proto Ms0 .processKind HTML_DIALOG #txt
>Proto Ms0 -8 -8 16 16 16 26 #rect
>Proto Ms0 '' #fIcon
Ms0 f3 mainOut f5 tail #connect
Ms0 f5 head f4 mainIn #connect
Ms0 f7 mainOut f9 tail #connect
Ms0 f9 head f6 mainIn #connect
Ms0 f6 mainOut f10 tail #connect
Ms0 f10 head f8 mainIn #connect
Ms0 f0 mainOut f2 tail #connect
Ms0 f2 head f1 mainIn #connect
Ms0 f11 mainOut f15 tail #connect
Ms0 f15 head f12 mainIn #connect
Ms0 f12 mainOut f14 tail #connect
Ms0 f14 head f13 mainIn #connect
Ms0 f16 mainOut f19 tail #connect
Ms0 f19 head f17 mainIn #connect
Ms0 f17 mainOut f20 tail #connect
Ms0 f20 head f18 mainIn #connect
