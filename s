
[1mFrom:[0m /home/ec2-user/environment/nagano-cake/app/controllers/public/orders_controller.rb:12 Public::OrdersController#check:

     [1;34m8[0m: [32mdef[0m [1;34mcheck[0m
     [1;34m9[0m:   @order = [1;34;4mOrder[0m.new(order_params)
    [1;34m10[0m:    binding.pry
    [1;34m11[0m:   
 => [1;34m12[0m:   [32mif[0m params[[33m:order[0m][[33m:address_number[0m] == [31m[1;31m"[0m[31m0[1;31m"[0m[31m[0m
    [1;34m13[0m:      @order.name = current_customer.last_name + current_customer.first_name
    [1;34m14[0m:      @order.address = current_customer.customer_address
    [1;34m15[0m:      
    [1;34m16[0m:   [32melsif[0m params[[33m:order[0m][[33m:address_number[0m] == [31m[1;31m"[0m[31m1[1;31m"[0m[31m[0m
    [1;34m17[0m:       [32mif[0m [1;34;4mAddress[0m.exists?([35mname[0m: params[[33m:order[0m][[33m:registered[0m])
    [1;34m18[0m:         @order.name = [1;34;4mAddress[0m.find(params[[33m:order[0m][[33m:registered[0m]).name
    [1;34m19[0m:         @order.address = [1;34;4mAddress[0m.find(params[[33m:order[0m][[33m:registered[0m]).address
    [1;34m20[0m:       [32melse[0m
    [1;34m21[0m:         render [33m:new[0m
    [1;34m22[0m:       [32mend[0m
    [1;34m23[0m:       
    [1;34m24[0m:   [32melsif[0m params[[33m:order[0m][[33m:address_number[0m] == [31m[1;31m"[0m[31m2[1;31m"[0m[31m[0m
    [1;34m25[0m:       address_new = current_customer.addresses.new(address_params)
    [1;34m26[0m:       [32mif[0m address_new.save 
    [1;34m27[0m:       [32melse[0m
    [1;34m28[0m:       render [33m:new[0m
    [1;34m29[0m:       [32mend[0m
    [1;34m30[0m:   [32melse[0m
    [1;34m31[0m:     redirect_to orders_new_path
    [1;34m32[0m:   [32mend[0m
    [1;34m33[0m:   @cart_items = current_customer.cart_items.all
    [1;34m34[0m:   @total = @cart_items.inject([1;34m0[0m) { |sum, item| sum + item.sum_price }
    [1;34m35[0m:   
    [1;34m36[0m: [32mend[0m

