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
Hs0 @UdMethod f13 '' #zField
Hs0 @GridStep f15 '' #zField
Hs0 @PushWFArc f16 '' #zField
Hs0 @UdProcessEnd f14 '' #zField
Hs0 @PushWFArc f17 '' #zField
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
Hs0 f1 435 51 26 26 0 12 #rect
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
Hs0 f3 83 435 26 26 -15 15 #rect
Hs0 f3 @|UdEventIcon #fIcon
Hs0 f4 395 435 26 26 0 12 #rect
Hs0 f4 @|UdExitEndIcon #fIcon
Hs0 f5 109 448 395 448 #arcP
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
Hs0 f6 224 42 112 44 -22 -8 #rect
Hs0 f6 @|StepIcon #fIcon
Hs0 f7 109 64 224 64 #arcP
Hs0 f2 336 64 435 64 #arcP
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
Hs0 f9 actionCode 'import util.ReadNumber;
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

OrderCart orderCart = orderCartDao.findByIdProductAndIdCart(in.productAddCart.id, in.cart.id);


if(orderCart.id==0){
	orderCart = new model.OrderCart(in.productAddCart,in.cart);
	orderCart.amount = 1;
	orderCart.total = orderCart.amount * orderCart.product.cost;
}else{
	Ivy.log().error("So Luong SP DA Them: "+orderCart.amount);
	orderCart.amount += 1;
	Ivy.log().error("So Luong SP DA Them: "+orderCart.amount);
	
	orderCart.total = orderCart.amount * orderCart.product.cost;
}
in.cart.totalMoney=in.productAddCart.cost;
for(OrderCart element: in.cart.orderCartList){
	in.cart.totalMoney += element.total;
}
orderCartDao.save(orderCart);
in.cart.stringTotalMoney = ReadNumber.numberToString(in.cart.totalMoney.toString());
cartDao.save(in.cart);
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
Hs0 f9 224 170 112 44 -29 -8 #rect
Hs0 f9 @|StepIcon #fIcon
Hs0 f10 435 179 26 26 0 12 #rect
Hs0 f10 @|UdProcessEndIcon #fIcon
Hs0 f11 109 192 224 192 #arcP
Hs0 f12 336 192 435 192 #arcP
Hs0 f13 guid 1786C9DDB6EBD432 #txt
Hs0 f13 method getDataCategory(javax.faces.event.ActionEvent) #txt
Hs0 f13 inParameterDecl '<javax.faces.event.ActionEvent getIdCategory> param;' #txt
Hs0 f13 inActionCode 'import ch.ivyteam.ivy.environment.Ivy;
Long selectedCategoryId = 
param.getIdCategory.getComponent().getAttributes().get("idCategory") as Long;
out.category.id = selectedCategoryId;
' #txt
Hs0 f13 outParameterDecl '<> result;' #txt
Hs0 f13 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>getDataCategory</name>
    </language>
</elementInfo>
' #txt
Hs0 f13 83 307 26 26 -25 15 #rect
Hs0 f13 @|UdMethodIcon #fIcon
Hs0 f15 actionTable 'out=in;
' #txt
Hs0 f15 actionCode 'import dao.ProductDao;

ProductDao productDao = new dao.ProductDao();
in.listProduct = productDao.getByCategory(in.category.id);' #txt
Hs0 f15 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>get Data Category</name>
    </language>
</elementInfo>
' #txt
Hs0 f15 224 298 112 44 -49 -8 #rect
Hs0 f15 @|StepIcon #fIcon
Hs0 f16 109 320 224 320 #arcP
Hs0 f16 0 0.7072745572953059 0 0 #arcLabel
Hs0 f14 435 307 26 26 0 12 #rect
Hs0 f14 @|UdProcessEndIcon #fIcon
Hs0 f17 336 320 435 320 #arcP
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
Hs0 f13 mainOut f16 tail #connect
Hs0 f16 head f15 mainIn #connect
Hs0 f15 mainOut f17 tail #connect
Hs0 f17 head f14 mainIn #connect
