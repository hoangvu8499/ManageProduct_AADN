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
Ms0 @GridStep f11 '' #zField
Ms0 @PushWFArc f12 '' #zField
Ms0 @PushWFArc f2 '' #zField
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
Ms0 f0 83 51 26 26 -16 15 #rect
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
Ms0 f3 83 395 26 26 -15 15 #rect
Ms0 f3 @|UdEventIcon #fIcon
Ms0 f4 211 395 26 26 0 12 #rect
Ms0 f4 @|UdExitEndIcon #fIcon
Ms0 f5 109 408 211 408 #arcP
Ms0 f6 actionTable 'out=in;
' #txt
Ms0 f6 192 170 112 44 0 -8 #rect
Ms0 f6 @|StepIcon #fIcon
Ms0 f7 guid 178620327317A79C #txt
Ms0 f7 method method() #txt
Ms0 f7 inParameterDecl '<> param;' #txt
Ms0 f7 outParameterDecl '<> result;' #txt
Ms0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>method()</name>
    </language>
</elementInfo>
' #txt
Ms0 f7 91 179 26 26 -25 15 #rect
Ms0 f7 @|UdMethodIcon #fIcon
Ms0 f8 387 179 26 26 0 12 #rect
Ms0 f8 @|UdProcessEndIcon #fIcon
Ms0 f9 117 192 192 192 #arcP
Ms0 f10 304 192 387 192 #arcP
Ms0 f11 actionTable 'out=in;
' #txt
Ms0 f11 actionCode 'import dao.CartDao;
import model.UserEntity;
import dao.UserDao;
import dao.CategoryDao;
import dao.ProductDao;
import model.Product;

UserDao userDao = new dao.UserDao();
ProductDao productDao = new dao.ProductDao();
CategoryDao categoryDao = new dao.CategoryDao();
CartDao cartDao = new dao.CartDao();
 // dang mac dinh user login co id = 1;
UserEntity userLogin = userDao.findById(1);
in.cart = cartDao.getNewCart(userLogin.id);' #txt
Ms0 f11 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Get data Header</name>
    </language>
</elementInfo>
' #txt
Ms0 f11 168 42 112 44 -45 -8 #rect
Ms0 f11 @|StepIcon #fIcon
Ms0 f12 109 64 168 64 #arcP
Ms0 f2 280 64 387 64 #arcP
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
Ms0 f0 mainOut f12 tail #connect
Ms0 f12 head f11 mainIn #connect
Ms0 f11 mainOut f2 tail #connect
Ms0 f2 head f1 mainIn #connect
