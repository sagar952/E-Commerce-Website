


alert("ready");
function add_to_cart(pId, pName, pPrice)
{

    let cart = localStorage.getItem("cart");
// by default cart is null
    if (cart == null)
    {
        //new cart add
        var products = [];
        let product = {productId: pId, productName: pName, productQuantity: 1, productPrice: pPrice};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("product is added first time");

    } else
    {
        //user already present
        var pcart = JSON.parse(cart);
        //call back function in this function one by one compare id if match reutrn old card
        let oldproduct = pcart.find((item) => item.productId == pId);
        if (oldproduct)
        {
            //old product then increase quantity
            oldproduct.productQuantity = oldproduct.productQuantity + 1;
            // map use for traversing 
            pcart.map((item) =>
            {
                if (item.productId == oldproduct.productId)
                {
//            user already present waaala user now now update in user quanttity increase
                    item.productQunatity = oldproduct.productQuantity;
                }

            });
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product is increased");

        } else
        {
            //otherwise not old  mean differnet new card then add product
            let product = {productId: pId, productName: pName, productQuantity: 1, productPrice: pPrice};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product is added");
        }

    }

    updateCart();

}
//update function
function updateCart()
{
    var cartstring = localStorage.getItem("cart");
//convert into object
    var cart = JSON.parse(cartstring);
////check cart is null and length 0 then show message
    if (cart == null || cart.length == 0)
    {
        //mean no item in cart
        console.log("cart is empty");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart does not have any items</h3>");
        //if data is null then disable button
        $(".checkout-btn").attr('disabled',true);

    } else
    {
        //mean item is present in cart
        console.log("card is present");
        $(".cart-items").html(`(${cart.length})`);
        //create table for show the data
        let table = `

<table class='table'>
        <thead class='thead-light'>
      <tr>
        <th>Item Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total Price</th>
        <th>Action</th>
        </tr>

</thead>

`;
       
        //traverse one by one items
        cart.map((item) => {

            table += `
                <tr>
            <td>${item.productName}</td>
            <td>${item.productPrice}</td>
            <td>${item.productQuantity}</td>
            <td>${item.productPrice * item.productQuantity}</td>
            <td><button class='btn btn-danger' onclick='deleteCart(${item.productId})'>Remove</button></td>
            </tr>  
  `;

        });

        table = table + `</table>`;
        //end of table  and insert data of table in cart body
        $(".cart-body").html(table);
  //if atleast one card then enable mmean disabled false 
        $(".checkout-btn").attr('disabled',false);
  
        //map through travers and fill data in table

    }
}

//delete cart
function deleteCart(pid)
{
    //first get the cart it is in string format
   let cartInString=localStorage.getItem("cart");
    //convert into object 
    cart=JSON.parse(cartInString);
    //filter the cart and match the product id and reutrn new cart
    let newcart=cart.filter((items)=>items.productId!=pid)
    
    localStorage.setItem("cart",JSON.stringify(newcart));
    updateCart();
    
}

//function for go from checkout button to checkout servlet
function gotocheckout()
{
    //location use for redirect to another page
    window.location="checkout.jsp";
}


$(document).ready(function () {

    updateCart();
});