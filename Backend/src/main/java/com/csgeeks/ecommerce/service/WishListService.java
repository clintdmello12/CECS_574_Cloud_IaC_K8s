package com.csgeeks.ecommerce.service;

import java.util.List;
import javax.transaction.Transactional;

import com.csgeeks.ecommerce.model.WishList;
import com.csgeeks.ecommerce.repository.WishListRepository;

import org.springframework.stereotype.Service;


@Service
@Transactional
public class WishListService {

    private final WishListRepository wishListRepository;

    public WishListService(WishListRepository wishListRepository) {
        this.wishListRepository = wishListRepository;
    }

    public void createWishlist(WishList wishList) {
        wishListRepository.save(wishList);
    }

    public List<WishList> readWishList(Integer userId) {
        return wishListRepository.findAllByUserIdOrderByCreatedDateDesc(userId);
    }
}
