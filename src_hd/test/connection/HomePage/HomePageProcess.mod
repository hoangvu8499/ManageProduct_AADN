[Ivy]
1785D0646492896A 7.5.0 #module
>Proto >Proto Collection #zClass
Hs0 HomePageProcess Big #zClass
Hs0 RD #cInfo
Hs0 #process
Hs0 @TextInP .type .type #zField
Hs0 @TextInP .processKind .processKind #zField
Hs0 @TextInP .xml .xml #zField
Hs0 @TextInP .responsibility .responsibility #zField
Hs0 @UdInit f0 '' #zField
Hs0 @UdProcessEnd f1 '' #zField
Hs0 @UdEvent f3 '' #zField
Hs0 @UdExitEnd f4 '' #zField
Hs0 @PushWFArc f5 '' #zField
Hs0 @GridStep f6 '' #zField
Hs0 @PushWFArc f7 '' #zField
Hs0 @PushWFArc f2 '' #zField
Hs0 @UdMethod f8 '' #zField
Hs0 @GridStep f9 '' #zField
Hs0 @UdProcessEnd f10 '' #zField
Hs0 @PushWFArc f11 '' #zField
Hs0 @PushWFArc f12 '' #zField
>Proto Hs0 Hs0 HomePageProcess #zField
Hs0 f0 guid 1785D064653CD8C8 #txt
Hs0 f0 method start() #txt
Hs0 f0 inParameterDecl '<> param;' #txt
Hs0 f0 outParameterDecl '<> result;' #txt
Hs0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start()</name>
    </language>
</elementInfo>
' #txt
Hs0 f0 83 51 26 26 -16 15 #rect
Hs0 f0 @|UdInitIcon #fIcon
Hs0 f1 523 51 26 26 0 12 #rect
Hs0 f1 @|UdProcessEndIcon #fIcon
Hs0 f3 guid 1785D06465FCE978 #txt
Hs0 f3 actionTable 'out=in;
' #txt
Hs0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Hs0 f3 83 363 26 26 -15 15 #rect
Hs0 f3 @|UdEventIcon #fIcon
Hs0 f4 219 363 26 26 0 12 #rect
Hs0 f4 @|UdExitEndIcon #fIcon
Hs0 f5 109 376 219 376 #arcP
Hs0 f6 actionTable 'out=in;
' #txt
Hs0 f6 actionCode 'import dao.CartDao;
import model.UserEntity;
import dao.UserDao;
import dao.CategoryDao;
import dao.ProductDao;
import model.Product;

UserDao userDao = new dao.UserDao();
ProductDao productDao = new dao.ProductDao();
CategoryDao categoryDao = new dao.CategoryDao();
CartDao cartDao = new dao.CartDao();

in.listProduct = productDao.getNewProduct();
in.listCategory = categoryDao.getAll();
// dang mac dinh user login co id = 1;
UserEntity userLogin = userDao.findById(1);
in.cart = cartDao.getNewCart(userLogin.id);' #txt
Hs0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>get data</name>
    </language>
</elementInfo>
' #txt
Hs0 f6 168 42 112 44 -22 -8 #rect
Hs0 f6 @|StepIcon #fIcon
Hs0 f7 109 64 168 64 #arcP
Hs0 f2 280 64 523 64 #arcP
Hs0 f8 guid 17861D135FF6C2C3 #txt
Hs0 f8 method AddToCart(model.Product) #txt
Hs0 f8 inParameterDecl '<model.Product product> param;' #txt
Hs0 f8 inParameterMapAction 'out.productAddCart=param.product;
' #txt
Hs0 f8 outParameterDecl '<> result;' #txt
Hs0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>AddToCart</name>
    </language>
</elementInfo>
' #txt
Hs0 f8 83 179 26 26 -25 15 #rect
Hs0 f8 @|UdMethodIcon #fIcon
Hs0 f9 actionTable 'out=in;
' #txt
Hs0 f9 actionCode 'import bean.ProductManageBean;
import org.primefaces.context.RequestContext;
import ch.ivyteam.ivy.environment.Ivy;
import dao.CartDao;
import dao.OrderCartDao;
import model.Product;
import model.OrderCart;

ProductManageBean productManageBean = new ProductManageBean();
OrderCartDao orderCartDao = new dao.OrderCartDao();
CartDao cartDao = new dao.CartDao();

OrderCart orderCart = orderCartDao.findByIdProductAndIdCart(in.productAddCart.id, in.cart.id);


if(orderCart.id==0){
	orderCart = new model.OrderCart(in.productAddCart,in.cart);
	orderCart.amount = 1;
	orderCart.total = orderCart.amount * orderCart.product.cost;
}else{
	orderCart.amount += 1;
	orderCart.total = orderCart.amount * orderCart.product.cost;
}
orderCartDao.save(orderCart);
in.cart = cartDao.getNewCart(in.cart.user.id);

//productManageBean.moveHomePage();

//	Ivy.log().error("So Luong SP DA Them: "+orderCart.product.name);
//in.cart.orderCartList.add(orderCart);' #txt
Hs0 f9 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>AddToCart</name>
    </language>
</elementInfo>
' #txt
Hs0 f9 200 170 112 44 -29 -8 #rect
Hs0 f9 @|StepIcon #fIcon
Hs0 f10 531 179 26 26 0 12 #rect
Hs0 f10 @|UdProcessEndIcon #fIcon
Hs0 f11 109 192 200 192 #arcP
Hs0 f12 312 192 531 192 #arcP
>Proto Hs0 .type test.connection.HomePage.HomePageData #txt
>Proto Hs0 .processKind HTML_DIALOG #txt
>Proto Hs0 -8 -8 16 16 16 26 #rect
>Proto Hs0 '' #fIcon
Hs0 f3 mainOut f5 tail #connect
Hs0 f5 head f4 mainIn #connect
Hs0 f0 mainOut f7 tail #connect
Hs0 f7 head f6 mainIn #connect
Hs0 f6 mainOut f2 tail #connect
Hs0 f2 head f1 mainIn #connect
Hs0 f8 mainOut f11 tail #connect
Hs0 f11 head f9 mainIn #connect
Hs0 f9 mainOut f12 tail #connect
Hs0 f12 head f10 mainIn #connect
