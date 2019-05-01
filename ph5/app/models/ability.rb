class Ability
  include CanCan::Ability

  def initialize(user)
    # set user to new User if not logged in
    user ||= User.new # i.e., a guest user

    # set authorizations for different user roles
    if user.role? :admin
      # they get to do it all
      can :manage, :all

    elsif user.role? :baker
      can :read, Item
      can :show, Item
      can :index, Order

      # they can read their own profile
      can :show, User do |u|
        u.id == user.id
      end

      # they can update their own profile
      can :update, User do |u|
        u.id == user.id
      end

    elsif user.role? :shipper
      can :read, Item
      can :show, Item
      can :index, Order
      can :show, Order
      can :show, Address

      # they can read their own profile
      can :show, User do |u|
        u.id == user.id
      end

      # they can update their own profile
      can :update, User do |u|
        u.id == user.id
      end

    elsif user.role? :customer 
      can :read, Item
      can :show, Item
      can :index, Order
      can :checkout, Order
      can :create, Order 
      can :add_to_cart, Order 
      can :create, Address 
      can :index, Address 

      # they can read their own order 
      can :show, Order do |this_order|  
        my_orders = user.customer.orders.map(&:id)
        my_orders.include? this_order.id 
      end

      can :show, Address do |this_address|  
        my_addresses = user.customer.addresses.map(&:id)
        my_addresses.include? this_address.id 
      end

      can :update, Address do |this_address|  
        my_addresses = user.customer.addresses.map(&:id)
        my_addresses.include? this_address.id 
      end

      # they can see and update their own profile
      can :show, User do |u|  
        u.id == user.id
      end

      can :update, User do |u|
        u.id == user.id
      end

      can :show, Customer do |c|  
        c.user.id == user.id
      end

      can :update, Customer do |c|
        c.user.id == user.id
      end

      else
        can :show, Item
        can :index, Item 
        can :create, Customer
    end
  end
end
