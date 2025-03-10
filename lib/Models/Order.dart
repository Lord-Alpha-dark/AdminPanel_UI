class Order {
UserId? userId;
String? orderDate;
String? orderStatus;
List<Items>? items;
String? sId;
double? totalPrice;
ShippingAddress? shippingAddress;
String? paymentMethod;
CouponCode? couponCode;
OrderTotal? orderTotal;
String? trackingUrl;
int?iV;

Order({
this.userId,
this.orderDate,
this.orderStatus,
this.items,
this.totalPrice,
this.shippingAddress,
this.paymentMethod,
this.couponCode,
this.orderTotal,
this.trackingUrl,
this.iV
});

Order.fromJson(Map<String,dynamic> json)
{
  userId= json['userId']!=null? new UserId.fromJson(json['userId']): null;
  orderDate=json['orderDate'];
  orderStatus=json['orderStatus'];
  if(json['items']!=null)
  {
    items=[];
    json['items'].forEach((v)
    {
       items!.add(new Items.fromJson(v));
    }
    );
  }
  totalPrice=json['totalPrice'];
  shippingAddress=json['shippingAddress']!=null?new ShippingAddress.fromJson(json['shippingAddress']):null;
  paymentMethod=json['paymentMethod'];
  couponCode=json['couponCode']!=null?new CouponCode.fromJson(json['couponCode']):null;
  orderTotal=json['orderTotal']!=null?new OrderTotal.fromJson(json['orderTotal']):null;
  trackingUrl=json['trackingUrl'];
  iV = json['__v'];
   sId = json['_id'];
}

Map<String,dynamic> toJson(){
  final Map<String,dynamic> data=new Map<String,dynamic>();
  if(this.userId!=null)
  {
    data['userId']=this.userId!.toJson();
  }
  data['orderDate']=this.orderDate;
  data['orderStatus']=this.orderStatus;
  if(this.items!=null)
  {
    data['items']=this.items!.map((e) => e.toJson()).toList();
  }
  data['totalPrice']=this.totalPrice;
  if(this.shippingAddress!=null)
  {
    data['shippingAddress']=this.shippingAddress!.toJson();
  }
  data['paymentMethod']=this.paymentMethod;
  if(this.couponCode!=null)
  {
    data['couponCode']=this.couponCode!.toJson();

  }
  if(this.orderTotal!=null)
  {
    data['orderTotal']=this.orderTotal!.toJson();
  }
  data['trackingUrl']=this.trackingUrl;
  data['__v'] = this.iV;
  
  return data;
}

}

class UserId{
  String? sId;
  String? name;

  UserId({this.sId,this.name});

  UserId.fromJson(Map<String,dynamic> json)
  {
    sId=json['_id'];
    name=json['name'];
  }

  Map<String,dynamic> toJson(){
     final Map<String, dynamic> data = new Map<String, dynamic>();
      data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Items{

  String? productId;
  String? productName;
  int? quantity;
  int?price;
  String?variant;
  String?sId;

  Items({
    this.productId,
    this.productName,
    this.quantity,
    this.price,
    this.variant,
    this.sId
  });

  Items.fromJson(Map<String,dynamic> json)
  {
    productId=json['productId'];
    productName=json['productName'];
    quantity=json['quantity'];
    price=json['price'];
    variant=json['variant'];
    sId = json['_id'];
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data=new Map<String,dynamic>();
      data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['variant'] = this.variant;
    data['_id'] = this.sId;
    return data;

  }
}

class ShippingAddress{

  String? phone;
  String? street;
  String? city;
  String? state;
  String? postalCode;
  String? country;

  ShippingAddress(
      {this.phone,
        this.street,
        this.city,
        this.state,
        this.postalCode,
        this.country});

        ShippingAddress.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    street = json['street'];
    city = json['city'];
    state = json['State'];
    postalCode = json['postalCode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['street'] = this.street;
    data['city'] = this.city;
    data['State'] = this.state;
    data['postalCode'] = this.postalCode;
    data['country'] = this.country;
    return data;
  }
}

class CouponCode{
   String? sId;
  String? couponCode;
  String? discountType;
  int? discountAmount;

  CouponCode(
      {this.sId, this.couponCode, this.discountType, this.discountAmount});

  CouponCode.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    couponCode = json['name'];
    discountType = json['DiscountType'];
    discountAmount = json['discountAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.couponCode;
    data['DiscountType'] = this.discountType;
    data['discountAmount'] = this.discountAmount;
    return data;
  }
}

class OrderTotal {
  double? subtotal;
  double? discount;
  double? total;

  OrderTotal({this.subtotal, this.discount, this.total});

  OrderTotal.fromJson(Map<String, dynamic> json) {
    subtotal = json['subtotal']?.toDouble();
    discount = json['discount']?.toDouble();
    total = json['total']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subtotal'] = this.subtotal;
    data['discount'] = this.discount;
    data['total'] = this.total;
    return data;
  }
}
