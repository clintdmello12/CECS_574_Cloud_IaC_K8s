package com.csgeeks.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.csgeeks.ecommerce.model.OrderItem;

public interface OrderItemsRepository extends JpaRepository<OrderItem,Integer> {
}
