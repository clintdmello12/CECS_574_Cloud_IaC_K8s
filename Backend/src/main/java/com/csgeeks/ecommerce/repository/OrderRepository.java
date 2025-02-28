package com.csgeeks.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.csgeeks.ecommerce.model.Cart;
import com.csgeeks.ecommerce.model.Order;
import com.csgeeks.ecommerce.model.User;

import java.util.List;

@Repository
public interface OrderRepository  extends JpaRepository<Order, Integer> {
    List<Order> findAllByUserOrderByCreatedDateDesc(User user);

}
