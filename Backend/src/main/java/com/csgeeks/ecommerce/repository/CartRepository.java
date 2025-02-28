package com.csgeeks.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.csgeeks.ecommerce.model.Cart;
import com.csgeeks.ecommerce.model.User;
import com.csgeeks.ecommerce.model.WishList;

import java.util.List;
@Repository
public interface CartRepository extends JpaRepository<Cart, Integer> {

    List<Cart> findAllByUserOrderByCreatedDateDesc(User user);

    List<Cart> deleteByUser(User user);

}

